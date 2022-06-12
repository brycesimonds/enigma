require './lib/enigma'
require './lib/offset'
require './lib/key'
require './lib/shift'
require 'date'

RSpec.describe Enigma do
  before :each do
    @date_without_argument = Time.now.strftime("%m/%d/%y").delete('/') #such as "061122"

    @enigma_1 = Enigma.new
    @key_1 = Key.new
    @offset_1 = Offset.new
    @shift_1 = Shift.new(@key_1, @offset_1)
    
    @enigma_2 = Enigma.new
    @key_2 = Key.new("96321")
    @offset_2 = Offset.new("040895")
    @shift_2 = Shift.new(@key_2, @offset_2)
  end

  it 'exists' do
    expect(@enigma_1).to be_a(Enigma)
  end

  it 'can return todays date in ddmmyy' do
    expect(@enigma_1.todays_date_ddmmyy).to eq(Time.now.strftime("%m/%d/%y").delete('/'))
  end

  it 'can encrypt a message given 3 arguments' do
    expect(@enigma_1.encrypt("hello world", "02715", "040895")).to eq({
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
      })
  end
end
