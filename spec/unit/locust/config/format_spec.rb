RSpec.describe Locust::Config::Format do
  let(:container) { described_class.new }

  describe "#generators" do
    subject { container.generators }

    it "returns a collection of generators" do
      expect(subject).to be_a Locust::Config::Generators
    end

    it "is empty by default" do
      expect(subject.to_a).to be_empty
    end
  end

  describe "#generator" do
    subject { container.generator { "foo" } }

    it "adds a generator to the collection" do
      expect { subject }.to change { container.generators.count }.by 1
      expect(container.generators.first.call).to eq "foo"
    end

    it "protects internal data by returning itself" do
      expect(subject).to eq container
    end

    context "with the 'immutable: true' option" do
      subject { container.generator(immutable: true) { "foo" } }

      it "adds an immutable generator" do
        expect(subject.generators.first).to be_immutable
      end
    end
  end
end
