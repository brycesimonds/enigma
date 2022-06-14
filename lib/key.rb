class Key
  attr_reader :number, :the_keys

  def initialize(number = random_num_string)
    @number = number
    @the_keys = {
      key_a: number[0..1],
      key_b: number[1..2],
      key_c: number[2..3],
      key_d: number[3..4]
    }
  end

  def array_random_five_nums
    (0..9).to_a.sample(5)
  end

  def random_num_string 
    array_random_five_nums.join(" ").delete(' ')
  end
end
