class Locust
  #
  # @abstract
  # Defines a struct with references to the parent and chidren
  #
  class Struct
    extend Dry::Initializer
    param :parent # back reference to the parent object

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

      private

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
  end
end
