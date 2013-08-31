require_relative 'html_generator'

if ARGV.empty?
	puts "Usage: ruby router.rb [action]"
else
	action = ARGV[0]
	generator = HtmlGenerator.new

	if action == "index"
		generator.index
	elsif action == "show"
		generator.show(ARGV[1].to_i)
	else
		puts "Unkown action #{action}. Use index or show"
	end
end