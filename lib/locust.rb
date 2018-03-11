require "dry-initializer"

#
# Edge-case examples generator for mutation testing of public APIs
#
class Locust
  # Exception to be risen when object schema is invalid
  InvalidSchemaError = Class.new(ArgumentError)
  # Result of generation if the schema object forbids the case
  NotApplicableError = Class.new(StandardError)

  require_relative "locust/coercion"
  require_relative "locust/schema"

  require_relative "locust/config"
  require_relative "locust/validators"
  require_relative "locust/schema_object"

  #
  # Builds and configures the generator at once
  #
  # @return [Locust]
  #
  # By default the [Locust] will try mutating generated values
  # to break API under the test.
  #
  # @example
  #   builder = Locust.configure do |config|
  #     config.format "phone" do |f|
  #       f.generator { "+7 (916) 111-11-11" }
  #     end
  #   end
  #
  #   examples = builder[type: "string", format: "phone"]
  #
  #   # Uses the sample without a mutation
  #   examples.sample # => "+7 (916) 100-11-11"
  #
  #   # Takes one of digits from a generated phone, and mutates the thing
  #   examples.sample # => "+0 (000) 000-00-00"
  #
  # But in some cases a format requires values to satisfy implicit conditions,
  # (described in docs etc.)
  #
  # For example, the `existing_phone` format could mean usage of the existing
  # phones only (pre-checked via special online services etc.).
  # We cannot be sure that a mutation would provide an acceptable value.
  #
  # In such a case you should ad option `immutable: true` to tell the [Locust]
  # not to mutate generated value in any way.
  #
  # @example
  #   builder = Locust.configure do |config|
  #     config.format "existing_phone" do |f|
  #       f.generator(immutable: true) { "+7 (916) 111-11-11" }
  #     end
  #   end
  #
  #   examples = builder[type: "string", format: "existing_phone"]
  #
  #   # Uses generated values as they are
  #   examples.to_a # => ["+7 (916) 111-11-11"]
  #
  # **Warning**
  #
  # When in addition to immutable format a specification
  # contains other restrictions like `pattern`, `minLength: 0` etc.,
  # the [Locust] will use its own edge cases that satisfiy the pattern --
  # in addition to cases generated using a formatter.
  #
  # @example
  #   builder = Locust.configure do |config|
  #     config.format "existing_phone" do |f|
  #       f.generator(immutable: true) { "+7 (916) 111-11-11" }
  #     end
  #   end
  #
  #   phone = builder[type: "string", format: "existing_phone", minLength: 0]
  #
  #   # uses generated value as is
  #   phone.sample # => "+7 (916) 111-11-11"
  #
  #   # uses edge case not backed by the generator following `minLength: 0`
  #   phone.sample # => ""
  #
  # In a sense, an additional restriction makes a whole specification weaker,
  # and opens it to various mutations.
  #
  # @example Define as many generator for every format as you need
  #   require "faker"
  #
  #   builder = Locust.configure do |c|
  #     c.format "human_name" do |f|
  #       f.generator(immutable: true) { Faker::Name.name }
  #       f.generator { Faker::Name.name_with_middle }
  #     end
  #   end
  #
  # @example Add new generators to predefined format
  #   require "faker"
  #
  #   builder = Locust.configure do |c|
  #     c.format "human_name" do |f|
  #       f.generator(immutable: true) { Faker::Name.name }
  #     end
  #
  #   builder.configure do |c|
  #     c.format "human_name" do |f|
  #       f.generator { Faker::Name.name_with_middle }
  #     end
  #   end
  #
  def self.configure
    new.configure { yield }
  end

  # @private
  attr_reader :config

  #
  # Configures the examples generator
  # @return [self]
  # @example
  #   require "faker"
  #
  #   builder = Locust.new
  #   builder.configure do |c|
  #     c.format "human_name" do |f|
  #       f.generator(immutable: true) { Faker::Name.name }
  #       f.generator { Faker::Name.name_with_middle }
  #     end
  #   end
  #
  def configure
    yield(config)
    self
  end

  private

  def initialize
    @config = Locust::Config.new
  end
end
