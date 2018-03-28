RSpec.describe Locust::Schemas::AdditionalProperties do
  let(:schema) { described_class.call source, parent }
  let(:parent) { double :parent }
  let(:source) { { "type" => "null" } }

  describe ".call" do
    subject { schema }

    its(:keyword) { is_expected.to eq "additionalProperties" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }
  end

  describe "#schema" do
    subject { schema.schema }

    context "with a true source" do
      let(:source) { true }

      it { is_expected.to be_nil }
    end

    context "with a false source" do
      let(:source) { false }

      it { is_expected.to be_nil }
    end

    context "with a hash source" do
      it { is_expected.to be_kind_of Locust::Schemas::Object }
      its(:source) { is_expected.to eq source }
      its(:parent) { is_expected.to eq schema }
    end

    context "with another source" do
      let(:source) { 1 }

      it { is_expected.to be_kind_of Locust::Schemas::Object }
      its(:source) { is_expected.to eq source }
      its(:parent) { is_expected.to eq schema }
    end
  end

  subject "#allowed?" do
    subject { schema.allowed? }

    context "with a true source" do
      let(:source) { true }

      it { is_expected.to eq true }
    end

    context "with a false source" do
      let(:source) { false }

      it { is_expected.to eq false }
    end

    context "with a hash source" do
      it { is_expected.to be_kind_of Locust::Schemas::Object }

      it { is_expected.to eq true }
    end

    context "with another source" do
      let(:source) { 1 }

      it { is_expected.to eq true }
    end
  end
end
