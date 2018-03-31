class Locust::Keywords::ReadOnly
  #
  # Checks the 'readOnly' keyword definition
  #
  class Validator < Locust::Validator
    validate :parent_has_a_parent
    validate :grandparent_describes_properties
    validate :source_is_a_boolean
    validate :parent_is_not_write_only

    private

    def parent_has_a_parent
      return if parent.respond_to?(:parent) && parent.respond_to?(:write_only)
      errors << message("It is relevant only for a 'properties' definition.")
    end

    def grandparent_describes_properties
      return if errors.any?
      return if parent.parent&.keyword.to_s.start_with? "propert"
      errors << message("It is relevant only for a 'properties' definition.")
    end

    def source_is_a_boolean
      return if errors.any?
      return if [true, false].include? source
      errors << message("Its value MUST be a boolean.")
    end

    def parent_is_not_write_only
      return if errors.any?
      return unless source && parent.write_only&.source
      errors << message("It is in conflict with the 'writeOnly' keyword.")
    end
  end
end