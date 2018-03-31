RSpec.describe Locust::Keywords::ExclusiveMaximum::Validator, ".call" do
  subject { described_class.call(schema) }

  let(:parent) { double options: { type: "integer", maximum: 32 } }
  let(:source) { true }
  let(:schema) do
    double source: source, parent: parent, full_path: "exclusiveMaximum"
  end

  context "when parent has a maximum" do
    it { is_expected.to eq [] }
  end

  context "when parent has no maximum" do
    let(:parent) { double options: { type: "integer" } }

    it { is_expected.not_to be_empty }
  end

  context "when a value is not a boolean" do
    let(:source) { 12 }

    it { is_expected.not_to be_empty }
  end
end
