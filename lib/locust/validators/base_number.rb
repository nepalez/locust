class Locust
  module Validators
    #
    # @private
    # @abstract
    # Base class for validators wrapping numbers
    #
    class BaseNumber < Base
      private

      def initialize(value)
        raise_error(value) unless value.respond_to? :to_f
        super(value.to_f)
        raise_error(value) unless to_s == value.to_s || to_i == value.to_i
      end

      def raise_error(value)
        raise InvalidSchemaError,
              "Invalid value #{value.inspect} for the '#{keyword}' keyword." \
              " The value of this keyword MUST be a number."
      end
    end
  end
end
