RSpec.describe Locust::Keywords::Maximum do
  let(:keyword) { described_class.call source, parent }
  let(:parent)  { Locust::Keywords::Object.call({ type: "number" }, nil) }
  let(:source)  { 3 }

  describe ".call" do
    subject { keyword }

    its(:keyword) { is_expected.to eq "maximum" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }
  end

  describe "#validate" do
    subject { keyword.validate }

    it { is_expected.to eq [] }

    context "when a parent describes an integer" do
      let(:parent) { Locust::Keywords::Object.call({ type: "integer" }, nil) }

      it { is_expected.to eq [] }
    end

    context "when a parent describes neither integer, nor a number" do
      let(:parent) { Locust::Keywords::Object.call({ type: "string" }, nil) }

      it { is_expected.not_to be_empty }
    end

    context "when a parent is not an object" do
      let(:parent) { Locust::Schema.call(nil, nil) }

      it { is_expected.not_to be_empty }
    end

    context "when a source is not a number" do
      let(:source) { :foo }

      it { is_expected.not_to be_empty }
    end
  end

  describe "#verify" do
    subject { keyword.verify object }

    context "when object is less than the limit" do
      let(:object) { 2 }

      it { is_expected.to eq [] }
    end

    context "when object is greater than the limit" do
      let(:object) { 4 }

      it { is_expected.not_to be_empty }
    end

    context "when object is equal to the limit" do
      let(:object) { 3 }

      it { is_expected.to eq [] }

      context "when exclusiveMaximum is set" do
        let(:parent) do
          Locust::Keywords::Object.call({ exclusiveMaximum: true }, nil)
        end

        it { is_expected.not_to be_empty }
      end
    end

    context "when object is not a number" do
      let(:object) { :foo }

      it { is_expected.to eq [] }
    end
  end
end
