class Locust
  #
  # @abstract
  # Base class for OpenApi schemas
  #
  class Schema
    extend Dry::Initializer
    extend Coercion

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
