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
      option :properties,           Keywords::Properties
      option :required,             Keywords::Required
      option :additionalProperties, Keywords::AdditionalProperties
      option :maxProperties,        Keywords::MaxProperties
      option :minProperties,        Keywords::MinProperties

      private

      def initialize(parent, properties: nil, **opts)
        properties = Hash(properties).each_with_object({}) do |(k, v), o|
          o[k.to_sym] = v.merge(name: k)
        end

        super(parent, properties: properties, **opts)
      end
    end
  end
end
