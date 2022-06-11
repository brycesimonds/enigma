require "date"
class Offset
  attr_reader :date
  def initialize(date = Time.now.strftime("%m/%d/%y").delete('/'))
    @date = date
  end

  def square_date
    return date[1..5].to_i ** 2 if date[0] == "0"
    return date.to_i ** 2 if date[0] != "0"
  end
end
