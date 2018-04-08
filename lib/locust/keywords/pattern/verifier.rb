class Locust::Keywords::Pattern
  class Verifier < Locust::Verifier
    validate :pattern_matched

    private

    def pattern_matched
      return unless object.is_a? String
      return if object[schema.matcher]
      errors << message
    end
  end
end
