RSpec.describe Locust::Validators::Item do
  let(:validator) { described_class.call source }

  describe ".call" do
    subject { validator }

    context "with a valid schema" do
      let(:source) { { "type" => "null" } }
      its(:type)   { is_expected.to eq "null" }
    end

    context "with an invalid object shema" do
      let(:source) { { "title" => "file" } }

      it "raises Locust::InvalidSchemaError" do
        expect { subject }.to raise_error(Locust::InvalidSchemaError)
      end
    end
  end
end
