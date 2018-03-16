class Locust
  module Validators
    #
    # @private
    # @abstract
    # Base class for validators wrapping booleans
    #
    class BaseBoolean < Base
      private

      def initialize(parent, value)
        case value.to_s
        when "true"  then super(parent, true)
        when "false" then super(parent, false)
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
