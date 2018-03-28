module Locust::Validators
  #
  # Checks the 'enum' keyword definition
  #
  class Enum < Base
    validate :source_is_an_array
    validate :source_has_elements
    validate :source_elements_are_unique

    private

    def source_is_an_array
      errors << message unless source.is_a? Array
    end

    def source_has_elements
      return if errors.any?
      errors << message if elements.zero?
    end

    def source_elements_are_unique
      return if errors.any?
      errors << message if source.uniq.count != elements
    end

    def elements
      @elements ||= Array(source).count
    end

    def message
      "#{super} The value of this keyword MUST be an array." \
      " This array MUST have at least one element." \
      " Elements in the array MUST be unique."
    end
  end
end
