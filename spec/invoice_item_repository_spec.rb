require'./lib/invoice_item_repository'
# require'BigDecimal'

RSpec.describe InvoiceItemRepository do
  before :each do

    @sales_engine = InvoiceItemRepository.new(:invoice_items => "./data/invoice_items.csv")
  end

  it 'exists' do
    expect(@sales_engine).to be_a InvoiceItemRepository
  end

  it "returns all known Invoice Item instances" do

    expect(@sales_engine.all).to be_a Array
    expect(@sales_engine.all.count).to eq(475)
  end
#
#   it "can find_by_id" do
#
#     expect(@merchant_repository.find_by_id(12334105)).to eq(@merchant_repository.all.first)
#     expect(@merchant_repository.find_by_id(1233)).to eq(nil)
#     expect(@merchant_repository.find_by_id(12334105)).to be_a(Merchant)
#   end
#
#   it "can find_by_name" do
#
#     expect(@merchant_repository.find_by_name("Shopin1901")).to eq(@merchant_repository.all.first)
#     expect(@merchant_repository.find_by_name("XYZ")).to eq(nil)
#     expect(@merchant_repository.find_by_name("Shopin1901")).to be_a(Merchant)
#   end
#
#   it 'can find_all_by_name(name)' do
#     test = @merchant_repository.find_all_by_name("handmade")
#
#     expect(@merchant_repository.find_all_by_name("handmade").count).to eq(6)
#     expect(@merchant_repository.find_all_by_name("handmade")).to be_a(Array)
#     expect(test.map(&:name).include?("SLHandmades")).to eq true
#     expect(test.map(&:id).include?(12334303)).to eq true
#   end
#
#   it 'can create_attributes' do
#     attributes = {
#       name: "BryceGems"
#     }
#
#     expect(@merchant_repository.create(attributes).last.id).to eq(12337412)
#     expect(@merchant_repository.all.last).to be_a(Merchant)
#     expect(@merchant_repository.all.count).to eq(476)
#   end
#
#   it "can update(id, attributes) an merchant instance" do
#     attributes = {
#       name: "BryceGems"
#     }
#
#     @merchant_repository.update(12334105, attributes)
#
#     expect(@merchant_repository.find_by_id(12334105).name).to eq("BryceGems")
#     expect(@merchant_repository.find_by_name("Shopin1901")).to eq(nil)
#   end
#
#   it "can delete a merchant instance" do
#
#     expect(@merchant_repository.find_by_name("Shopin1901")).to be_a(Merchant)
#     @merchant_repository.delete(12334105)
#     expect(@merchant_repository.find_by_name("Shopin1901")).to eq(nil)
#   end
end
