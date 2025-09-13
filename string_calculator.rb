# frozen_string_literal: true

# Parses numbers from string, supports custom delimeter, will throw error for negative numbers
class StringCalculator
  def self.add(input_str)
    return 0 if input_str.empty?
    return input_str.to_i if input_str.length == 1

    delimeter = ','
    if input_str.start_with?('//')
      str_parts = input_str.split('\n')
      delimeter = str_parts[0][2..]
    end

    processed_str = input_str.tr('\n', delimeter)
    digits = processed_str.split(delimeter).map(&:to_i)

    negatives = digits.select(&:negative?)
    raise "negative numbers not allowed #{negatives.join(', ')}" unless negatives.empty?

    digits.sum
  end
end
