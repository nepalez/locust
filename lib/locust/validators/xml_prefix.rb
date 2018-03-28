module Locust::Validators
  #
  # Checks the 'xml.prefix' keyword definition
  #
  class XmlPrefix < Base
    validate :source_is_a_string
    validate :source_is_not_empty

    private

    def source_is_a_string
      errors << message unless source.is_a?(String)
    end

    def source_is_not_empty
      return if errors.any?
      errors << message if source == ""
    end

    def message
      "#{super} The value of this keyword MUST be a string." \
      " The string MUST not be empty."
    end
  end
end
