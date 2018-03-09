RSpec.describe Locust::Schema::Properties do
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
        expect(foo).to be_a Locust::Schema::Object
        expect(foo.type).to eq "null"

        expect(bar).to be_a Locust::Schema::Object
        expect(bar.type).to eq "file"
      end
    end

    context "with a hash containing invalid schema" do
      before { source["baz"] = { "title" => "file" } }

      it "raises ArgumentError" do
        expect { subject }.to raise_error(ArgumentError)
      end
    end

    context "with not a hash" do
      let(:source) { [{ "type" => "null" }] }

      it "raises ArgumentError" do
        expect { subject }.to raise_error(ArgumentError)
      end
    end
  end
end
