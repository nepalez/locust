RSpec.describe Locust::Keywords::Properties do
  let(:validator) { described_class.call source, parent }
  let(:parent)    { double :parent }
  let(:source) do
    { "foo" => { "type" => "null" }, "bar" => { "type" => "file" } }
  end

  describe ".call" do
    subject { validator }

    context "with a hash of valid object schemas" do
      let(:foo) { subject["foo"] }
      let(:bar) { subject["bar"] }

      its(:parent) { is_expected.to eq parent }
      its(:keys)   { is_expected.to match_array %w[foo bar] }

      it "contains a named schemas" do
        expect(foo).to be_a Locust::SchemaObject
        expect(foo.type).to eq "null"

        expect(bar).to be_a Locust::SchemaObject
        expect(bar.type).to eq "file"
      end
    end

    context "with a hash containing invalid schema" do
      before { source["baz"] = { "title" => "file" } }

      it "raises Locust::InvalidSchemaError" do
        expect { subject }.to raise_error(Locust::InvalidSchemaError)
      end
    end

    context "with not a hash" do
      let(:source) { [{ "type" => "null" }] }

      it "raises Locust::InvalidSchemaError" do
        expect { subject }.to raise_error(Locust::InvalidSchemaError)
      end
    end
  end

  describe "#errors" do
    subject { validator.errors object, "x" }

    let(:source) do
      {
        "foo" => { "type" => "null" },
        "bar" => { "type" => "string" },
      }
    end

    context "when object is not a hash" do
      let(:object) { %w[foo bar] }
      it { is_expected.to be_empty }
    end

    context "when all properties satisfy the requirements" do
      let(:object) do
        {
          "foo" => nil,
          "bar" => "baz",
          "qux" => 3,
        }
      end

      it { is_expected.to be_empty }
    end

    context "when some properties break the requirement" do
      let(:object) do
        {
          "foo" => "foo",
          "bar" => "baz",
          "qux" => 3,
        }
      end

      it { is_expected.not_to be_empty }
    end
  end
end
