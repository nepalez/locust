class Locust::Keywords::AdditionalProperties
  class Verifier < Locust::Verifier
    validate :additional_properties_are_enabled
    validate :additional_properties_are_valid

    private

    def continue?
      errors.empty? && schema.validate.empty? && object.is_a?(Hash)
    end

    def additional_properties_are_enabled
      return unless continue?
      return if schema.allowed?
      return unless additional_properties.any?
      errors << message("Forbidden properties:" \
                        " '#{additional_properties.keys.join(', ')}'.")
    end

    def additional_properties_are_valid
      return unless continue?
      return unless schema.schema
      list = additional_properties.flat_map do |key, val|
        schema.schema.verify(val, *path, key)
      end
      errors.concat(list)
    end

    def required_properties
      Array schema.parent&.required&.source
    end

    def additional_properties
      @additional_properties ||= \
        object.reject { |key, _| required_properties.include? key }
    end
  end
end
