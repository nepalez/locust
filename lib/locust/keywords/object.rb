module Locust::Keywords
  #
  # Represents dereferenced (without `$ref`) OpenAPI 2.0 object schema
  #
  # @see Keywords Object in OpenAPI Specification
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#schemaObject
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#schemaObject
  #
  # @see Validation Keywords for Any Instance Type in JSON Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.1
  #
  class Object < Locust::Schema
    require_relative "object/validator"

    option :additionalProperties, AdditionalProperties
    option :allOf,                AllOf
    option :anyOf,                AnyOf
    option :default,              Default
    option :enum,                 Enum
    option :exclusiveMaximum,     ExclusiveMaximum
    option :exclusiveMinimum,     ExclusiveMinimum
    option :format,               Format
    option :items,                Items
    option :maxItems,             MaxItems
    option :maxLength,            MaxLength
    option :maxProperties,        MaxProperties
    option :maximum,              Maximum
    option :minItems,             MinItems
    option :minLength,            MinLength
    option :minProperties,        MinProperties
    option :minimum,              Minimum
    option :multipleOf,           MultipleOf
    option :not,                  Not
    option :nullable,             Nullable
    option :oneOf,                OneOf
    option :pattern,              Pattern
    option :properties,           Properties
    option :required,             Required
    option :type,                 Type
    option :uniqueItems,          UniqueItems
    option :xml,                  Xml

    validator Validator
  end
end
