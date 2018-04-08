class Locust::Keywords::AdditionalProperties
  class Verifier < Locust::Verifier
    validate :additional_properties_are_enabled
    validate :additional_properties_are_valid

    private

    def additional_properties_are_enabled
      return if schema.allowed?
      return unless object.is_a?(Hash)
      return if additional_properties.empty?
      errors << message("It does not support additional properties" \
                        " '#{additional_properties.keys.join(', ')}'.")
    end

    def additional_properties_are_valid
      return if errors.any?
      return unless schema.schema
      return unless object.is_a?(Hash)
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
