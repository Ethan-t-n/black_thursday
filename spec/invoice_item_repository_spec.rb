require'./lib/invoice_item_repository'
require'./lib/invoice_item'
# require'BigDecimal'

RSpec.describe InvoiceItemRepository do
  before :each do
    @sales_engine = InvoiceItemRepository.new("./data/invoice_items.csv")
  end

  it 'exists' do
    expect(@sales_engine).to be_a(InvoiceItemRepository)
  end

  it "returns all known Invoice Item instances" do
    expect(@sales_engine.all).to be_a Array
    expect(@sales_engine.all.count).to eq(21830)
  end
#
  it "can find by id" do
    expect(@sales_engine.find_by_id(1)).to eq(@sales_engine.all.first)
    expect(@sales_engine.find_by_id(8675309)).to eq(nil)
    expect(@sales_engine.find_by_id(1)).to be_a(InvoiceItem)
  end

  it "can find ALL by item id" do
    expect(@sales_engine.find_all_by_item_id(263519844).count).to eq 164
    expect(@sales_engine.find_all_by_item_id(8675309)).to eq([])
    expect(@sales_engine.find_all_by_item_id(263519844)).to be_a Array
  end

  # it "can find all by invoice id" do
  #   expect(@sales_engine.find_by_item_id(263519844)).to eq(@sales_engine.all.first)
  #   expect(@sales_engine.find_by_item_id(8675309)).to eq(nil)
  #   expect(@sales_engine.find_by_item_id(263519844)).to be_a(InvoiceItem)
  # end


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