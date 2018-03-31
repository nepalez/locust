class Locust::Keywords::XmlAttribute
  #
  # Checks the 'xml.attribute' keyword definition
  #
  class Validator < Locust::Validator
    validate :source_is_a_boolean

    private

    def source_is_a_boolean
      return if errors.any?
      return if [true, false].include? source
      errors << message("Its value MUST be a boolean.")
    end
  end
end
