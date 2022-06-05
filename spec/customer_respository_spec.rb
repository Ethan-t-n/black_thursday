require './lib/customer_repository'
require './lib/customer'

RSpec.describe CustomerRepository do
  before :each do
    @sales_engine = CustomerRepository.new("./data/customers.csv")
  end

  it 'exists' do
    expect(@sales_engine).to be_a(CustomerRepository)
  end

  it "returns all known Customer instances" do
    expect(@sales_engine.all).to be_a Array
    expect(@sales_engine.all.count).to eq(1000)
  end
#
  it "can find by id" do
    expect(@sales_engine.find_by_id(1)).to eq(@sales_engine.all.first)
    expect(@sales_engine.find_by_id(8675309)).to eq(nil)
    expect(@sales_engine.find_by_id(1)).to be_a(Customer)
  end

  it "can find ALL by first name fragment" do
    fragment = "oe"
    expect(@sales_engine.find_all_by_first_name(fragment).count).to eq 8
    expect(@sales_engine.find_all_by_first_name("CHEESE")).to eq([])
    expect(@sales_engine.find_all_by_first_name(fragment)).to be_a Array
  end

  # it "can find ALL by last name" do
  #   expect(@sales_engine.find_all_by_last_name(1).count).to eq 0
  #   expect(@sales_engine.find_all_by_last_name(9002)).to eq([])
  #   expect(@sales_engine.find_all_by_last_name(1)).to be_a Array
  # end
# #
#   it "can find all by credit_card_number" do
#     expect(@sales_engine.find_all_by_credit_card_number(4068631943231473).count).to eq 1
#     expect(@sales_engine.find_all_by_credit_card_number(8675309)).to eq([])
#     expect(@sales_engine.find_all_by_credit_card_number(4068631943231473)).to be_a Array
#   end
#
#   it "can find all by result" do
#     expect(@sales_engine.find_all_by_result("success").count).to eq 4158
#     expect(@sales_engine.find_all_by_result("cheese")).to eq([])
#     expect(@sales_engine.find_all_by_result("success")).to be_a Array
#   end
# #
#   it 'can create Customer instance' do
#     x = Time.now
#     last_id_number_in_csv = @sales_engine.all.last.id.to_i
#     attributes = {
#       :id => 6,
#       :invoice_id => 8,
#       :credit_card_number => "4242424242424242",
#       :credit_card_expiration_date => "0220",
#       :result => "success",
#       :created_at => x,
#       :updated_at => x
#       }
#     expect(@sales_engine.create(attributes).last.id).to eq(4986)
#     expect(@sales_engine.all.last).to be_a(Customer)
#     expect(@sales_engine.all.count).to eq(4986)
#   end
#
#   it "can update(id, attribute) on a Customer instance" do
#     attributes = {
#       :credit_card_number => "4242424242424242",
#       :credit_card_expiration_date => "0220",
#       :result => "success",
#       }
#
#     @sales_engine.update(1, attributes)
#
#     expect(@sales_engine.find_by_id(1).credit_card_number).to eq("4242424242424242")
#     expect(@sales_engine.find_by_id(1).credit_card_expiration_date).to eq("0220")
#     expect(@sales_engine.find_by_id(1).updated_at).to be_a Time
#   end
# #
#   it "can delete a transaction instance" do
#     expect(@sales_engine.find_by_id(1)).to be_a(Customer)
#     @sales_engine.delete(1)
#     expect(@sales_engine.find_by_id(1)).to eq(nil)
#   end
end