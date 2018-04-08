class Locust::Keywords::Object
  class Verifier < Locust::Verifier
    validate :all_requirements_are_satisfied

    private

    def all_requirements_are_satisfied
      list = verifiers.flat_map { |option| option.verify(object, *path) }
      errors.concat(list)
    end

    def verifiers
      schema.options.select { |_, option| option.is_a? Locust::Schema }.values
    end
  end
end
