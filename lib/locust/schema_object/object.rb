class Locust
  class SchemaObject
    #
    # Describes objects of the 'object' type
    #
    # @see Schema Object in OpenAPI 2.0 specification
    #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#schema-object
    #
    # @see Validation Keywords for Objects in JSON Schema specification
    #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.5
    #
    class Object < SchemaObject
      option :properties,           Validators::Properties
      option :required,             Validators::Required
      option :additionalProperties, Validators::AdditionalProperties
      option :maxProperties,        Validators::MaxProperties
      option :minProperties,        Validators::MinProperties

      private

      def initialize(parent, value = {})
        value = symbolize_keys(value)

        props = Hash value[:properties]
        value[:properties] = props.each_with_object({}) do |(k, v), o|
          o[k.to_sym] = v.merge(parent: self, name: k)
        end

        super(parent, value)
      end
    end
  end
end
