class Locust::Keywords::AllOf
  class Verifier < Locust::Verifier
    validate :object_satisfies_all_requirement

    private

    def object_satisfies_all_requirement
      return unless schema.data
      list = schema.data.flat_map { |item| item.verify(object) }
      errors.concat(list)
    end
  end
end
