class Locust::Keywords::XmlAttribute
  #
  # Checks the 'xml.attribute' keyword definition
  #
  class Validator < Locust::Validator
    validate :parent_is_an_xml
    validate :source_is_a_boolean

    private

    def parent_is_an_xml
      return if parent.is_a? Locust::Keywords::Xml
      errors << message("This keyword MAY be added to xml definition only.")
    end

    def source_is_a_boolean
      return if errors.any?
      return if [true, false].include? source
      errors << message("Its value MUST be a boolean.")
    end
  end
end
