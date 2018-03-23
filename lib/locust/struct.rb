class Locust
  #
  # Defines a nested struct with references to the parent and chidren,
  # and methods to coerce and validate the initialized instance.
  #
  # It uses [Struct::Definition] to specify methods to
  # - set the name of the nested struct in error messages
  # - describe a proper format of the current struct in error messages
  # - coerce the assigned value to the hash of options
  # - validate the initialized struct
  #
  # Its method [#error_messages] collects all validation errors,
  # which are built using `name` and `describe` definitions.
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
    extend Dry::Initializer
    param :parent # back reference to the parent object

    require_relative "struct/definition"

    class << self
      #
      # @!method option(name, type = nil, default: nil)
      # Adds an optional keyword to the current schema
      #
      # @param  [Symbol] name The name of the keyword
      # @param  [Locust::Coercion] type The type coercer
      # @option [Proc] :default The default value generator
      #
      # @return [self]
      #
      def option(name, type = nil, **opts)
        attribute = name.to_s.gsub(/([a-z])([A-Z])/, '\1_\2').downcase
        super(name, type, as: attribute, optional: true, **opts)
        self
      end

      #
      # Factory method to be used in option coercers
      #
      # @param  [Object] data   Any data to assign to the struct
      # @param  [Locust::NestedStruct] parent Back reference to the parent
      # @return [Locust::NestedStruct]
      #
      def call(data, parent)
        new(parent, data)
      end

      #
      # Builds an instance of nested struct
      #
      # @param  [Locust::NestedStruct] parent Back reference to the parent
      # @param  [Hash] data Any data to assign to the struct
      # @return [Locust::NestedStruct]
      #
      def new(parent, data)
        return data if data.is_a? self
        data = data.is_a?(Hash) ? symbolize_keys(data) : {}
        super(parent, data)
      end

      #
      # @!attribute [r] definition
      #
      # @return [Locust::Struct::Definition] the definition of the struct
      #
      attr_reader :definition

      private

      def struct(&block)
        @definition = Definition.new(&block)
      end

      def symbolize_keys(value)
        Hash(value).each_with_object({}) { |(k, v), o| o[k.to_sym] = v }
      rescue
        raise InvalidSchemaError,
              "Invalid value #{value.inspect} for the schema." \
              " The value MUST be a hash."
      end
    end

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
    # The ordered list of ancestor structs from the root
    #
    # @return [Array<Locust::Struct>]
    #
    def ancestors
      @ancestors ||= \
        parent.is_a?(Locust::Struct) ? parent.ancestors + [parent] : []
    end

    #
    # Returns a full path to the current struct
    #
    # @return [String]
    #
    def full_path
      @full_path ||= (ancestors + [self])
                     .map { |item| item.class.definition&.part(item) }
                     .compact
                     .join(".")
    end
  end
end
