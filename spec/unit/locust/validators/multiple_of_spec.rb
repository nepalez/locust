RSpec.describe Locust::Validators::MultipleOf do
  let(:validator) { described_class.call source }

  describe ".call" do
    subject { validator }

    context "with a positive value" do
      let(:source) { "5.3" }
      it { is_expected.to be_positive }
    end

    context "with a zero value" do
      let(:source) { 0 }
      it { is_expected.to be_zero }
    end

    context "with a negative value" do
      let(:source) { -1.7 }

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

    let(:source) { 3.1 }

    context "when object is not a number" do
      let(:object) { :foobar }
      it { is_expected.to be_empty }
    end

    context "when object is multiple of validator" do
      let(:object) { 9.3 }
      it { is_expected.to be_empty }
    end

    context "when object is not multiple of validator" do
      let(:object) { 9.4 }
      it { is_expected.not_to be_empty }
    end
  end
end
