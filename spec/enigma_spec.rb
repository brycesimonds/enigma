require './lib/enigma'
require './lib/offset'
require './lib/key'
require './lib/shift'
require 'date'

RSpec.describe Enigma do
  before :each do
    @date_without_argument = Time.now.strftime("%m/%d/%y").delete('/') #such as "061122"

    @enigma_1 = Enigma.new
    @enigma_2 = Enigma.new
  end

  it 'exists' do
    expect(@enigma_1).to be_a(Enigma)
    expect(@enigma_2).to be_a(Enigma)
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

  it 'can encrypt a message given 2 arguments' do
    expect(@enigma_2.encrypt("hello world", "02715")).to be_a(Hash)
  end
end
