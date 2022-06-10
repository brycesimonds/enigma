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
end
