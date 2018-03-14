RSpec.describe Locust::Validators::Items do
  let(:validator) { described_class.call source }

  describe ".call" do
    subject { validator }

    context "with a list of object schemas" do
      let(:source) { [{ "type" => "null" }, { "type" => "file" }] }

      its(:count) { is_expected.to eq 2 }
      its("first.type") { is_expected.to eq "null" }
      its("last.type")  { is_expected.to eq "file" }
    end

    context "with an empty list" do
      let(:source) { [] }
      it { is_expected.to eq [] }
    end

    context "with a list containing invalid object shema" do
      let(:source) { [{ "type" => "null" }, { "title" => "file" }] }

      it "raises Locust::InvalidSchemaError" do
        expect { subject }.to raise_error(Locust::InvalidSchemaError)
      end
    end
  end
end
