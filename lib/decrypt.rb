require './lib/enigma'
require './lib/offset'
require './lib/key'
require './lib/shift'
require 'date'

enigma = Enigma.new

handle = File.open(ARGV[0], "r")
incoming_string = handle.read.delete('\\"')
handle.close
