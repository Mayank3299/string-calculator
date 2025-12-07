require './string_calculator'

RSpec.describe 'String Calculator' do
  describe 'add' do
    it 'return 0 for an empty string' do
      expect(StringCalculator.calculate('')).to eq(0)
    end

    it 'return the number back if only 1 number is given' do
      expect(StringCalculator.calculate('7')).to eq(7)
    end

    it 'returns the sum of the numbers in the input string' do
      expect(StringCalculator.calculate('1,8')).to eq(9)
    end

    it 'return the sum of numbers with both newline and comma' do
      expect(StringCalculator.calculate('1\n2,3')).to eq(6)
    end

    it 'return the sum with different delimeters support' do
      expect(StringCalculator.calculate('//;\n1;2')).to eq(3)
    end

    it 'throw an error when negative numbers are included' do
      expect { StringCalculator.calculate('1,-2,3') }.to raise_error('negative numbers not allowed -2')
    end

    it 'return all passed negative numbers separated by comma' do
      expect { StringCalculator.calculate('1,-2,3,-3,-8') }.to raise_error('negative numbers not allowed -2, -3, -8')
    end

    it 'return product of all the numbers when delimeter is *' do
      expect(StringCalculator.calculate('//*\n1*2*3*4')).to eq(24)
    end
  end
end
