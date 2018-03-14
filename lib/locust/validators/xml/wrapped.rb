class Locust
  module Validators
    #
    # @private
    # @see The 'wrapped' keyword in  the 'xml' part of object schema
    #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#xml-object
    #
    class XML::Wrapped < Base
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
