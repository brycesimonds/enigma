class Enigma
  attr_reader :encrypted
  def initialize
    @encrypted = {}
  end

  def todays_date_ddmmyy
    Time.now.strftime("%m/%d/%y").delete('/')
  end

  def encrypt(string, key = Kew.new.number, date = todays_date_ddmmyy)
    @encrypted[:encryption] = string
    @encrypted[:key] = key
    @encrypted[:date] = date
    return @encrypted
  end
end
