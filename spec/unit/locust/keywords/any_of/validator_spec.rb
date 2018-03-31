RSpec.describe Locust::Keywords::AnyOf::Validator, ".call" do
  subject { described_class.call(schema) }

  let(:schema) do
    double :schema, source: source, data: Array(source), full_path: "anyOf"
  end

  context "with non-empty array" do
    let(:source) { [{ "type" => "string" }, { "const" => "foo" }] }
    it { is_expected.to eq [] }
  end

  context "with empty array" do
    let(:source) { [] }
    it { is_expected.not_to be_empty }
  end

  context "with non-array" do
    let(:source) { 1 }
    it { is_expected.not_to be_empty }
  end
end
