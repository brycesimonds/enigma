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

  def encrypt_string(string, key = Key.new, date = todays_date_ddmmyy)
    if key.class == String
      original_key_string = key
      key = Key.new(original_key_string)
    end
    shift = Shift.new(key, Offset.new(date))
    array_of_shifts = [shift.the_shifts[:shift_a], shift.the_shifts[:shift_b], shift.the_shifts[:shift_c], shift.the_shifts[:shift_d]]
    shift_count = 0

    encrypt_word = []
    string.downcase.split("").each do |character|
      starting_point = array_27_chars.rotate(array_27_chars.find_index(character))
      encrypt_word << starting_point.rotate(array_of_shifts[shift_count])[0]
      shift_count += 1
    shift_count = 0 if shift_count == 4
    end
    encrypt_word.join("")
  end
end
