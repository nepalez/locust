RSpec.describe Locust::Keywords::MaxLength do
  let(:keyword) { described_class.call source, parent }
  let(:parent)  { Locust::Keywords::Object.call({ type: "string" }, nil) }
  let(:source)  { 3 }

  describe ".call" do
    subject { keyword }

    its(:keyword) { is_expected.to eq "maxLength" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }
  end

  describe "#validate" do
    subject { keyword.validate }

    it { is_expected.to eq [] }

    context "when a parent describes not a string" do
      let(:parent) { Locust::Keywords::Object.call({ type: "object" }, nil) }

      it { is_expected.not_to be_empty }
    end

    context "when a parent is not an object" do
      let(:parent) { Locust::Schema.call(nil, nil) }

      it { is_expected.not_to be_empty }
    end

    context "when a source is negative" do
      let(:source) { -12 }

      it { is_expected.not_to be_empty }
    end

    context "when a source is zero" do
      let(:source) { 0 }

      it { is_expected.to eq [] }
    end

    context "when a source is not an integer" do
      let(:source) { 12.5 }

      it { is_expected.not_to be_empty }
    end
  end

  describe "#verify" do
    subject { keyword.verify object }

    context "when object length is less than the limit" do
      let(:object) { "fo" }

      it { is_expected.to eq [] }
    end

    context "when object length is greater than the limit" do
      let(:object) { "foobar" }

      it { is_expected.not_to be_empty }
    end

    context "when object length is equal to the limit" do
      let(:object) { "foo" }

      it { is_expected.to eq [] }
    end

    context "when object is not a string" do
      let(:object) { 1 }

      it { is_expected.to eq [] }
    end
  end
end
