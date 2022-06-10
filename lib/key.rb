class Key
  attr_reader :number
  def initialize(number = random_num_string)
    @number = number
  end

  def array_random_five_nums #returns something like [1, 0, 6, 5, 2]
    (0..9).to_a.sample(5)
  end

  def random_num_string #returns random 5 digit STRING, "46543"
    array_random_five_nums.join(" ").delete(' ')
  end
end
