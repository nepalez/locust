class Locust
  module Validators
    #
    # @private
    # @abstract
    # Base class for validators wrapping positive values
    #
    class BasePositive < Base
      private

      def initialize(value)
        raise_error(value) unless value.respond_to? :to_i
        super(value.to_i)
        raise_error(value) if negative?
        raise_error(value) unless to_s == value.to_s
      end

      def raise_error(value)
        keyword = self.class.name
        keyword[0].downcase!
        raise InvalidSchemaError,
              "Invalid value #{value.inspect} for the '#{keyword}' keyword." \
              " The value of this keyword MUST be a non-negative integer."
      end
    end
  end
end
