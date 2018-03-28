RSpec.describe Locust::Validators::Example, ".call" do
  subject { described_class.call(schema) }

  let(:schema) { double :schema, source: source, full_path: "example" }
end
