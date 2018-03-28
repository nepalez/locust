RSpec.describe Locust::Validators::UniqueItems, ".call" do
  subject { described_class.call(schema) }

  let(:parent_type) { double value: "array" }
  let(:parent) { double :parent, type: parent_type }
  let(:source) { false }
  let(:schema) do
    double :schema, parent: parent, source: source, full_path: "foo.uniqueItems"
  end

  context "when a source is false" do
    it { is_expected.to eq [] }
  end

  context "when a source is true" do
    let(:source) { true }

    it { is_expected.to eq [] }
  end

  context "when a source is not a boolean" do
    let(:source) { 12.5 }

    it { is_expected.not_to be_empty }
  end

  context "when a parent describes not an array" do
    let(:parent_type) { double value: "object" }

    it { is_expected.not_to be_empty }
  end
end
