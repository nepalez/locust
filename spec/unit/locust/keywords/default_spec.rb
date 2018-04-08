RSpec.describe Locust::Keywords::Default do
  let(:keyword) { described_class.call source, parent }
  let(:parent)  { Locust::Keywords::Object.call({ type: "string" }, nil) }
  let(:source)  { "FOO" }

  describe ".call" do
    subject { keyword }

    its(:keyword) { is_expected.to eq "default" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }
  end

  describe "#validate" do
    subject { keyword.validate }

    it { is_expected.to eq [] }

    context "when parent describes not an object" do
      let(:parent) { Locust::Schema.call(nil, nil) }

      it { is_expected.not_to be_empty }
    end

    context "when there're no parent" do
      let(:parent) { nil }

      it { is_expected.not_to be_empty }
    end

    context "when source doesn't satisfy the parent schema" do
      let(:source) { 1 }

      it { is_expected.not_to be_empty }
    end
  end
end
