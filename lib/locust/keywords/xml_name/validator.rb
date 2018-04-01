class Locust::Keywords::XmlName
  #
  # Checks the 'xml.name' keyword definition
  #
  class Validator < Locust::Validator
    validate :parent_is_an_xml
    validate :source_is_a_string
    validate :source_is_not_empty

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

    def source_is_not_empty
      return if errors.any?
      return unless source == ""
      errors << message("Its value MUST not be empty.")
    end
  end
end
