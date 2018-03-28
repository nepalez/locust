module Locust::Validators
  #
  # Checks the 'allOf' keyword definition
  #
  class AllOf < Base
    validate :source_is_an_array
    validate :source_has_elements

    private

    def source_is_an_array
      errors << message unless source.is_a? Array
    end

    def source_has_elements
      return if errors.any?
      errors << message if source.count.zero?
    end

    def message
      "#{super} This keyword's value MUST be an array." \
      " This array MUST have at least one element."
    end
  end
end
