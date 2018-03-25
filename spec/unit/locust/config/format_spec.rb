RSpec.describe Locust::Config::Format do
  let(:container) { described_class.new }

  describe "#generators" do
    subject { container.generators }

    it "is empty by default" do
      expect(subject.to_a).to be_empty
    end
  end

  describe "#generate" do
    subject { container.generate { "foo" } }

    it "adds a generator to the collection" do
      expect { subject }.to change { container.generators.count }.by 1
      expect(container.generators.first.call).to eq "foo"
    end

    it "protects internal data by returning itself" do
      expect(subject).to eq container
    end
  end

  describe "#validators" do
    subject { container.validators }

    it "is empty by default" do
      expect(subject.to_a).to be_empty
    end
  end

  describe "#validate" do
    subject do
      container.validate do |value|
        %(value should equal 'foo', '#{value}' given) unless value == "foo"
      end
    end

    it "adds a validator to the collection" do
      expect { subject }.to change { container.validators.count }.by 1
      validator = container.validators.first

      expect(validator["foo"]).to be_nil
      expect(validator["bar"]).to eq %(value should equal 'foo', 'bar' given)
    end

    it "protects internal data by returning itself" do
      expect(subject).to eq container
    end
  end
end
