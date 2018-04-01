class Locust::Keywords::XmlWrapped
  #
  # Checks the 'xml.wrapped' keyword definition
  #
  class Validator < Locust::Validator
    validate :parent_is_an_xml
    validate :xml_describes_an_array
    validate :source_is_a_boolean

    private

    def parent_is_an_xml
      return if parent.is_a? Locust::Keywords::Xml
      errors << message("This keyword MAY be added to xml definition only.")
    end

    def xml_describes_an_array
      return if errors.any?
      return if object&.type.source == "array"
      errors << message("It MAY be used only for an array definition.")
    end

    def source_is_a_boolean
      return if errors.any?
      return if [true, false].include? source
      errors << message("Its value MUST be a boolean.")
    end

    def object
      @object ||= parent.parent if parent.parent.is_a? Locust::Keywords::Object
    end
  end
end
