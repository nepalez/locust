class Locust::Keywords::Required
  class Verifier < Locust::Verifier
    validate :required_properties_are_present

    private

    def continue?
      errors.empty? && schema.validate.empty? && object.is_a?(Hash)
    end

    def missed_keys
      @missed_keys ||= schema.source - object.keys.map(&:to_s)
    end

    def required_properties_are_present
      return unless continue?
      return if missed_keys.empty?
      errors << message("It MUST have properties '#{missed_keys.join(', ')}'")
    end
  end
end
