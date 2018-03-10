RSpec.describe Locust::Schema::Keywords::Items do
  let(:items) { described_class.call source }

  describe ".call" do
    subject { items }

    context "with a list of object schemas" do
      let(:source) { [{ "type" => "null" }, { "type" => "file" }] }

      its(:count) { is_expected.to eq 2 }
      its("first.type") { is_expected.to eq "null" }
      its("last.type")  { is_expected.to eq "file" }
    end

    context "with a single object schema" do
      let(:source) { { "type" => "null" } }

      its(:count)       { is_expected.to eq 1 }
      its(:first)       { is_expected.to be_a Locust::Schema::Object }
      its("first.type") { is_expected.to eq "null" }
    end

    context "with an empty list" do
      let(:source) { [] }
      it { is_expected.to eq [] }
    end

    context "with an invalid object schema" do
      let(:source) { { "title" => "something" } }

      it "raises Locust::Schema::DefinitionError" do
        expect { subject }.to raise_error(Locust::Schema::DefinitionError)
      end
    end

    context "with a list containing invalid object shema" do
      let(:source) { [{ "type" => "null" }, { "title" => "file" }] }

      it "raises Locust::Schema::DefinitionError" do
        expect { subject }.to raise_error(Locust::Schema::DefinitionError)
      end
    end
  end
end
