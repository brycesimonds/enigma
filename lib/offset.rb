require "date"
class Offset
  attr_reader :date
  def initialize(date = Time.now.strftime("%m/%d/%Y").delete('/'))
    @date = date
  end
end
