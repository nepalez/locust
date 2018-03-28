module Locust::Schemas
  #
  # @private
  # @see The 'namespace' keyword in  the 'xml' part of object schema
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#xml-object
  #
  class XmlNamespace < Base
    keyword "namespace"

    def uri
      @uri ||= URI source.to_s
    end
  end
end
