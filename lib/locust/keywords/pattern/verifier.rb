class Locust::Keywords::Pattern
  class Verifier < Locust::Verifier
    validate :pattern_matched

    private

    def continue?
      errors.empty? && schema.validate.empty? && object.is_a?(String)
    end

    def pattern_matched
      return unless continue?
      return if object[schema.matcher]
      errors << message
    end
  end
end
