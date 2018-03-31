module Locust::Schemas
  #
  # @private
  # @see The 'prefix' keyword in  the 'xml' part of object schema
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#xml-object
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#xmlObject
  #
  class XmlPrefix < Base
    keyword "prefix"
  end
end
