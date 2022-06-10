require './lib/key'

RSpec.describe Key do
  before :each do
    @key = Key.new
  end
  it 'exists' do
    expect(@key).to be_a(Key)
  end 
