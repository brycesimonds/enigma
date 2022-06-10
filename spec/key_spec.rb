require './lib/key'

RSpec.describe Key do
  before :each do
    @key = Key.new
  end

  it 'exists' do
    expect(@key).to be_a(Key)
  end

  it 'can create an array of 5 random numbers' do
    expect(@key.array_random_five_nums).to be_a(Array)
    expect(@key.array_random_five_nums.count).to eq(5)
  end

  it 'can create an String of 5 random numbers' do
    expect(@key.random_num_string).to be_a(String)
    expect(@key.random_num_string.length).to eq(5)
  end

  it 'has a random 5 digit number if no argument passed in' do
    expect(@key.number).to be_a(String)
    expect(@key.number.length).to eq(5)
  end

  it 'can accept a string of numbers' do
    @key_1 = Key.new("96321")
    @key_2 = Key.new("02876")
    expect(@key_1.number).to be_a(String)
    expect(@key_1.number.length).to eq(5)
    expect(@key_2.number).to be_a(String)
    expect(@key_2.number.length).to eq(5)
  end

  it 'delegates the A-D keys accurately' do
    expect(@key.keys[key_a].length).to eq(2)
    expect(@key.keys[key_a]).to eq(number[0,1])
    expect(@key.keys[key_b].length).to eq(2)
    expect(@key.keys[key_b]).to eq(number[1,2])
    expect(@key.keys[key_c].length).to eq(2)
    expect(@key.keys[key_c]).to eq(number[2,3])
    expect(@key.keys[key_d].length).to eq(2)
    expect(@key.keys[key_d]).to eq(number[3,4])
  end
end
