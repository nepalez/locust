RSpec.describe Locust::Keywords::Enum::Validator, ".call" do
  subject { described_class.call(schema) }

  let(:schema) { double :schema, source: source, full_path: "enum" }

  context "with non-empty array" do
    let(:source) { [{ id: 1 }, { id: 2 }] }
    it { is_expected.to eq [] }
  end

  context "with empty array" do
    let(:source) { [] }
    it { is_expected.not_to be_empty }
  end

  context "when array has duplications" do
    let(:source) { [{ id: 1 }, { id: 2 }, { id: 1 }] }
    it { is_expected.not_to be_empty }
  end

  context "with not an array" do
    let(:source) { { id: 1 } }
    it { is_expected.not_to be_empty }
  end
end
