class Locust::Keywords::AnyOf
  class Verifier < Locust::Verifier
    validate :object_satisfies_some_requirement

    private

    def continue?
      errors.empty? && schema.validate.empty?
    end

    def all_errors
      @all_errors = schema.data.map { |item| item.verify(object) }
    end

    def num_of_valid_schemas
      @num_of_valid_schemas ||= all_errors.count(&:empty?)
    end

    def object_satisfies_some_requirement
      return unless continue?
      return unless num_of_valid_schemas.zero?
      errors.concat all_errors.flatten
    end
  end
end
