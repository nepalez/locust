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
      # rubocop: disable Metrics/LineLength
      option :properties, Validators::Properties, optional: true
      option :required,   Validators::Required,   default: -> { [] }
      option :additionalProperties, SchemaObject, optional: true, as: :additional_properties
      option :maxProperties, Validators::MaxProperties, optional: true, as: :max_properties
      option :minProperties, Validators::MinProperties, optional: true, as: :min_properties
      # rubocop: enable Metrics/LineLength

      private

      def initialize(value = {})
        value = symbolize_keys(value)

        props = Hash value[:properties]
        value[:properties] = props.each_with_object({}) do |(k, v), o|
          o[k.to_sym] = v.merge(parent: self, name: k)
        end

        super(value)
      end
    end
  end
end
