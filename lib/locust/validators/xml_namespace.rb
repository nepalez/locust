module Locust::Validators
  #
  # Checks the 'xml.namespace' keyword definition
  #
  class XmlNamespace < Base
    validate :source_is_a_string
    validate :uri_is_absolute

    private

    def source_is_a_string
      return if source.is_a?(String)
      errors << message("Its value MUST be a string.")
    end

    def uri_is_absolute
      return if errors.any?
      return if uri.host
      errors << message("Its value MUST be in the form of an absolute URI.")
    end
  end
end
