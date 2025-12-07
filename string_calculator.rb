# frozen_string_literal: true

# Parses numbers from string, supports custom delimeter, will throw error for negative numbers
class StringCalculator
  def self.calculate(input_str)
    return 0 if input_str.empty?
    return input_str.to_i if input_str.length == 1

    delimeter, input_str = StringCalculator.get_delimeter(input_str)

    processed_str = input_str.tr('\n', delimeter)
    digits = processed_str.split(delimeter).map(&:to_i)
    StringCalculator.check_negatives(digits)

    if delimeter == '*'
      StringCalculator.product(digits)
    else
      StringCalculator.add(digits)
    end
  end

  def self.check_negatives(digits)
    negatives = digits.select(&:negative?)
    raise "negative numbers not allowed #{negatives.join(', ')}" unless negatives.empty?
  end

  def self.add(digits)
    digits.sum
  end

  def self.product(digits)
    digits.inject { |product, num| product * num }
  end

  def self.get_delimeter(input_str)
    delimeter = ','
    if input_str.start_with?('//')
      str_parts = input_str.split('\n')
      delimeter = str_parts[0][2..]
      input_str = str_parts[1]
    end
    [delimeter, input_str]
  end
end
