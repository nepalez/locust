RSpec.describe Locust::Validators::Items, ".call" do
  subject { described_class.call(schema) }

  let(:parent_type) { double value: "array" }
  let(:parent) { double type: parent_type }
  let(:schema) { double :schema, parent: parent, full_path: "foo.items" }

  context "when parent schema describes an array" do
    it { is_expected.to eq [] }
  end

  context "when parent schema describes not an array" do
    let(:parent_type) { double value: "object" }

    it { is_expected.not_to be_empty }
  end
end
