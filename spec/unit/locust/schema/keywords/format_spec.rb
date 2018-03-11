RSpec.describe Locust::Schema::Keywords::Format do
  let(:format) { described_class.call source }
  let(:source) { nil }

  describe ".call" do
    subject { format }

    context "with an empty format" do
      let(:source) { "" }

      it "raises Locust::InvalidSchemaError" do
        expect { subject }.to raise_error(Locust::InvalidSchemaError)
      end
    end
  end
end
