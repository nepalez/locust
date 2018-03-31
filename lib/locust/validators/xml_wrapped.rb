module Locust::Validators
  #
  # Checks the 'xml.wrapped' keyword definition
  #
  class XmlWrapped < Base
    validate :grandparent_is_typed
    validate :grandparent_describes_an_array
    validate :source_is_a_boolean

    private

    def grandparent_is_typed
      return if parent.respond_to? :parent
      return if parent.parent.respond_to? :type
      errors << message("This keyword MAY be added to an object.xml only.")
    end

    def grandparent_describes_an_array
      return if errors.any?
      return if parent.parent.type.value == "array"
      errors << message("It MAY be used only for an array definition.")
    end

    def source_is_a_boolean
      return if errors.any?
      return if [true, false].include? source
      errors << message("Its value MUST be a boolean.")
    end
  end
end
