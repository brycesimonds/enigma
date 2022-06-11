class Shift
  attr_reader :the_shifts

  def initialize(key, offset)
    @the_shifts = {
      shift_a: key.the_keys[:key_a].to_i + offset.the_offsets[:offset_a].to_i,
      shift_b: key.the_keys[:key_b].to_i + offset.the_offsets[:offset_b].to_i,
      shift_c: key.the_keys[:key_c].to_i + offset.the_offsets[:offset_c].to_i,
      shift_d: key.the_keys[:key_d].to_i + offset.the_offsets[:offset_d].to_i
    }
  end
end
