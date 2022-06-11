require './lib/enigma'
require 'date'

RSpec.describe Enigma do
  before :each do
    @date_without_argument = Time.now.strftime("%m/%d/%y").delete('/') #such as "061122"

    @enigma_1 = Enigma.new
  end

  it 'exists' do
    expect(@enigma_1).to be_a(Enigma)
  end

  it 'can return todays date in ddmmyy' do
    expect(@enigma_1.todays_date_ddmmyy).to eq(Time.now.strftime("%m/%d/%y").delete('/'))
  end

  xit 'can encrypt a message given 3 arguments' do
    expect(@enigma_1.encrypt("hello world", "02715", "040895")).to eq({
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
      })
  end
end
