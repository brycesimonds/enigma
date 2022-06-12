handle = File.open(ARGV[0], "r")

incoming_text = handle.read

handle.close

p incoming_text
