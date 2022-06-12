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

  def encrypt_string(string, key = Key.new.number, date = todays_date_ddmmyy)
    array_27_chars = ("a".."z").to_a << " "
    shift = Shift.new(key, Offset.new(date))
    array_of_shifts = [shift.the_shifts[:shift_a], shift.the_shifts[:shift_b], shift.the_shifts[:shift_c], shift.the_shifts[:shift_d]]
    character_count = 0
    shift_count = 0

    encrypt_word = string.map do |letter|
      string[character_count] = array_27_chars.rotate(array_of_shifts[shift_count])[0]
      character_count += 1
      shift_count += 1

    return character_count = 0 if character_count == string.length
    return shift_count = 0 if shift_count == 4
    end
    encrypt_word
  end
end
