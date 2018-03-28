module Locust::Validators
  #
  # Checks the 'xml.wrapped' keyword definition
  #
  class XmlWrapped < Base
    validate :source_is_a_boolean

    private

    def source_is_a_boolean
      return if errors.any?
      errors << message unless [true, false].include? source
    end

    def message
      "#{super} The value of this keyword MUST be a boolean."
    end
  end
end
