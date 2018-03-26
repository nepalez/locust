RSpec.describe Locust::Schema do
  let(:schema) { Locust::Schema::Object.call(order) }
  let(:source) { yaml_fixture_file "petstore.yml" }
  let(:order)  { source.dig("definitions", "Order") }

  it "builds the schema" do
    expect(schema.properties[:id].schema.type.source).to eq "integer"
  end
end
