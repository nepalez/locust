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

  describe "#verify" do
    subject { keyword.verify object }

    context "when format is integer" do
      let(:schema) { { "type" => "integer" } }
      let(:source) { "integer" }

      context "when object is inside the 32bit signed" do
        let(:object) { 2 ^ 31 - 1 }

        it { is_expected.to eq [] }
      end

      context "when object is greater than 32bit signed" do
        let(:object) { 2 ^ 31 }

        it { is_expected.not_to be_empty }
      end

      context "when object is less than 32bit signed" do
        let(:object) { - 2 ^ 31 - 1 }

        it { is_expected.not_to be_empty }
      end

      context "when object is not an integer" do
        let(:object) { 1.3 }

        it { is_expected.to eq [] }
      end
    end

    context "when format is date" do
      let(:source) { "date" }

      context "when object is a valid date" do
        let(:object) { "2018-04-08" }

        it { is_expected.to eq [] }
      end

      context "when object is not a valid date" do
        let(:object) { "2018-04-38" }

        it { is_expected.not_to be_empty }
      end

      context "when object is not a string" do
        let(:object) { 1.3 }

        it { is_expected.to eq [] }
      end
    end

    context "when format is dateTime" do
      let(:source) { "dateTime" }

      context "when object is a valid dateTime" do
        let(:object) { "2018-04-08 10:00:00" }

        it { is_expected.to eq [] }
      end

      context "when object is not a valid dateTime" do
        let(:object) { "2018-04-30 25:61:61" }

        it { is_expected.not_to be_empty }
      end

      context "when object is not a string" do
        let(:object) { 1.3 }

        it { is_expected.to eq [] }
      end
    end

    context "when custom formatter is defined" do
      let(:parent) do
        Locust::Keywords::Object.call({ schema: schema, config: config }, nil)
      end

      let(:config) do
        Locust::Config.new.tap do |c|
          c.format "email" do
            validate { |value| value.to_s["@"] }
          end
        end
      end

      context "when object satisfy a format validator" do
        let(:object) { "foo@bar.baz" }

        it { is_expected.to eq [] }
      end

      context "when object doesn't satisfy a format validator" do
        let(:object) { "foo.bar.baz" }

        it { is_expected.not_to be_empty }
      end
    end
  end
end
