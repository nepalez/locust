RSpec.describe Locust::Validators::Property, ".call" do
  subject { described_class.call(schema) }

  let(:schema) { double :schema, source: source, full_path: "foo.property" }
end
