require "date"
class Offset
  attr_reader :number, :offsets
  def initialize(date = Date.today)
    @date = date

  end
end
