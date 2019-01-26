require 'classifier-reborn'

classifier = ClassifierReborn::Bayes.new('spam', 'not spam')

f = File.open('dataset/sms_spam_collection.txt', 'r')
line_number = 0
f.each_line do |line|
  line_number += 1
  sentence = line.split(' ')
  category = sentence.shift == 'spam' ? 'spam' : 'not spam'
  classifier.train(category, sentence.join(' '))
end

puts "The algorithm was trained with #{line_number} pieces of data"
puts
puts 'What is thy question for the almighty God of SMS Classification?'
question = gets.chomp
puts
puts "The above message is #{classifier.classify question}"
