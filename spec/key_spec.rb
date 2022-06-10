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
end
