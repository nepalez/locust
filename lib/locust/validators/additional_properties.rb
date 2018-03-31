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
      errors << message("This keyword MAY be added to an object schema only.")
    end

    def parent_describes_an_object
      return if errors.any?
      return if parent.type.value == "object"
      errors << message("It MAY be used only for an object definition.")
    end
  end
end
