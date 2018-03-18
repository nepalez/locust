RSpec.describe Locust::Keywords::UniqueItems do
  let(:validator) { described_class.call source, parent }
  let(:parent)    { double :parent }

  describe ".call" do
    subject { validator }

    context "with a true" do
      let(:source) { "true" }

      its(:parent) { is_expected.to eq parent }
      it { is_expected.to eq true }
    end

    context "with a zero value" do
      let(:source) { "false" }
      it { is_expected.to eq false }
    end

    context "with neither true nor false" do
      let(:source) { :foo }

      it "raises Locust::InvalidSchemaError" do
        expect { subject }.to raise_error(Locust::InvalidSchemaError)
      end
    end
  end

  describe "#errors" do
    subject { validator.errors object, "foo/bar" }

    context "with true" do
      let(:source) { true }

      context "when object is not an array" do
        let(:object) { { a: 1, b: 2, c: 3 } }
        it { is_expected.to be_empty }
      end

      context "when all items are unique" do
        let(:object) { [1, 2, 3] }
        it { is_expected.to be_empty }
      end

      context "when some items are duplicated" do
        let(:object) { [1, 2, 2] }
        it { is_expected.not_to be_empty }
      end
    end

    context "with false" do
      let(:source) { false }

      context "when object is not an array" do
        let(:object) { { a: 1, b: 2, c: 3 } }
        it { is_expected.to be_empty }
      end

      context "when all items are unique" do
        let(:object) { [1, 2, 3] }
        it { is_expected.to be_empty }
      end

      context "when some items are duplicated" do
        let(:object) { [1, 2, 2] }
        it { is_expected.to be_empty }
      end
    end
  end
end
