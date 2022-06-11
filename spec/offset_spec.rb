require './lib/offset'

RSpec.describe Offset do
  before :each do
    @date_without_argument = Time.now.strftime("%m/%d/%y").delete('/')

    @offset_1 = Offset.new
    @offset_2 = Offset.new("040895")
    @offset_3 = Offset.new("113060")
  end

  it 'exists' do
    expect(@offset_1).to be_a(Offset)
  end

  it 'can retrieve the current date in DDMMYY format' do
    expect(@offset_1.date).to eq(@date_without_argument)
  end

  it 'can accept a date that is given' do
    expect(@offset_2.date).to eq("040895")
    expect(@offset_3.date).to eq("113060")
  end

  it 'can square the date' do
    expect(@offset_1.square_date).to eq(@date_without_argument.to_i ** 2)
    expect(@offset_2.square_date).to eq(1672401025)
    expect(@offset_3.square_date).to eq(12782563600)
  end
end
