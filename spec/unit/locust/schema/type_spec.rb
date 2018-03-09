RSpec.describe Locust::Schema::Type do
  let(:type)   { described_class.call source }
  let(:source) { nil }

  describe ".call" do
    subject { type }

    context "with a :null" do
      let(:source) { :null }
      it { is_expected.to eq "null" }
    end

    context "with a :boolean" do
      let(:source) { :boolean }
      it { is_expected.to eq "boolean" }
    end

    context "with a :integer" do
      let(:source) { :integer }
      it { is_expected.to eq "integer" }
    end

    context "with a :number" do
      let(:source) { :number }
      it { is_expected.to eq "number" }
    end

    context "with a :string" do
      let(:source) { :string }
      it { is_expected.to eq "string" }
    end

    context "with a :object" do
      let(:source) { :object }
      it { is_expected.to eq "object" }
    end

    context "with a :array" do
      let(:source) { :array }
      it { is_expected.to eq "array" }
    end

    context "with a :file" do
      let(:source) { :file }
      it { is_expected.to eq "file" }
    end

    context "with invalid primitive type" do
      let(:source) { "foo" }

      it "raises Locust::Schema::DefinitionError" do
        expect { subject }.to raise_error(Locust::Schema::DefinitionError)
      end
    end
  end
end
