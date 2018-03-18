RSpec.describe Locust::Keywords::Format do
  let(:validator) { described_class.call source, parent }
  let(:parent)    { double :parent }

  describe ".call" do
    subject { validator }

    context "with a non-empty value" do
      let(:source) { "foo"}

      its(:parent) { is_expected.to eq parent }
      it { is_expected.to eq "foo" }
    end

    context "with an empty value" do
      let(:source) { "" }

      it "raises Locust::InvalidSchemaError" do
        expect { subject }.to raise_error(Locust::InvalidSchemaError)
      end
    end
  end
end
