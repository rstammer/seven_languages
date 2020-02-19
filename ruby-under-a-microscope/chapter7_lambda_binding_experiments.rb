def fun_factory1(insult)
  ->(name) { "#{name}, #{insult.downcase}" }
end

def fun_factory2(insult)
  ->(name) { "#{name}, #{insult.downcase!}" }
end

def fun_factory3(insult)
  @insult ||= ""
  @insult.replace insult.downcase
  puts "Object ID in method: #{@insult.object_id}"
  ->(name) { puts "Object ID in lambda: #{@insult.object_id}"; "#{name}, #{@insult += "!"}" }
end

insult = "Soon you'll be wearing my sword like a shish kebab!"


puts fun_factory1(insult).call("Guybrush")
puts

begin
  puts fun_factory2(insult.dup.freeze).call("Elaine")
rescue RuntimeError => e
  puts e.message
end
puts

insulter3 = fun_factory3(insult)
puts "ivar in main():      " + @insult

puts insulter3.call("LeChuck")
puts "Object ID in main(): #{@insult.object_id}"
puts "ivar in main():      " + @insult
puts insulter3.call("LeChuck")
puts "ivar in main():      " + @insult
@insult = "LOL"
puts insulter3.call("LeChuck")
