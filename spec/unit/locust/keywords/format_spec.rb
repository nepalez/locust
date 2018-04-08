RSpec.describe Locust::Keywords::Format do
  let(:keyword) { described_class.call source, parent }
  let(:parent)  { Locust::Keywords::Object.call(schema, nil) }
  let(:schema)  { { "type" => "string" } }
  let(:source)  { "email" }

  describe ".call" do
    subject { keyword }

    its(:keyword) { is_expected.to eq "format" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }
  end

  describe "#validate" do
    subject { keyword.validate }

    it { is_expected.to eq [] }

    context "when source is empty" do
      let(:source) { "" }

      it { is_expected.not_to be_empty }
    end

    context "when source is not a string" do
      let(:source) { 32 }

      it { is_expected.not_to be_empty }
    end

    context "when parent is not an object" do
      let(:parent) { Locust::Schema.call(nil, nil) }

      it { is_expected.not_to be_empty }
    end

    context "when type of integer format is not an integer" do
      let(:schema) { { "type" => "string" } }
      let(:source) { "integer" }

      it { is_expected.not_to be_empty }
    end

    context "when type of long format is not an integer" do
      let(:schema) { { "type" => "string" } }
      let(:source) { "long" }

      it { is_expected.not_to be_empty }
    end

    context "when type of float format is not a number" do
      let(:schema) { { "type" => "string" } }
      let(:source) { "float" }

      it { is_expected.not_to be_empty }
    end

    context "when type of double format is not a number" do
      let(:schema) { { "type" => "string" } }
      let(:source) { "double" }

      it { is_expected.not_to be_empty }
    end

    context "when type of string format is not a string" do
      let(:schema) { { "type" => "integer" } }
      let(:source) { "string" }

      it { is_expected.not_to be_empty }
    end

    context "when type of byte format is not a string" do
      let(:schema) { { "type" => "integer" } }
      let(:source) { "byte" }

      it { is_expected.not_to be_empty }
    end

    context "when type of binary format is not a string" do
      let(:schema) { { "type" => "integer" } }
      let(:source) { "binary" }

      it { is_expected.not_to be_empty }
    end

    context "when type of boolean format is not a boolean" do
      let(:schema) { { "type" => "integer" } }
      let(:source) { "boolean" }

      it { is_expected.not_to be_empty }
    end

    context "when type of date format is not a string" do
      let(:schema) { { "type" => "integer" } }
      let(:source) { "date" }

      it { is_expected.not_to be_empty }
    end

    context "when type of dateTime format is not a string" do
      let(:schema) { { "type" => "integer" } }
      let(:source) { "dateTime" }

      it { is_expected.not_to be_empty }
    end

    context "when type of password format is not a string" do
      let(:schema) { { "type" => "integer" } }
      let(:source) { "password" }

      it { is_expected.not_to be_empty }
    end
  end
end
