RSpec.describe Locust::Validators::Properties, ".call" do
  subject { described_class.call(schema) }

  let(:parent_type) { double value: "object" }
  let(:parent) { double type: parent_type }
  let(:schema) { double :schema, parent: parent, full_path: "foo.properties" }

  context "when parent schema describes an object" do
    it { is_expected.to eq [] }
  end

  context "when parent schema describes not an object" do
    let(:parent_type) { double value: "array" }

    it { is_expected.not_to be_empty }
  end
end
