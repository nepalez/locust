class Locust::Keywords::UniqueItems
  class Verifier < Locust::Verifier
    validate :elements_are_unique

    private

    def elements_are_unique
      return unless object.is_a? Array
      return unless schema.source == true
      return if object.uniq == object
      errors << message("Its elements MUST be unique.")
    end
  end
end
