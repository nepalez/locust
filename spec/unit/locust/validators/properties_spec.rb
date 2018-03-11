RSpec.describe Locust::Validators::Properties do
  let(:properties) { described_class.call source }
  let(:source) do
    { "foo" => { "type" => "null" }, "bar" => { "type" => "file" } }
  end

  describe ".call" do
    subject { properties }

    context "with a hash of valid object schemas" do
      let(:foo) { subject["foo"] }
      let(:bar) { subject["bar"] }

      its(:keys) { is_expected.to match_array %w[foo bar] }

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
end
