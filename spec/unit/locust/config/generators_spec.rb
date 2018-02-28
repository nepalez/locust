RSpec.describe Locust::Config::Generators do
  let(:generators) { described_class.new }

  describe ".new" do
    subject { generators }

    it { is_expected.to be_a Enumerable }

    it "is empty" do
      expect(subject.to_a).to be_empty
    end
  end

  describe "#add" do
    subject { generators.add(options) { "foobar" } }

    let(:options)   { {} }
    let(:generator) { subject.first }

    it "adds a generator to the collection" do
      expect { subject }.to change { generators.count }.by 1
      expect(generator).to be_a Locust::Config::Generator
    end

    it "uses arguments to build the generator" do
      expect(generator.call).to eq "foobar"
      expect(generator).not_to be_immutable
    end

    context "with the 'immutable: true' option" do
      before { options[:immutable] = true }

      it "registers a generator as immutable" do
        expect(generator).to be_immutable
      end
    end

    it "protects internal data by returning itself" do
      expect(subject).to eq generators
    end
  end

  describe "#mutable" do
    subject { generators.mutable }

    before do
      generators.add { "foo" }
      generators.add(immutable: true) { "bar" }
      expect(generators.count).to eq 2
    end

    it "returns the collection" do
      expect(subject).to be_a described_class
    end

    it "filters out immutable generators" do
      expect(subject.count).to eq 1

      expect(subject.first).not_to be_immutable
      expect(subject.first.call).to eq "foo"
    end
  end
end
