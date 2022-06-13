require './lib/enigma'
require './lib/offset'
require './lib/key'
require './lib/shift'
require 'date'

RSpec.describe Enigma do
  before :each do
    @date_without_argument = Time.now.strftime("%m/%d/%y").delete('/') #such as "061122"

    @enigma_1 = Enigma.new
    @enigma_2 = Enigma.new
  end

  it 'exists' do
    expect(@enigma_1).to be_a(Enigma)
    expect(@enigma_2).to be_a(Enigma)
  end

  it 'can return todays date in ddmmyy' do
    expect(@enigma_1.todays_date_ddmmyy).to eq(Time.now.strftime("%m/%d/%y").delete('/'))
  end

  it 'can encrypt a message given 3 arguments' do
    expect(@enigma_1.encrypt("hello world", "02715", "040895")).to eq({
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
      })
  end

  it 'can encrypt a message given 2 arguments' do
    expect(@enigma_2.encrypt("hello world", "02715")).to be_a(Hash)
    expect(@enigma_2.encrypt("hello world", "02715")[:encryption].length).to eq(11)
  end

  it 'can encrypt a message given 1 argument of String' do
    encrypted = @enigma_1.encrypt("hello world")

    expect(encrypted).to be_a(Hash)
    expect(encrypted[:encryption].length).to eq(11)
    expect(encrypted[:key].length).to eq(5)
    expect(encrypted[:date].length).to eq(6)
  end

  it 'can encrypt a message given random case charcaters' do
    expect(@enigma_1.encrypt("hELlo wOrLD", "02715", "040895")).to eq({
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
      })
  end

  it 'can encrypt a message given a character not in the 27 character set' do
    expect(@enigma_1.encrypt("hello world!", "02715", "040895")).to eq({
      encryption: "keder ohulw!",
      key: "02715",
      date: "040895"
      })
  end

  it 'can encrypt a message given a character not in the 27 character set that is in the middle' do
    expect(@enigma_1.encrypt("hello &world", "02715", "040895")).to eq({
      encryption: "keder &ohulw",
      key: "02715",
      date: "040895"
      })
  end

  it 'can return array of 27 characters a-z and space' do
    expect(@enigma_1.array_27_chars).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end

  it 'decrypt a message given a key and date' do
    expect(@enigma_1.decrypt("keder ohulw", "02715", "040895")).to eq({
      decryption: "hello world",
      key: "02715",
      date: "040895"
      })
  end

  it 'decrypt a message given a key' do
    encrypted = @enigma_1.encrypt("hello world", "02715")
    expect(@enigma_1.decrypt(encrypted[:encryption], "02715")).to eq({
      decryption: "hello world",
      key: "02715",
      date: @date_without_argument
      })
    end

  it 'can pass characters into decrypted word array' do
    expect(@enigma_1.decrypt_string("keder ohulw!", "02715", "040895")).to eq("hello world!")
  end

  it 'can produce an array of shifts' do
    string = "hello world"
    shift = Shift.new(Key.new("02715"), Offset.new("040895"))

    expect(@enigma_1.array_of_shifts(shift)).to eq([3, 27, 73, 20])
  end
end
