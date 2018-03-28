module Locust::Validators
  #
  # Checks the 'items' keyword definition
  #
  class Items < Base
    validate :parent_is_typed
    validate :parent_describes_an_array

    private

    def parent_is_typed
      return if parent.respond_to?(:type)
      errors << message
    end

    def parent_describes_an_array
      return if errors.any?
      errors << message unless parent.type.value == "array"
    end

    def message
      "#{super} This keyword CAN be added to a schema describing an 'array'."
    end
  end
end
