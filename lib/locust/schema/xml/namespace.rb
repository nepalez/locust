module Locust::Schema
  #
  # @private
  # @see The 'namespace' keyword in  the 'xml' part of object schema
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#xml-object
  #
  class XML::Namespace < Locust::Struct
    keyword "namespace"
  end
end
