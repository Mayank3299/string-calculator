class StringCalculator
  def self.add(input_str)
    return 0 if input_str.empty?

    input_str.to_i if input_str.length == 1
  end
end
