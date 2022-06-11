require './lib/offset'

RSpec.describe Offset do
  before :each do
    @offset_1 = Offset.new
    @offset_2 = Offset.new("040895")
    @offset_3 = Offset.new("113060")
  end

  it 'exists' do
    expect(@offset_1).to be_a(Offset)
  end

  it 'can retrieve the current date in DDMMYYYY format' do
    expect(@offset_1.date).to eq(Time.now.strftime("%m/%d/%Y").delete('/'))
  end
end
