RSpec.describe Locust::Loader do
  subject { described_class.call source }

  let(:data) { { "foo" => "bar" } }
  let(:yaml) { YAML.dump data }
  let(:json) { JSON.dump data }

  context "with a local path to yaml file" do
    let(:source) { local_path(yaml) }

    it { is_expected.to eq data }
  end

  context "with a local path to json file" do
    let(:source) { local_path(json) }

    it { is_expected.to eq data }
  end

  context "with a local path to another file" do
    let(:source) { local_path("foo") }

    it { is_expected.to eq "foo" }
  end

  context "with a uri of yaml file" do
    let(:source) { remote_path(yaml) }

    it { is_expected.to eq data }
  end

  context "with a uri of json file" do
    let(:source) { remote_path(json) }

    it { is_expected.to eq data }
  end

  context "with a uri of another file" do
    let(:source) { remote_path("foo") }

    it { is_expected.to eq "foo" }
  end

  context "with neither a filename nor uri" do
    let(:source) { "foo" }

    it "raises StandardError" do
      expect { subject }.to raise_error(StandardError)
    end
  end

  context "with not a string" do
    let(:source) { 12 }

    it "raises TypeError" do
      expect { subject }.to raise_error(TypeError)
    end
  end
end
