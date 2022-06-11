class Enigma
  attr_reader :encrypted
  def initialize
    @encrypted = {}
  end

  def todays_date_ddmmyy
    Time.now.strftime("%m/%d/%y").delete('/')
  end
end
