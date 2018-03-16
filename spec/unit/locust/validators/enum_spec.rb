RSpec.describe Locust::Validators::Enum do
  let(:validator) { described_class.call source, parent }
  let(:parent)    { double :parent }

  describe ".call" do
    subject { validator }

    context "with array of unique strings" do
      let(:source) { %w[Foo Bar] }

      its(:parent) { is_expected.to eq parent }
    end

    context "with a non-array" do
      let(:source) { "foo" }

      it "raises Locust::InvalidSchemaError" do
        expect { subject }.to raise_error(Locust::InvalidSchemaError)
      end
    end

    context "with an empty array" do
      let(:source) { [] }

      it "raises Locust::InvalidSchemaError" do
        expect { subject }.to raise_error(Locust::InvalidSchemaError)
      end
    end

    context "with an array containing duplications" do
      let(:source) { %w[bar foo bar] }

      it "raises Locust::InvalidSchemaError" do
        expect { subject }.to raise_error(Locust::InvalidSchemaError)
      end
    end
  end

  describe "#errors" do
    subject { validator.errors object, "foo/bar" }

    let(:source) { %w[Foo Bar] }

    context "when object is included to the source" do
      let(:object) { "Foo" }
      it { is_expected.to be_empty }
    end

    context "when object is not included to the source" do
      let(:object) { :Bar }
      it { is_expected.not_to be_empty }
    end
  end
end
