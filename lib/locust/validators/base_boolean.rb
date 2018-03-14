class Locust
  module Validators
    #
    # @private
    # @abstract
    # Base class for validators wrapping booleans
    #
    class BaseBoolean < Base
      private

      def initialize(value)
        case value.to_s
        when "true"  then super(true)
        when "false" then super(false)
        else              raise_error(value)
        end
      end

      def raise_error(value)
        raise InvalidSchemaError,
              "Invalid value #{value.inspect} for the '#{keyword}' keyword." \
              " The value of this keyword MUST be a boolean."
      end
    end
  end
end
