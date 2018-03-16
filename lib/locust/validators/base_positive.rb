class Locust
  module Validators
    #
    # @private
    # @abstract
    # Base class for validators wrapping positive values
    #
    class BasePositive < BaseNumber
      private

      def initialize(parent, value)
        super
        raise_error(value) if negative?
      end

      def raise_error(value)
        raise InvalidSchemaError,
              "Invalid value #{value.inspect} for the '#{keyword}' keyword." \
              " The value of this keyword MUST be a non-negative integer."
      end
    end
  end
end
