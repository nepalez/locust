RSpec.describe Locust::Keywords::Required do
  let(:validator) { described_class.call source, parent }
  let(:parent)    { double :parent }

  describe ".call" do
    subject { validator }

    context "with array of unique values" do
      let(:source) { %i[foo bar] }

      its(:parent) { is_expected.to eq parent }
      it { is_expected.to eq %w[foo bar] }
    end

    context "with an empty array" do
      let(:source) { [] }
      it { is_expected.to eq [] }
    end

    context "with an empty values" do
      let(:source) { ["", "foo"] }

      it "raises Locust::InvalidSchemaError" do
        expect { subject }.to raise_error(Locust::InvalidSchemaError)
      end
    end

    context "with duplicates" do
      let(:source) { %i[foo bar foo] }

      it "raises Locust::InvalidSchemaError" do
        expect { subject }.to raise_error(Locust::InvalidSchemaError)
      end
    end

    context "with non-array value" do
      let(:source) { "foo" }

      it "raises Locust::InvalidSchemaError" do
        expect { subject }.to raise_error(Locust::InvalidSchemaError)
      end
    end
  end

  describe "#errors" do
    subject { validator.errors(object, "") }

    let(:source) { %w[foo bar] }

    context "when object has required keys" do
      let(:object) { { "foo" => :FOO, "bar" => :BAR, "baz" => :BAZ } }
      it { is_expected.to be_empty }
    end

    context "when object misses required keys" do
      let(:object) { { "foo" => :FOO, "baz" => :BAZ } }
      it { is_expected.not_to be_empty }
    end

    context "when object is not a hash" do
      let(:object) { %w[foo bar] }
      it { is_expected.to be_empty }
    end
  end
end
