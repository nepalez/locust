class Locust
  class Struct
    #
    # Class-level DSL to describe a Struct, namely:
    # - options
    # - constructors [.new] and [.call] for using structs as value coercers
    # - definition for coercion and validation
    #
    module DSL
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
      # Define class-level properties of the struct
      #
      # @param [Proc] block The definition
      # @return [self]
      #
      def struct(&block)
        self.tap { definition.instance_exec(&block) }
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
        data = prepare(data)
        data = data.is_a?(Hash) ? symbolize_keys(data) : {}

        super(parent, data)
      end

      #
      # Builder method to be used in option coercers
      #
      # @param  [Object] data   Any data to assign to the struct
      # @param  [Locust::NestedStruct] parent Back reference to the parent
      # @return [Locust::NestedStruct]
      #
      def call(data, parent)
        new(parent, data)
      end

      private

      def symbolize_keys(value)
        Hash(value).each_with_object({}) { |(k, v), o| o[k.to_sym] = v }
      end

      def definition
        @definition ||= Definition.new
      end

      def respond_to_missing?(name, *)
        definition.respond_to? name
      end

      def method_missing(*args, &block)
        respond_to_missing?(*args) ? definition.send(*args, &block) : super
      end
    end
  end
end
