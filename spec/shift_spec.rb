require './lib/offset'

RSpec.describe Shift do
  before :each do
    @date_without_argument = Time.now.strftime("%m/%d/%y").delete('/')

    @shift_1 = Shift.new
  end

  it 'exists' do
    expect(@shift_1).to be_a(Shift)
  end
end
