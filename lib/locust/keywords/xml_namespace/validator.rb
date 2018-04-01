class Locust::Keywords::XmlNamespace
  #
  # Checks the 'xml.namespace' keyword definition
  #
  class Validator < Locust::Validator
    validate :parent_is_an_xml
    validate :source_is_a_string
    validate :uri_is_absolute

    private

    def parent_is_an_xml
      return if parent.is_a? Locust::Keywords::Xml
      errors << message("This keyword MAY be added to xml definition only.")
    end

    def source_is_a_string
      return if errors.any?
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
