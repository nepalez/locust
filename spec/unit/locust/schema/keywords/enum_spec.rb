RSpec.describe Locust::Schema::Keywords::Enum do
  let(:enum) { described_class.call source }

  describe ".call" do
    subject { enum }

    context "with a non-array" do
      let(:source) { "foo" }

      it "raises Locust::Schema::DefinitionError" do
        expect { subject }.to raise_error(Locust::Schema::DefinitionError)
      end
    end

    context "with an empty array" do
      let(:source) { [] }

      it "raises Locust::Schema::DefinitionError" do
        expect { subject }.to raise_error(Locust::Schema::DefinitionError)
      end
    end

    context "with an array containing duplications" do
      let(:source) { %w[bar foo bar] }

      it "raises Locust::Schema::DefinitionError" do
        expect { subject }.to raise_error(Locust::Schema::DefinitionError)
      end
    end
  end
end