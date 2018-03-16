RSpec.describe Locust::SchemaObject do
  subject      { described_class.call schema, parent }
  let(:parent) { double :parent }
  let(:schema) { { "type" => "null" } }

  context "with a minimal schema" do
    it "applies default options" do
      expect(subject.options.keys).to match_array %i[parent type]
    end

    its(:type) { is_expected.to eq "null" }
  end

  context "without any type" do
    before { schema.delete "type" }

    it "raises Locust::InvalidSchemaError" do
      expect { subject }.to raise_error(Locust::InvalidSchemaError)
    end
  end

  context "with an improper type" do
    before { schema["type"] = "foo" }

    it "raises Locust::InvalidSchemaError" do
      expect { subject }.to raise_error(Locust::InvalidSchemaError)
    end
  end

  context "with an improper format" do
    before { schema["format"] = nil }

    it "raises Locust::InvalidSchemaError" do
      expect { subject }.to raise_error(Locust::InvalidSchemaError)
    end
  end

  context "with an improper enum" do
    before { schema["enum"] = nil }

    it "raises Locust::InvalidSchemaError" do
      expect { subject }.to raise_error(Locust::InvalidSchemaError)
    end
  end
end
