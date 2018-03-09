class Locust
  #
  # Namespace for containers of object schema definition and its parts
  #
  # @see
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#schemaObject
  #   https://datatracker.ietf.org/doc/draft-handrews-json-schema-validation/?include_text=1
  #
  module Schema
    require_relative "schema/coercion"
    require_relative "schema/type"
    require_relative "schema/format"
    require_relative "schema/pattern"
    require_relative "schema/enum"
    require_relative "schema/xml"
    require_relative "schema/object"
  end
end
