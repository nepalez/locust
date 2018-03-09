class Locust
  #
  # Contains configurable enumerator of examples for an [#object_schema]
  #
  class Examples
    #
    # @!attribute [r] config
    # @return [Locust::Config] The configuration defining custom formats
    #
    attr_reader :config
    #
    # @!attribute [r] object_schema
    # @return [Object] The object schema describing the examples to generate
    #
    attr_reader :object_schema

    #
    # Randomly generated value applicable to the [#object_schema]
    #
    # @return [Object]
    #
    def sample
      loop do
        value = @edge_cases.sample.call
        return value unless value == NotApplicableError
      end
    end

    private

    def initialize(config, object_schema)
      @config        = config
      @object_schema = object_schema
      @edge_cases    = EdgeCases.new(object_schema)
      @enumerator    = Enumerator.new { |yielder| loop { yielder << sample } }

      return if @edge_cases.any?
      raise "Cannot find a generator applicable to the schema #{schema}"
    end

    def respond_to_missing?(name, *)
      @enumerator.respond_to? name
    end

    def method_missing(*args, &block)
      return super unless respond_to_missing?(*args)
      @enumerator.public_send(*args, &block)
    end
  end
end
