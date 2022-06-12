require './lib/enigma'
require './lib/offset'
require './lib/key'
require './lib/shift'
require 'date'

handle = File.open(ARGV[0], "r")

incoming_text = handle.read

handle.close

puts incoming_text
