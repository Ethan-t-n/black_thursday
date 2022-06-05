require 'entry'
class CustomerRepository

  attr_reader :id, :created_at, :all

  attr_accessor :first_name,
                :last_name,
                :updated_at

  def initialize(file_path)
    @file_path = file_path
    @all = []
    CSV.foreach(file_path, headers: true, header_converters: :symbol) do |row|
      @all << Customer.new(
        :id => row[:id],
        :first_name => row[:first_name],
        :last_name => row[:last_name],
        :created_at => row[:created_at],
        :updated_at => row[:updated_at]
      )
      end
  end

  # def find_by_id(id)
  #   @all.find do |transaction|
  #     transaction.id == id
  #   end
  # end
  #
  # def find_all_by_invoice_id(invoice_id)
  #   @all.find_all do |transaction|
  #     transaction.invoice_id.to_i == invoice_id.to_i
  #   end
  # end
  #
  # def find_all_by_credit_card_number(card_number)
  #   @all.find_all do |transaction|
  #     transaction.credit_card_number.to_i == card_number.to_i
  #   end
  # end
  #
  # def find_all_by_result(result)
  #   @all.find_all do |transaction|
  #     transaction.result == result
  #   end
  # end
  #
  # def create(attributes)
  #   x = (@all.last.id + 1)
  #   @all << Transaction.new({
  #     :id => x,
  #     :invoice_id => attributes[:invoice_id],
  #     :credit_card_number => attributes[:credit_card_number],
  #     :credit_card_expiration_date => attributes[:credit_card_expiration_date],
  #     :result => attributes[:result],
  #     :created_at => attributes[:created_at],
  #     :updated_at => attributes[:updated_at]
  #     })
  # end
  #
  # def update(id, attributes)
  #   x = find_by_id(id)
  #   x.credit_card_number = attributes[:credit_card_number]
  #   x.credit_card_expiration_date = attributes[:credit_card_expiration_date]
  #   x.result = attributes[:result]
  #   x.updated_at = Time.now
  # end
  #
  # def delete(id)
  #   x = find_by_id(id)
  #   @all.delete(x)
  # end

end
