class Locust
  module Validators
    #
    # @private
    # @abstract
    # Base class for validators wrapping non-empty strings
    #
    class BaseString < Base
      private

      def initialize(value)
        super value.to_s
        raise_error(value) if empty?
      end

      def raise_error(value)
        raise InvalidSchemaError,
              "Invalid value #{value.inspect} for the 'format' keyword." \
              " The value of this keyword MUST be a non-empty string."
      end
    end
  end
end
