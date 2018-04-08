RSpec.describe Locust::Keywords::Enum do
  let(:keyword) { described_class.call source, parent }
  let(:parent)  { Locust::Keywords::Object.call({ type: "string" }, nil) }
  let(:source)  { %w[foo bar] }

  describe ".call" do
    subject { keyword }

    its(:keyword) { is_expected.to eq "enum" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }
  end

  describe "#validate" do
    subject { keyword.validate }

    it { is_expected.to eq [] }

    context "when source is empty" do
      let(:source) { [] }

      it { is_expected.not_to be_empty }
    end

    context "when source has duplications" do
      let(:source) { [{ id: 1 }, { id: 2 }, { id: 1 }] }

      it { is_expected.not_to be_empty }
    end

    context "when source is not an array" do
      let(:source) { { id: 1 } }

      it { is_expected.not_to be_empty }
    end

    context "when parent is not an object" do
      let(:parent) { Locust::Schema.call(nil, nil) }

      it { is_expected.not_to be_empty }
    end

    context "when source contain invalid elements" do
      let(:source) { ["foo", 1] }

      xit { is_expected.not_to be_empty }
    end
  end

  describe "#verify" do
    subject { keyword.verify object }

    context "when object equals to one of enum elements" do
      let(:object) { "foo" }

      it { is_expected.to eq [] }
    end

    context "when object differs from all enum elements" do
      let(:object) { "qux" }

      it { is_expected.not_to be_empty }
    end
  end
end
