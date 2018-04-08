RSpec.describe Locust::Keywords::Type do
  let(:keyword) { described_class.call source, parent }
  let(:parent)  { Locust::Keywords::Object.call(nil, nil) }
  let(:source)  { "string" }

  describe ".call" do
    subject { keyword }

    its(:keyword) { is_expected.to eq "type" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }
  end

  describe "#validate" do
    subject { keyword.validate }

    context "when source is 'boolean'" do
      let(:source) { "boolean" }
      it { is_expected.to eq [] }
    end

    context "when source is 'integer'" do
      let(:source) { "integer" }
      it { is_expected.to eq [] }
    end

    context "when source is 'number'" do
      let(:source) { "number" }
      it { is_expected.to eq [] }
    end

    context "when source is 'string'" do
      let(:source) { "string" }
      it { is_expected.to eq [] }
    end

    context "when source is 'array'" do
      let(:source) { "array" }
      it { is_expected.to eq [] }
    end

    context "when source is 'object'" do
      let(:source) { "object" }
      it { is_expected.to eq [] }
    end

    context "when source is 'file'" do
      let(:source) { "file" }
      it { is_expected.to eq [] }
    end

    context "when source is not a primitive" do
      let(:source) { "email" }
      it { is_expected.not_to be_empty }
    end

    context "when parent is not an object" do
      let(:parent) { Locust::Schema.call(nil, nil) }
      it { is_expected.not_to be_empty }
    end
  end

  describe "#verify" do
    subject { keyword.verify object }

    let(:parent) { Locust::Keywords::Object.call({ nullable: nullable }, nil) }
    let(:nullable) { true }

    context "when type is boolean" do
      let(:source) { "boolean" }

      context "when object is the true" do
        let(:object) { true }

        it { is_expected.to eq [] }
      end

      context "when object is the false" do
        let(:object) { false }

        it { is_expected.to eq [] }
      end

      context "when object is not a boolean" do
        let(:object) { 1 }

        it { is_expected.not_to be_empty }
      end

      context "when object is nil" do
        let(:object) { nil }

        context "when schema describes nullable object" do
          let(:nullable) { true }

          it { is_expected.to eq [] }
        end

        context "when schema describe non-nullable object" do
          let(:nullable) { false }

          it { is_expected.not_to be_empty }
        end
      end
    end

    context "when type is integer" do
      let(:source) { "integer" }

      context "when object is an integer" do
        let(:object) { 12 }

        it { is_expected.to eq [] }
      end

      context "when object is not an integer" do
        let(:object) { 12.3 }

        it { is_expected.not_to be_empty }
      end

      context "when object is nil" do
        let(:object) { nil }

        context "when schema describes nullable object" do
          let(:nullable) { true }

          it { is_expected.to eq [] }
        end

        context "when schema describe non-nullable object" do
          let(:nullable) { false }

          it { is_expected.not_to be_empty }
        end
      end
    end

    context "when type is number" do
      let(:source) { "number" }

      context "when object is a number" do
        let(:object) { 12.3 }

        it { is_expected.to eq [] }
      end

      context "when object is not a number" do
        let(:object) { :foo }

        it { is_expected.not_to be_empty }
      end

      context "when object is nil" do
        let(:object) { nil }

        context "when schema describes nullable object" do
          let(:nullable) { true }

          it { is_expected.to eq [] }
        end

        context "when schema describe non-nullable object" do
          let(:nullable) { false }

          it { is_expected.not_to be_empty }
        end
      end
    end

    context "when type is string" do
      let(:source) { "string" }

      context "when object is a " do
        let(:object) { "foo" }

        it { is_expected.to eq [] }
      end

      context "when object is not a string" do
        let(:object) { 2 }

        it { is_expected.not_to be_empty }
      end

      context "when object is nil" do
        let(:object) { nil }

        context "when schema describes nullable object" do
          let(:nullable) { true }

          it { is_expected.to eq [] }
        end

        context "when schema describe non-nullable object" do
          let(:nullable) { false }

          it { is_expected.not_to be_empty }
        end
      end
    end

    context "when type is object" do
      let(:source) { "object" }

      context "when object is a hash" do
        let(:object) { {} }

        it { is_expected.to eq [] }
      end

      context "when object is not a hash" do
        let(:object) { 1 }

        it { is_expected.not_to be_empty }
      end

      context "when object is nil" do
        let(:object) { nil }

        context "when schema describes nullable object" do
          let(:nullable) { true }

          it { is_expected.to eq [] }
        end

        context "when schema describe non-nullable object" do
          let(:nullable) { false }

          it { is_expected.not_to be_empty }
        end
      end
    end

    context "when type is array" do
      let(:source) { "array" }

      context "when object is an array" do
        let(:object) { [2] }

        it { is_expected.to eq [] }
      end

      context "when object is not an array" do
        let(:object) { 2 }

        it { is_expected.not_to be_empty }
      end

      context "when object is nil" do
        let(:object) { nil }

        context "when schema describes nullable object" do
          let(:nullable) { true }

          it { is_expected.to eq [] }
        end

        context "when schema describe non-nullable object" do
          let(:nullable) { false }

          it { is_expected.not_to be_empty }
        end
      end
    end

    context "when type is file" do
      let(:source) { "file" }

      context "when object is a File" do
        let(:object) { File.open __FILE__ }

        it { is_expected.to eq [] }
      end

      context "when object is a Tempile" do
        let(:object) { Tempfile.new }

        it { is_expected.to eq [] }
      end

      context "when object is a StringIO" do
        let(:object) { StringIO.new }

        it { is_expected.to eq [] }
      end

      context "when object is not an IO" do
        let(:object) { "foo" }

        it { is_expected.not_to be_empty }
      end

      context "when object is nil" do
        let(:object) { nil }

        context "when schema describes nullable object" do
          let(:nullable) { true }

          it { is_expected.to eq [] }
        end

        context "when schema describe non-nullable object" do
          let(:nullable) { false }

          it { is_expected.not_to be_empty }
        end
      end
    end
  end
end
