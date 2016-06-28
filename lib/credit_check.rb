require 'pry'

class CreditCheck
  def initialize(card_number)
    @card_number = card_number
  end
  
  def validate_account_number
    card_number_array = @card_number.split("")
    valid_account_number = card_number_array.map.with_index do |number, index|
      number_to_integer = number.to_i
      if index % 2 == 0
        if (number_to_integer * 2) > 9
          doubled_integer = number_to_integer * 2
          double_digit_array = doubled_integer.to_s.split("")
          new_element = double_digit_array[0].to_i + double_digit_array[1].to_i
        else 
          number_to_integer * 2
        end
      else
        number_to_integer
      end
    end
    binding.pry
    number_total(valid_account_number)
  end
  
  def number_total(new_card_number)
    total = 0
    new_card_number.each do |digit|
      total += digit 
    end
    feedback(total)
  end
  
  def feedback(total)
    if total % 10 == 0
      puts "The number is valid!"
    else
      puts "The number is invalid!"
    end
  end
end

credit_check = CreditCheck.new("6011797668868728")
credit_check.validate_account_number