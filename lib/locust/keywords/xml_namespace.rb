module Locust::Keywords
  #
  # @private
  # @see The 'namespace' keyword in  the 'xml' part of object schema
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#xml-object
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#xmlObject
  #
  class XmlNamespace < Locust::Schema
    require_relative "xml_namespace/validator"

    keyword   "namespace"
    validator Validator

    def uri
      @uri ||= URI source.to_s
    end
  end
end
