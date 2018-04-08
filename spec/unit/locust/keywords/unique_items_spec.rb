RSpec.describe Locust::Keywords::UniqueItems do
  let(:keyword) { described_class.call source, parent }
  let(:parent)  { Locust::Keywords::Object.call({ type: "array" }, nil) }
  let(:source)  { true }

  describe ".call" do
    subject { keyword }

    its(:keyword) { is_expected.to eq "uniqueItems" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }
  end

  describe "#validate" do
    subject { keyword.validate }

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

    context "when a parent describes not an array" do
      let(:parent) { Locust::Keywords::Object.call({ type: "object" }, nil) }

      it { is_expected.not_to be_empty }
    end

    context "when a parent is not an object" do
      let(:parent) { Locust::Schema.new(nil, nil) }

      it { is_expected.not_to be_empty }
    end
  end

  describe "#verify" do
    subject { keyword.verify object }

    context "when object elements are unique" do
      let(:object) { %i[foo bar] }

      it { is_expected.to eq [] }
    end

    context "when object has repetitive elements" do
      let(:object) { %i[foo bar foo] }

      context "when uniqueness is required" do
        it { is_expected.not_to be_empty }
      end

      context "when uniqueness is not required" do
        let(:source) { false }

        it { is_expected.to eq [] }
      end
    end

    context "when object is not an array" do
      let(:object) { %i[foo bar] }

      it { is_expected.to eq [] }
    end
  end
end
