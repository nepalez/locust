RSpec.describe Locust::Validators::AdditionalProperties, ".call" do
  subject { described_class.call(schema) }

  let(:parent) { double type: parent_type }
  let(:schema) { double :schema, parent: parent, full_path: "foo" }

  context "when parent schema describes an object" do
    let(:parent_type) { double value: "object" }

    it { is_expected.to eq [] }
  end

  context "when parent schema describes not an object" do
    let(:parent_type) { double value: "array" }

    it { is_expected.not_to be_empty }
  end
end
