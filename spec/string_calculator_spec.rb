require './string_calculator'

RSpec.describe 'String Calculator' do
  describe 'add' do
    it 'return 0 for an empty string' do
      expect(StringCalculator.add('')).to eq(0)
    end
  end
end
