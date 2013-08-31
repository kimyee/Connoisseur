require 'json'
require 'open-uri'

class HtmlGenerator
	attr_accessor :products 
	
	def initialize
		raw_response = open("http://lcboapi.com/products").read

		# Parse JSON-formatted text into a Ruby Hash
		parsed_response = JSON.parse(raw_response)

		# Return the actual result data from the response, 
		# ignoring metadata
		#@products = parsed_response["result"].first["id"]
		@products   = parsed_response["result"]
	
	end

	def index
		# puts "HtmlGenerator: index"
		# puts @products

		@products.each do |product|
			product.each do |key, value|
				puts "#{key} : #{value}"

			end 
		end
			
	end




	def show(product_id)
		@products.each do |product|
			# puts product.fetch("id").class
			# puts product_id.class
			if product.fetch("id") == product_id.to_i
				product.each do |key, value|
					puts "#{key} : #{value}"
				end
			end
		end
	end
end