class Locust::Keywords::OneOf
  class Verifier < Locust::Verifier
    validate :object_satisfies_a_requirement
    validate :object_satisfies_exactly_one_requirement

    private

    def all_errors
      @all_errors = schema.data.map { |item| item.verify(object) }
    end

    def num_of_valid_schemas
      @num_of_valid_schemas ||= all_errors.count(&:empty?)
    end

    def object_satisfies_a_requirement
      return unless schema.data&.count&.positive?
      return unless num_of_valid_schemas.zero?
      errors.concat all_errors.flatten
    end

    def object_satisfies_exactly_one_requirement
      return unless schema.data&.count&.positive?
      return unless num_of_valid_schemas > 1
      errors << message("It should satisfy only one of given schemas.")
    end
  end
end
