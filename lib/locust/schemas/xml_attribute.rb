module Locust::Schemas
  #
  # @private
  # @see The 'attribute' keyword in  the 'xml' part of object schema
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#xml-object
  #
  class XmlAttribute < Base
    keyword "attribute"
  end
end
