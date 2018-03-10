RSpec.describe Locust::Schema::Keywords::Required do
  let(:required) { described_class.call source }
  let(:source)   { %i[foo bar] }

  describe ".call" do
    subject { required }

    it { is_expected.to eq %w[foo bar] }

    context "with an empty array" do
      let(:source) { [] }
      it { is_expected.to eq [] }
    end

    context "with an empty values" do
      let(:source) { ["", "foo"] }

      it "raises Locust::Schema::DefinitionError" do
        expect { subject }.to raise_error(Locust::Schema::DefinitionError)
      end
    end

    context "with duplicates" do
      let(:source) { %i[foo bar foo] }

      it "raises Locust::Schema::DefinitionError" do
        expect { subject }.to raise_error(Locust::Schema::DefinitionError)
      end
    end

    context "with non-array value" do
      let(:source) { "foo" }

      it "raises Locust::Schema::DefinitionError" do
        expect { subject }.to raise_error(Locust::Schema::DefinitionError)
      end
    end
  end
end
