RSpec.describe Locust::Validators::MinProperties do
  let(:limit)  { described_class.call source }

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

    context "with a non-integer value" do
      let(:source) { :foo }

      it "raises Locust::InvalidSchemaError" do
        expect { subject }.to raise_error(Locust::InvalidSchemaError)
      end
    end
  end

  describe "#errors" do
    subject { limit.errors object, "foo/bar" }

    let(:source) { 3 }

    context "when object is not a hash" do
      let(:object) { [1, 2, 3] }
      it { is_expected.to be_empty }
    end

    context "when number of object properties satisfies the limit" do
      let(:object) { { a: 1, b: 2, c: 3 } }
      it { is_expected.to be_empty }
    end

    context "when number of object properties breaks the limit" do
      let(:object) { { a: 1, b: 2 } }
      it { is_expected.not_to be_empty }
    end
  end
end
