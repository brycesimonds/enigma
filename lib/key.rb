class Key
  attr_reader :number, :the_keys

  def initialize(number = random_num_string)
    @number = number
    @the_keys = {
      key_a: number[0..1], #these will produce sections of the strings,
      key_b: number[1..2], #like "02", or "45"
      key_c: number[2..3],
      key_d: number[3..4]
    }
  end

  def array_random_five_nums #returns something like [1, 0, 6, 5, 2]
    (0..9).to_a.sample(5)
  end

  def random_num_string #returns random 5 digit STRING, "46543"
    array_random_five_nums.join(" ").delete(' ')
  end
end
