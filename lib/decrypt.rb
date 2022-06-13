require './lib/enigma'
require './lib/offset'
require './lib/key'
require './lib/shift'
require 'date'

enigma = Enigma.new

handle = File.open(ARGV[0], "r")
incoming_string = handle.read.delete('\\"')
handle.close

array_of_encryption_key_date = incoming_string.split(",")
encryption_key_value_string = array_of_encryption_key_date[0]
seperate_encryption_from_message = encryption_key_value_string.split("=>")
the_encrypted_message = seperate_encryption_from_message[1]
