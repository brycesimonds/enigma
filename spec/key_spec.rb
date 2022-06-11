require './lib/key'

RSpec.describe Key do
  before :each do
    @key_1 = Key.new
    @key_2 = Key.new("96321")
    @key_3 = Key.new("02876")
  end

  it 'exists' do
    expect(@key_1).to be_a(Key)
  end

  it 'can create an array of 5 random numbers' do
    expect(@key_1.array_random_five_nums).to be_a(Array)
    expect(@key_1.array_random_five_nums.count).to eq(5)
  end

  it 'can create an String of 5 random numbers' do
    expect(@key_1.random_num_string).to be_a(String)
    expect(@key_1.random_num_string.length).to eq(5)
  end

  it 'has a random 5 digit number if no argument passed in' do
    expect(@key_1.number).to be_a(String)
    expect(@key_1.number.length).to eq(5)
  end

  it 'can accept a string of numbers' do
    expect(@key_2.number).to be_a(String)
    expect(@key_2.number.length).to eq(5)
    expect(@key_3.number).to be_a(String)
    expect(@key_3.number.length).to eq(5)
  end

  it 'delegates the A-D keys accurately with no argument given' do
    expect(@key_1.the_keys[:key_a].length).to eq(2)
    expect(@key_1.the_keys[:key_a]).to eq(@key_1.number[0..1])
    expect(@key_1.the_keys[:key_b].length).to eq(2)
    expect(@key_1.the_keys[:key_b]).to eq(@key_1.number[1..2])
    expect(@key_1.the_keys[:key_c].length).to eq(2)
    expect(@key_1.the_keys[:key_c]).to eq(@key_1.number[2..3])
    expect(@key_1.the_keys[:key_d].length).to eq(2)
    expect(@key_1.the_keys[:key_d]).to eq(@key_1.number[3..4])
  end

  it 'delegates the A-D keys accurately with an arugment starting with 0' do
    expect(@key_3.the_keys[:key_a].length).to eq(2)
    expect(@key_3.the_keys[:key_a]).to eq(@key_3.number[0..1])
    expect(@key_3.the_keys[:key_b].length).to eq(2)
    expect(@key_3.the_keys[:key_b]).to eq(@key_3.number[1..2])
    expect(@key_3.the_keys[:key_c].length).to eq(2)
    expect(@key_3.the_keys[:key_c]).to eq(@key_3.number[2..3])
    expect(@key_3.the_keys[:key_d].length).to eq(2)
    expect(@key_3.the_keys[:key_d]).to eq(@key_3.number[3..4])
  end
end
