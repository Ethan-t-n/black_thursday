require 'CSV'
require_relative 'invoice'

class InvoiceRepository

  attr_reader :all


  def initialize(file_path)
    @file_path = file_path
    @all = []
    CSV.foreach(file_path, headers: true, header_converters: :symbol) do |row|
      @all << Invoice.new(
        :id => row[:id],
        :customer_id => row[:customer_id].to_i,
        :merchant_id => row[:merchant_id].to_i,
        :status => row[:status],
        :created_at => row[:created_at],
        :updated_at => row[:updated_at]
        )
      end
  end

  def find_by_id(id)
    @all.find do |invoice|
      invoice.id == id
    end
  end



end