RSpec.describe Locust::Keywords::MinLength do
  let(:validator) { described_class.call source, parent }
  let(:parent)    { double :parent }

  describe ".call" do
    subject { validator }

    context "with a positive value" do
      let(:source) { "5" }

      its(:parent) { is_expected.to eq parent }
      it { is_expected.to be_positive }
    end

    context "with a zero value" do
      let(:source) { 0 }
      it { is_expected.to be_zero }
    end

    context "with a negative value" do
      let(:source) { -1 }

      it "raises Locust::InvalidSchemaError" do
        expect { subject }.to raise_error(Locust::InvalidSchemaError)
      end
    end

    context "with a non-integer value" do
      let(:source) { :foo }

      it "raises Locust::InvalidSchemaError" do
        expect { subject }.to raise_error(Locust::InvalidSchemaError)
      end
    end
  end

  describe "#errors" do
    subject { validator.errors object, "foo/bar" }

    let(:source) { 5 }

    context "when object has no length" do
      let(:object) { 13.4 }
      it { is_expected.to be_empty }
    end

    context "when object satisfies the limit" do
      let(:object) { :fooba }
      it { is_expected.to be_empty }
    end

    context "when object length doesn't satisfy the limit" do
      let(:object) { "foob" }
      it { is_expected.not_to be_empty }
    end
  end
end
