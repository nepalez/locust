class Locust::Keywords::Items
  class Verifier < Locust::Verifier
    validate :all_items_satisfy_shared_schema
    validate :all_items_satisfy_their_schemas

    private

    def all_items_satisfy_shared_schema
      return unless object.is_a? Array
      verifier = schema.schema
      return unless verifier
      object.each_with_index do |val, index|
        errors.concat verifier.verify(val, *path, index)
      end
    end

    def all_items_satisfy_their_schemas
      return unless object.is_a? Array
      object.each_with_index do |val, index|
        verifier = schema.schemas[index]
        next unless verifier
        errors.concat verifier.verify(val, *path, index)
      end
    end
  end
end
