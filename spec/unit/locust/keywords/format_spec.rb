RSpec.describe Locust::Keywords::Format do
  let(:keyword) { described_class.call source, parent }
  let(:parent)  { Locust::Keywords::Object.call(nil, nil) }
  let(:source)  { "email" }

  describe ".call" do
    subject { keyword }

    its(:keyword) { is_expected.to eq "format" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }
  end

  describe "#validate" do
    subject { keyword.validate }

    it { is_expected.to eq [] }

    context "when source is empty" do
      let(:source) { "" }

      it { is_expected.not_to be_empty }
    end

    context "when source is not a string" do
      let(:source) { 32 }

      it { is_expected.not_to be_empty }
    end

    context "when parent is not an object" do
      let(:parent) { Locust::Schema.call(nil, nil) }

      it { is_expected.not_to be_empty }
    end
  end
end
