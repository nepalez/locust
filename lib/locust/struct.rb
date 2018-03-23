class Locust
  #
  # Defines a nested struct with references to the parent and chidren,
  # and methods to coerce and validate the initialized instance.
  #
  # @example
  #   class Item < Struct
  #     option :index, proc(&:to_i)
  #     option :value, SchemaObject
  #
  #     struct do
  #       name     { index ? "items[#{index}]" : "items" }
  #       describe "The value of this keyword MUST be a valid schema object."
  #     end
  #   end
  #
  # @example
  #   class Format < Struct
  #     option :value
  #
  #     struct do
  #       name     "format"
  #       describe "The value of this keyword MUST be non-empty string."
  #       coerce   { |value| value.to_s if value.is_a? Symbol }
  #       coerce   { |value| { value: value } }
  #       validate { value.is_a? String }
  #       validate { value != "" }
  #     end
  #   end
  #
  class Struct
    require_relative "struct/definition"
    require_relative "struct/dsl"

    extend DSL, Dry::Initializer
    param :parent # back reference to the parent object

    #
    # The hash of known options assigned to the instance
    #
    # @return [Hash<Symbol, Object>]
    #
    def options
      @options ||= self.class
                       .dry_initializer.attributes(self)
                       .reject { |key, _| key == :parent }
    end

    #
    # The list of children structures
    #
    # @return [Array<Locust::Struct>]
    #
    def children
      @children ||= options.values.select { |value| value.is_a? Locust::Struct }
    end

    #
    # The ordered list of all the parent structs
    #
    # @return [Array<Locust::Struct>]
    #
    def parents
      @parents ||= parent.is_a?(Locust::Struct) ? parent.parents + [parent] : []
    end
  end
end
