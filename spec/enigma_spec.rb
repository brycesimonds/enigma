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
end
