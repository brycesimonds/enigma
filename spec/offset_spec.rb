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

  it 'can have a squared date' do
    expect(@offset_1.the_squared_date).to eq(@date_without_argument.to_i ** 2)
    expect(@offset_2.the_squared_date).to eq(1672401025)
    expect(@offset_3.the_squared_date).to eq(12782563600)
  end

  it 'can retrieve last 4 digits of the_squared_date' do
    expect(@offset_1.last_four_nums_of_square_date).to eq(@offset_1.the_squared_date.to_s[-4..-1])
    expect(@offset_2.last_four_nums_of_square_date).to eq("1025")
    expect(@offset_3.last_four_nums_of_square_date).to eq("3600")
  end

  it 'has offset_a, b, c and d' do
    expect(@offset_1.the_offsets[:offset_a]).to eq(@offset_1.last_four_nums_of_square_date[0])
    expect(@offset_1.the_offsets[:offset_b]).to eq(@offset_1.last_four_nums_of_square_date[1])
    expect(@offset_1.the_offsets[:offset_c]).to eq(@offset_1.last_four_nums_of_square_date[2])
    expect(@offset_1.the_offsets[:offset_d]).to eq(@offset_1.last_four_nums_of_square_date[3])

    expect(@offset_2.the_offsets[:offset_a]).to eq("1")
    expect(@offset_2.the_offsets[:offset_b]).to eq("0")
    expect(@offset_2.the_offsets[:offset_c]).to eq("2")
    expect(@offset_2.the_offsets[:offset_d]).to eq("5")

    expect(@offset_3.the_offsets[:offset_a]).to eq("3")
    expect(@offset_3.the_offsets[:offset_b]).to eq("6")
    expect(@offset_3.the_offsets[:offset_c]).to eq("0")
    expect(@offset_3.the_offsets[:offset_d]).to eq("0")
  end
end
