class Locust
  #
  # @abstract
  # Base class for OpenApi schemas
  #
  class Schema
    extend Dry::Initializer
    extend Coercion

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
    def self.option(name, type = nil, **opts)
      attribute = name.to_s.gsub(/([a-z])([A-Z])/, '\1_\2').downcase
      super(name, type, as: attribute, optional: true, **opts)
      self
    end

    #
    # The hash of known options assigned to the instance
    #
    # @return [Hash<Symbol, Object>]
    #
    def options
      @options ||= self.class.dry_initializer.attributes(self)
    end

    private

    def symbolize_keys(value)
      self.class.send(:symbolize_keys, value)
    end
  end
end
