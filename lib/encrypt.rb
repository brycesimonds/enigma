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
