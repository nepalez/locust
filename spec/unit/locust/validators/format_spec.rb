RSpec.describe Locust::Validators::Format, ".call" do
  subject { described_class.call(schema) }

  let(:schema) { double :schema, source: source, full_path: "foo.type" }

  context "with a non-empty string" do
    let(:source) { "email" }
    it { is_expected.to eq [] }
  end

  context "with the empty string" do
    let(:source) { "" }
    it { is_expected.not_to be_empty }
  end

  context "with a non-string" do
    let(:source) { 32 }
    it { is_expected.not_to be_empty }
  end
end
