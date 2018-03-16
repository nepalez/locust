RSpec.describe Locust::Validators::Pattern do
  let(:validator) { described_class.call source, parent }
  let(:source)    { '^\w+$' }
  let(:parent)    { double :parent }

  describe ".call" do
    subject { validator }

    its(:parent) { is_expected.to eq parent }
  end

  describe "#accept?" do
    subject { validator.accept? string }

    context "when a string satisfies the pattern" do
      let(:string) { "foobar" }
      it { is_expected.to eq true }
    end

    context "when a string doesn't satsifies the pattern" do
      let(:string) { "foo-bar" }
      it { is_expected.to eq false }
    end
  end

  describe "#reject?" do
    subject { validator.reject? string }

    context "when a string satisfies the pattern" do
      let(:string) { "foobar" }
      it { is_expected.to eq false }
    end

    context "when a string doesn't satsifies the pattern" do
      let(:string) { "foo-bar" }
      it { is_expected.to eq true }
    end
  end
end
