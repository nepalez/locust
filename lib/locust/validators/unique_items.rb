module Locust::Validators
  #
  # Checks the 'uniqueItems' keyword definition
  #
  class UniqueItems < Base
    validate :parent_is_typed
    validate :parent_describes_an_array
    validate :source_is_a_boolean

    private

    def parent_is_typed
      return if parent.respond_to?(:type)
      errors << message
    end

    def parent_describes_an_array
      return if errors.any?
      errors << message unless parent.type.value == "array"
    end

    def source_is_a_boolean
      return if errors.any?
      errors << message unless [true, false].include? source
    end

    def message
      "#{super} This keyword CAN be added to a schema describing an 'array'." \
      " The value of this keyword MUST be a boolean."
    end
  end
end
