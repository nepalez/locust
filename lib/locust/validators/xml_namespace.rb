module Locust::Validators
  #
  # Checks the 'xml.namespace' keyword definition
  #
  class XmlNamespace < Base
    validate :source_is_a_string
    validate :uri_is_absolute

    private

    def source_is_a_string
      errors << message unless source.is_a?(String)
    end

    def uri_is_absolute
      return if errors.any?
      errors << message unless uri.host
    end

    def message
      "#{super} The value of this keyword MUST be a string." \
      " The string MUST be in the form of an absolute URI."
    end
  end
end
