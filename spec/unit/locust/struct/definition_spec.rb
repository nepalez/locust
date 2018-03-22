RSpec.describe Locust::Struct::Definition do
  let(:definition) { described_class.new }
  let(:struct)     { double :struct, foo: :bar }

  describe "#prepare" do
    subject { definition.prepare :foo }

    context "without any coercion" do
      it "doesn't change any value" do
        expect(subject).to eq :foo
      end
    end

    context "with a set of coercions" do
      let(:definition) do
        described_class.new do
          coerce { |value| value.to_s.upcase }
          coerce { |value| { value: value } }
        end
      end

      it "applies all the coercions" do
        expect(subject).to eq value: "FOO"
      end
    end
  end

  describe "#valid?" do
    subject { definition.valid? struct }

    context "without any validation" do
      it { is_expected.to eq true }
    end

    context "when all validations succeeded" do
      let(:definition) do
        described_class.new do
          validate { foo }
          validate { foo == :bar }
        end
      end

      it { is_expected.to eq true }
    end

    context "when some validation failed" do
      let(:definition) do
        described_class.new do
          validate { foo.is_a? Integer }
          validate { foo.odd? }
        end
      end

      it { is_expected.to eq false }
    end
  end

  describe "#part" do
    subject { definition.part(struct) }

    context "with a static name" do
      let(:definition) do
        described_class.new do
          name :qux
        end
      end

      it "stringifies the name" do
        expect(subject).to eq "qux"
      end
    end

    context "with a dynamic name" do
      let(:definition) do
        described_class.new do
          name { foo }
        end
      end

      it "builds the string lazily" do
        expect(subject).to eq "bar"
      end
    end

    context "without any name" do
      it { is_expected.to eq "" }
    end
  end

  describe "#desc" do
    subject { definition.desc(struct) }

    context "with a static decription" do
      let(:definition) do
        described_class.new do
          describe :qux
        end
      end

      it "stringifies the description" do
        expect(subject).to eq "qux"
      end
    end

    context "with a dynamic description" do
      let(:definition) do
        described_class.new do
          describe { foo }
        end
      end

      it "builds the string lazily" do
        expect(subject).to eq "bar"
      end
    end

    context "without any description" do
      it { is_expected.to eq "" }
    end
  end
end
