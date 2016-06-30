require 'pry'

class CreditCheck
  def initialize(card_number)
    @card_number = card_number
  end
  
  def validate_account_number
    card_number_array = @card_number.reverse.split("")
    total = 0
    valid_account_number = card_number_array.map.with_index do |number, index|
      number_to_integer = number.to_i
      total += generate_new_account_number(number_to_integer, index)
    end
    feedback(total)
  end
  
  def generate_new_account_number(number_to_integer, index)
    if index % 2 == 1 
      calculate_odd_indexes(number_to_integer)
    else
      number_to_integer
    end
  end
  
  def calculate_odd_indexes(number_to_integer)
    if (number_to_integer * 2) > 9
      doubled_integer = number_to_integer * 2
      double_digit_array = doubled_integer.to_s.split("")
      new_element = double_digit_array[0].to_i + double_digit_array[1].to_i
    else 
      number_to_integer * 2
    end
  end
  
  # def number_total(valid_account_number)
  #   total = 0
  #   valid_account_number.each do |digit|
  #     total += digit 
  #   end
  #   feedback(total)
  # end
  
  def feedback(total)
    if total % 10 == 0
      puts "The number is valid!"
    else
      puts "The number is invalid!"
    end
  end
end

puts "Please enter an account number to validate."
input = gets.chomp
credit_check = CreditCheck.new(input)
credit_check.validate_account_number