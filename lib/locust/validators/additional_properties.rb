module Locust::Validators
  #
  # Checks the 'additionalProperties' keyword definition
  #
  class AdditionalProperties < Base
    validate :parent_is_typed
    validate :parent_describes_an_object

    private

    def parent_is_typed
      return if parent.respond_to?(:type)
      errors << message
    end

    def parent_describes_an_object
      return if errors.any?
      errors << message unless parent.type.value == "object"
    end

    def message
      "#{super} This keyword CAN be added to a schema describing an 'object'."
    end
  end
end
