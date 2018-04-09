class Locust::Keywords::Items
  class Verifier < Locust::Verifier
    validate :all_items_satisfy_shared_schema
    validate :all_items_satisfy_their_schemas

    private

    def continue?
      errors.empty? && schema.validate.empty? && object.is_a?(Array)
    end

    def all_items_satisfy_shared_schema
      return unless continue?
      verifier = schema.schema
      return unless verifier
      object.each_with_index do |val, index|
        errors.concat verifier.verify(val, *path, index)
      end
    end

    def all_items_satisfy_their_schemas
      return unless continue?
      object.each_with_index do |val, index|
        verifier = schema.schemas[index]
        next unless verifier
        errors.concat verifier.verify(val, *path, index)
      end
    end
  end
end
