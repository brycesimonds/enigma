require './lib/enigma'
require './lib/offset'
require './lib/key'
require './lib/shift'
require 'date'

enigma = Enigma.new

handle = File.open(ARGV[0], "r")
incoming_text = handle.read
handle.close
encrypted_text = enigma.encrypt(incoming_text.delete("\n"))

writer = File.open(ARGV[1], "w")
writer.write(encrypted_text)
writer.close

reader_key = File.open(ARGV[1], "r")
key = reader_key.read[-24..-20]
reader_key.close

reader_date = File.open(ARGV[1], "r")
date = reader_date.read[-8..-3]
reader_date.close



puts "Created '#{ARGV[1]}' with the key #{key} and date #{date}"
