require './lib/offset'
require './lib/key'
require './lib/shift'

RSpec.describe Shift do
  before :each do
    @date_without_argument = Time.now.strftime("%m/%d/%y").delete('/')

    @key_1 = Key.new
    @offset_1 = Offset.new
    @shift_1 = Shift.new(@key_1, @offset_1)

    @key_2 = Key.new("96321")
    @offset_2 = Offset.new("040895")
    @shift_2 = Shift.new(@key_2, @offset_2)
  end

  it 'exists' do
    expect(@shift_1).to be_a(Shift)
  end

  it 'has shift a..shift d' do
    expect(@shift_1.the_shifts[:shift_a]).to be_a(Integer)
    expect(@shift_1.the_shifts[:shift_b]).to be_a(Integer)
    expect(@shift_1.the_shifts[:shift_c]).to be_a(Integer)
    expect(@shift_1.the_shifts[:shift_d]).to be_a(Integer)

    expect(@shift_2.the_shifts[:shift_a]).to eq(97)
    expect(@shift_2.the_shifts[:shift_b]).to eq(63)
    expect(@shift_2.the_shifts[:shift_c]).to eq(34)
    expect(@shift_2.the_shifts[:shift_d]).to eq(26)
  end
end
