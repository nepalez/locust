module Locust::Validators
  #
  # Checks the 'required' keyword definition
  #
  class Required < Base
    validate :parent_is_typed
    validate :parent_describes_an_object
    validate :source_is_an_array
    validate :source_has_elements
    validate :source_elements_are_strings
    validate :source_elements_are_unique

    private

    def parent_is_typed
      return if parent.respond_to?(:type)
      errors << message
    end

    def parent_describes_an_object
      return if errors.any?
      errors << message unless parent.type.value == "object"
    end

    def source_is_an_array
      return if errors.any?
      errors << message unless source.is_a?(Array)
    end

    def source_has_elements
      return if errors.any?
      errors << message if source.empty?
    end

    def source_elements_are_strings
      return if errors.any?
      errors << message unless source.all? { |item| item.is_a? String }
    end

    def source_elements_are_unique
      return if errors.any?
      errors << message unless source.count == source.uniq.count
    end

    def message
      "#{super} This keyword CAN be added to a schema describing an 'object'." \
      " The value of this keyword MUST be an array." \
      " This array MUST have at least one element." \
      " Elements of this array MUST be strings, and MUST be unique."
    end
  end
end
