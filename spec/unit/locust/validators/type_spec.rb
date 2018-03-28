RSpec.describe Locust::Validators::Type, ".call" do
  subject { described_class.call(schema) }

  let(:schema) { double :schema, source: source, full_path: "foo.type" }

  context "with 'null'" do
    let(:source) { "null" }
    it { is_expected.to eq [] }
  end

  context "with 'boolean'" do
    let(:source) { "boolean" }
    it { is_expected.to eq [] }
  end

  context "with 'integer'" do
    let(:source) { "integer" }
    it { is_expected.to eq [] }
  end

  context "with 'number'" do
    let(:source) { "number" }
    it { is_expected.to eq [] }
  end

  context "with 'string'" do
    let(:source) { "string" }
    it { is_expected.to eq [] }
  end

  context "with 'array'" do
    let(:source) { "array" }
    it { is_expected.to eq [] }
  end

  context "with 'object'" do
    let(:source) { "object" }
    it { is_expected.to eq [] }
  end

  context "with 'file'" do
    let(:source) { "file" }
    it { is_expected.to eq [] }
  end

  context "with unknown source" do
    let(:source) { "email" }
    it { is_expected.not_to be_empty }
  end
end
