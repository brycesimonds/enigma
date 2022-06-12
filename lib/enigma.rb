class Enigma
  attr_reader :encrypted
  def initialize
    @encrypted = {}
  end

  def todays_date_ddmmyy
    Time.now.strftime("%m/%d/%y").delete('/')
  end

  def encrypt(string, key = Kew.new.number, date = todays_date_ddmmyy)
    @encrypted[:encryption] = encrypt_string(string, key, date)
    @encrypted[:key] = key
    @encrypted[:date] = date
    return @encrypted
  end

  def array_27_chars
    ("a".."z").to_a << " "
  end

  def string_to_key_instance(key)
    original_key_string = key
    key = Key.new(original_key_string)
  end

  def array_of_shifts(key, date)
    if key.class == String
      original_key_string = key
      key = Key.new(original_key_string)
    end
    shift = Shift.new(key, Offset.new(date))
        array_of_shifts = [shift.the_shifts[:shift_a], shift.the_shifts[:shift_b], shift.the_shifts[:shift_c], shift.the_shifts[:shift_d]]
  end

  def encrypt_string(string, key = Key.new, date = todays_date_ddmmyy)
    if key.class == String
      original_key_string = key
      key = Key.new(original_key_string)
    end
    shift = Shift.new(key, Offset.new(date))
    array_of_shifts = [shift.the_shifts[:shift_a], shift.the_shifts[:shift_b], shift.the_shifts[:shift_c], shift.the_shifts[:shift_d]]
    character_count = 0
    shift_count = 0

    encrypt_word = []
    string.split("").each do |character|
      starting_index_position = array_27_chars.find_index(character)
      starting_point = array_27_chars.rotate(starting_index_position)
      character = starting_point.rotate(array_of_shifts[shift_count])[0]
      encrypt_word << character
      shift_count += 1
    shift_count = 0 if shift_count == 4 #is stopping the method when shift count is 4
    end
    encrypt_word.join("")
  end
end
