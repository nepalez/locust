RSpec.describe Locust::Keywords::ExclusiveMinimum do
  let(:validator) { described_class.call source, parent }
  let(:parent)    { double :parent }

  describe ".call" do
    subject { validator }

    context "with a positive value" do
      let(:source) { "5.3" }

      its(:parent) { is_expected.to eq parent }
      it { is_expected.to be_positive }
    end

    context "with a zero value" do
      let(:source) { 0 }
      it { is_expected.to be_zero }
    end

    context "with a negative value" do
      let(:source) { -1.7 }
      it { is_expected.to be_negative }
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

    context "when object is not a number" do
      let(:object) { :foobar }
      it { is_expected.to be_empty }
    end

    context "when object is greater than the limit" do
      let(:object) { 5.1 }
      it { is_expected.to be_empty }
    end

    context "when object equals the limit" do
      let(:object) { 5 }
      it { is_expected.not_to be_empty }
    end

    context "when object is less than the limit" do
      let(:object) { 4.9 }
      it { is_expected.not_to be_empty }
    end
  end
end
