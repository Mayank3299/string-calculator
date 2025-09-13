class StringCalculator
  def self.add(input_str)
    return 0 if input_str.empty?
    return input_str.to_i if input_str.length == 1

    processed_str = input_str.tr('\n', ',')
    processed_str.split(',').map(&:to_i).sum
  end
end
