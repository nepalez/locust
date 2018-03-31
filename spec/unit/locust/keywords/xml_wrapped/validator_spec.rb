RSpec.describe Locust::Keywords::XmlWrapped::Validator, ".call" do
  subject { described_class.call(schema) }

  let(:type)   { double value: "array" }
  let(:object) { double :object, type: type }
  let(:parent) { double :xml, parent: object }
  let(:source) { false }
  let(:schema) { double parent: parent, source: source, full_path: "wrapped" }

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

  context "when describes not an array" do
    let(:type) { double value: "object" }

    it { is_expected.not_to be_empty }
  end
end
