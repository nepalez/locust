RSpec.describe Locust::Schema::Format do
  let(:format) { described_class.call source }
  let(:source) { nil }

  describe ".call" do
    subject { format }

    context "with an empty format" do
      let(:source) { "" }

      it "raises Locust::Schema::DefinitionError" do
        expect { subject }.to raise_error(Locust::Schema::DefinitionError)
      end
    end
  end
end
