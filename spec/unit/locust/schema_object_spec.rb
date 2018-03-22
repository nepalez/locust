RSpec.describe Locust::SchemaObject do
  let(:schema) { described_class.call source, parent }
  let(:parent) { double :parent }
  let(:source) { { "type" => "null" } }

  describe ".call" do
    subject { schema }

    context "with a minimal schema" do
      it "applies default options" do
        expect(subject.options.keys).to match_array %i[type]
      end

      its(:type) { is_expected.to eq "null" }
    end

    context "without any type" do
      before { source.delete "type" }

      it "raises Locust::InvalidSchemaError" do
        expect { subject }.to raise_error(Locust::InvalidSchemaError)
      end
    end

    context "with an improper type" do
      before { source["type"] = "foo" }

      it "raises Locust::InvalidSchemaError" do
        expect { subject }.to raise_error(Locust::InvalidSchemaError)
      end
    end

    context "with an improper format" do
      before { source["format"] = nil }

      it "raises Locust::InvalidSchemaError" do
        expect { subject }.to raise_error(Locust::InvalidSchemaError)
      end
    end

    context "with an improper enum" do
      before { source["enum"] = nil }

      it "raises Locust::InvalidSchemaError" do
        expect { subject }.to raise_error(Locust::InvalidSchemaError)
      end
    end
  end
end
