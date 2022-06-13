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

key = ARGV[2]
date = ARGV[3]

decrypted_text = enigma.decrypt(the_encrypted_message, key, date)

writer = File.open(ARGV[1], "w")
writer.write(decrypted_text)
writer.close

puts "Created '#{ARGV[1]}' with the key #{key} and date #{date}"
