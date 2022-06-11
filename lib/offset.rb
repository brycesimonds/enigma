require "date"
class Offset
  attr_reader :date, :the_squared_date, :the_offsets
  
  def initialize(date = Time.now.strftime("%m/%d/%y").delete('/'))
    @date = date #string like "061122"
    @the_squared_date = square_date #integer
    @the_offsets = {
      offset_a: last_four_nums_of_square_date[0],
      offset_b: last_four_nums_of_square_date[1],
      offset_c: last_four_nums_of_square_date[2],
      offset_d: last_four_nums_of_square_date[3]
    }
  end

  def square_date
    return date[1..5].to_i ** 2 if date[0] == "0"
    return date.to_i ** 2 if date[0] != "0"
  end

  def last_four_nums_of_square_date
    @the_squared_date.to_s[-4..-1]
  end
end
