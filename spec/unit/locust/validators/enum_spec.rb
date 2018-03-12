RSpec.describe Locust::Validators::Enum do
  let(:enum) { described_class.call source }

  describe ".call" do
    subject { enum }

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
    subject { enum.errors object, "foo/bar" }

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
