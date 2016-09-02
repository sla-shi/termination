require 'csv'

class Carriers
  def initialize
    file = "#{Rails.root}/db/addresses.csv"
    @addresses = []
    csv = CSV.read(file, row_sep: :auto, col_sep: ',', quote_char: '"')
    csv.shift
    csv.each do |row|
      @addresses << row
    end
  end
  
  def field_value_by_code(field_number, carrier_code)
    value = nil
    @addresses.each { |x| value=x[field_number] if x[0]==carrier_code }
    value
  end
  
  def address_by_code(carrier_code)
    field_value_by_code(3, carrier_code)
  end
  
  def city_by_code(carrier_code)
    field_value_by_code(4, carrier_code)
  end

  def zip_by_code(carrier_code)
    field_value_by_code(5, carrier_code)
  end

  def name_by_code(carrier_code)
    field_value_by_code(2, carrier_code)
  end

end