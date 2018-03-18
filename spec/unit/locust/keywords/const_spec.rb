RSpec.describe Locust::Keywords::Const do
  let(:validator) { described_class.call "FOO", parent }
  let(:parent)    { double :parent }

  describe ".call" do
    subject { validator }

    its(:parent) { is_expected.to eq parent }
  end

  describe "#errors" do
    subject { validator.errors object, "foo/bar" }

    context "when object equals the source" do
      let(:object) { "FOO" }
      it { is_expected.to be_empty }
    end

    context "when object differs from the source" do
      let(:object) { :FOO }
      it { is_expected.not_to be_empty }
    end
  end
end
