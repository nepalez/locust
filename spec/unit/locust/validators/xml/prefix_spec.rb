RSpec.describe Locust::Validators::XML::Prefix do
  let(:validator) { described_class.call source }

  describe ".call" do
    subject { validator }

    context "with an empty value" do
      let(:source) { "" }

      it "raises Locust::InvalidSchemaError" do
        expect { subject }.to raise_error(Locust::InvalidSchemaError)
      end
    end
  end
end
