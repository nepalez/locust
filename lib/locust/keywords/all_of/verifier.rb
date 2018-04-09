class Locust::Keywords::AllOf
  class Verifier < Locust::Verifier
    validate :object_satisfies_all_requirement

    private

    def continue?
      errors.empty? && schema.validate.empty?
    end

    def object_satisfies_all_requirement
      return unless continue?
      list = schema.data.flat_map { |item| item.verify(object) }
      errors.concat(list)
    end
  end
end
