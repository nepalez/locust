RSpec.describe Locust::Validators::MaxLength do
  let(:limit)  { described_class.call source }
  let(:source) { :foo }

  describe ".call" do
    subject { limit }

    context "with a positive value" do
      let(:source) { "5" }
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
  end

  describe "#errors" do
    subject { limit.errors object, "foo/bar" }

    let(:source) { 5 }

    context "when object has no length" do
      let(:object) { 13.4 }
      it { is_expected.to be_empty }
    end

    context "when object length doesn't exceed the limit" do
      let(:object) { :fooba }
      it { is_expected.to be_empty }
    end

    context "when object length exceeds the limit" do
      let(:object) { "foobar" }
      it { is_expected.not_to be_empty }
    end
  end
end
