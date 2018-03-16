RSpec.describe Locust::Validators::XML::Wrapped do
  let(:validator) { described_class.call source, parent }
  let(:parent)    { double :parent }

  describe ".call" do
    subject { validator }

    context "with a true" do
      let(:source) { "true" }

      its(:parent) { is_expected.to eq parent }
      it { is_expected.to eq true }
    end

    context "with a zero value" do
      let(:source) { "false" }
      it { is_expected.to eq false }
    end

    context "with neither true nor false" do
      let(:source) { :foo }

      it "raises Locust::InvalidSchemaError" do
        expect { subject }.to raise_error(Locust::InvalidSchemaError)
      end
    end
  end
end
