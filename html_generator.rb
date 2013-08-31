require 'json'
require 'open-uri'

class HtmlGenerator
	def index
		raw_response = open("http://lcboapi.com/products").read

		#Parse JSON-formatted text into a Ruby Hash
		parsed_response = JSON.parse(raw_response)

		# #Return the actual result data from the respose, ignoring metadata
		@products = parsed_response["result"]

		@products.each do |product|
		 	puts product["name"]
		end	
	end
	def show(product_id)
		#write the same as the index method but passing a product_id in 
		raw_response = open("http://lcboapi.com/products").read

		#Parse JSON-formatted text into a Ruby Hash
		parsed_response = JSON.parse(raw_response)

		# #Return the actual result data from the respose, ignoring metadata
		products = parsed_response["result"]

		products.each do |product|
			if product["id"] == product_id
				puts "Name: #{product["name"]}"
				puts "Primary Category: #{product["primary_category"]}"
				puts "Secondary Category: #{product["secondary_category"]}"
				puts "Origin: #{product["origin"]}"
				

			end
		end	
	end
end