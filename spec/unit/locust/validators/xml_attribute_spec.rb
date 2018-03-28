RSpec.describe Locust::Validators::XmlAttribute, ".call" do
  subject { described_class.call(schema) }

  let(:schema) { double :schema, source: source, full_path: "xml.attribute" }

  context "when a source is false" do
    let(:source) { false }

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
end
