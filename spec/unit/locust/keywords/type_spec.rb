RSpec.describe Locust::Keywords::Type do
  let(:validator) { described_class.call source, parent }
  let(:parent)    { double :parent }

  describe ".call" do
    subject { validator }

    context "with a valid type" do
      let(:source) { :null }

      its(:parent) { is_expected.to eq parent }
      it { is_expected.to eq "null" }
    end
  end

  describe ".errors" do
    subject { validator.errors object, "foo/bar" }

    context "when type is 'null'" do
      let(:source) { "null" }

      context "with nil" do
        let(:object) { nil }
        it { is_expected.to be_empty }
      end

      context "with not a nil" do
        let(:object) { "" }
        it { is_expected.not_to be_empty }
      end
    end

    context "when type is 'boolean'" do
      let(:source) { "boolean" }

      context "with true" do
        let(:object) { true }
        it { is_expected.to be_empty }
      end

      context "with false" do
        let(:object) { true }
        it { is_expected.to be_empty }
      end

      context "with neither true nor false" do
        let(:object) { nil }
        it { is_expected.not_to be_empty }
      end
    end

    context "when type is 'integer'" do
      let(:source) { "integer" }

      context "with an integer" do
        let(:object) { -1 }
        it { is_expected.to be_empty }
      end

      context "with non-integer object" do
        let(:object) { 1.4 }
        it { is_expected.not_to be_empty }
      end
    end

    context "when type is 'number'" do
      let(:source) { "number" }

      context "with an integer" do
        let(:object) { 4 }
        it { is_expected.to be_empty }
      end

      context "with an float" do
        let(:object) { 44.3 }
        it { is_expected.to be_empty }
      end

      context "with another numeric" do
        let(:object) { 3.to_r }
        it { is_expected.to be_empty }
      end

      context "with non-numeric object" do
        let(:object) { "1.4" }
        it { is_expected.not_to be_empty }
      end
    end

    context "when type is 'string'" do
      let(:source) { "string" }

      context "with a string" do
        let(:object) { "4" }
        it { is_expected.to be_empty }
      end

      context "with a symbol" do
        let(:object) { :"42" }
        it { is_expected.to be_empty }
      end

      context "with neither a string nor symbol" do
        let(:object) { 42 }
        it { is_expected.not_to be_empty }
      end
    end

    context "when type is 'array'" do
      let(:source) { "array" }

      context "with an array" do
        let(:object) { [%i[foo bar]] }
        it { is_expected.to be_empty }
      end

      context "with non-array object" do
        let(:object) { { foo: :bar } }
        it { is_expected.not_to be_empty }
      end
    end

    context "when type is 'object'" do
      let(:source) { "object" }

      context "with a hash" do
        let(:object) { { foo: :bar } }
        it { is_expected.to be_empty }
      end

      context "with non-hash object" do
        let(:object) { [%i[foo bar]] }
        it { is_expected.not_to be_empty }
      end
    end

    context "when type is 'file'" do
      let(:source) { "file" }

      context "with a file" do
        let(:object) { File.new(__FILE__) }
        it { is_expected.to be_empty }
      end

      context "with a tempfile" do
        let(:object) { Tempfile.new }
        it { is_expected.to be_empty }
      end

      context "with a IO" do
        let(:object) { IO.new 1 }
        it { is_expected.to be_empty }
      end

      context "with a StringIO" do
        let(:object) { StringIO.new }
        it { is_expected.to be_empty }
      end

      context "with non-IO object" do
        let(:object) { "foo" }
        it { is_expected.not_to be_empty }
      end
    end
  end
end
