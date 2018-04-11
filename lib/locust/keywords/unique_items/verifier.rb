class Locust::Keywords::UniqueItems
  class Verifier < Locust::Verifier
    validate :elements_are_unique

    private

    def continue?
      errors.empty? && schema.validate.empty? && object.is_a?(Array)
    end

    def elements_are_unique
      return unless continue?
      return unless schema.source
      return if object.uniq == object
      errors << message("Its elements MUST be unique.")
    end
  end
end
