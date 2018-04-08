RSpec.describe Locust::Keywords::Not do
  let(:keyword) { described_class.call source, parent }
  let(:parent)  { Locust::Keywords::Object.call({ type: "string" }, nil) }
  let(:source)  { { "type" => "string" } }

  describe ".call" do
    subject { keyword }

    its(:keyword) { is_expected.to eq "not" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }
  end

  describe "#schema" do
    subject { keyword.schema }

    it { is_expected.to be_kind_of Locust::Keywords::Object }
    its(:source) { is_expected.to eq source }
    its(:parent) { is_expected.to eq keyword }
  end

  describe "#validate" do
    subject { keyword.validate }

    it { is_expected.to eq [] }

    describe "when parent is not an object" do
      let(:parent) { Locust::Schema.call(nil, nil) }

      it { is_expected.not_to be_empty }
    end

    describe "when source is invalid" do
      let(:source) { { type: "foo" } }

      it { is_expected.not_to be_empty }
    end
  end

  describe "#verify" do
    subject { keyword.verify object }

    context "when object breaks the schema" do
      let(:object) { 1 }

      it { is_expected.to eq [] }
    end

    context "when object satisfies the schema" do
      let(:object) { "foo" }

      it { is_expected.not_to be_empty }
    end
  end
end
