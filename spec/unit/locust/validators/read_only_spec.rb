RSpec.describe Locust::Validators::ReadOnly, ".call" do
  subject { described_class.call(schema) }

  let(:grandpa) { double keyword: "properties" }
  let(:parent)  { double :object, write_only: nil, parent: grandpa }
  let(:source)  { false }
  let(:schema)  { double parent: parent, source: source, full_path: "readOnly" }

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

  context "when it describes a single property" do
    let(:grandpa) { double keyword: "property" }

    it { is_expected.to eq [] }
  end

  context "when it doesn't describe properties" do
    let(:grandpa) { double keyword: "items" }

    it { is_expected.not_to be_empty }
  end

  context "when described object is read- and write-only at the same time" do
    let(:parent) { double :object, write_only: write, parent: grandpa }
    let(:source) { true }
    let(:write)  { double source: true }

    it { is_expected.not_to be_empty }
  end
end
