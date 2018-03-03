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
  end
end
