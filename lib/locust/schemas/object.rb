module Locust::Schemas
  #
  # Represents dereferenced (without `$ref`) OpenAPI 2.0 object schema
  #
  # @see Schemas Object in OpenAPI Specification
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#schemaObject
  #
  # @see Validation Keywords for Any Instance Type in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.1
  #
  class Object < Base
    option :additionalProperties, AdditionalProperties
    option :allOf,                AllOf
    option :const,                Const
    option :default,              Default
    option :enum,                 Enum
    option :example,              Example
    option :exclusiveMaximum,     ExclusiveMaximum
    option :exclusiveMinimum,     ExclusiveMinimum
    option :format,               Format
    option :items,                Items
    option :maxItems,             MaxItems
    option :maxProperties,        MaxProperties
    option :maximum,              Maximum
    option :minItems,             MinItems
    option :minProperties,        MinProperties
    option :minimum,              Minimum
    option :multipleOf,           MultipleOf
    option :properties,           Properties
    option :required,             Required
    option :type,                 Type
    option :uniqueItems,          UniqueItems
    option :xml,                  Xml
  end
end
