RSpec.describe Locust::Keywords::Type do
  let(:keyword) { described_class.call source, parent }
  let(:parent)  { Locust::Keywords::Object.call(nil, nil) }
  let(:source)  { "string" }

  describe ".call" do
    subject { keyword }

    its(:keyword) { is_expected.to eq "type" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }
  end

  describe "#validate" do
    subject { keyword.validate }

    context "when source is 'null'" do
      let(:source) { "null" }
      it { is_expected.to eq [] }
    end

    context "when source is 'boolean'" do
      let(:source) { "boolean" }
      it { is_expected.to eq [] }
    end

    context "when source is 'integer'" do
      let(:source) { "integer" }
      it { is_expected.to eq [] }
    end

    context "when source is 'number'" do
      let(:source) { "number" }
      it { is_expected.to eq [] }
    end

    context "when source is 'string'" do
      let(:source) { "string" }
      it { is_expected.to eq [] }
    end

    context "when source is 'array'" do
      let(:source) { "array" }
      it { is_expected.to eq [] }
    end

    context "when source is 'object'" do
      let(:source) { "object" }
      it { is_expected.to eq [] }
    end

    context "when source is 'file'" do
      let(:source) { "file" }
      it { is_expected.to eq [] }
    end

    context "when source is not a primitive" do
      let(:source) { "email" }
      it { is_expected.not_to be_empty }
    end

    context "when parent is not an object" do
      let(:parent) { Locust::Schema.call(nil, nil) }
      it { is_expected.not_to be_empty }
    end
  end
end
