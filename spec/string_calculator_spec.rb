require './string_calculator'

RSpec.describe 'String Calculator' do
  describe 'add' do
    it 'return 0 for an empty string' do
      expect(StringCalculator.add('')).to eq(0)
    end

    it 'return the number back if only 1 number is given' do
      expect(StringCalculator.add('7')).to eq(7)
    end
  end
end
