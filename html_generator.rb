require 'json'
require 'open-uri'

class HtmlGenerator
	attr_accessor :products, :html_start, :html_end
	
	def initialize
		raw_response = open("http://lcboapi.com/products").read

		# Parse JSON-formatted text into a Ruby Hash
		parsed_response = JSON.parse(raw_response)

		# Return the actual result data from the response, 
		# ignoring metadata
		#@products = parsed_response["result"].first["id"]
		@products   = parsed_response["result"]

		@html_start = [ 
			"<!DOCTYPE HTML>\n", 
			"<html lang='en'>\n", 
			"<head>\n", "<link rel='stylesheet' type='text/css' href='style.css'>\n",
			"<link rel='stylesheet' type='text/css' href='reset.css'>\n",
			"<title>Getting Crunked</title>\n",
			"</head>\n",
			"<body>\n"
		]

		@html_end = [
		"</div> <!-- close product div -->\n",
		"</div>  <!-- close container div -->\n",
		"<div id='footer'>Bringing You Happiness Since 1927</div> <!-- close footer div -->\n",
		"</body>\n",
		"</html>\n"
		]
	
	end

	
	def index
		@html_start.each { |tag| puts tag}
		puts "<div id='container'>"
		puts	"<div id='header'>Liquid Happiness</div><!-- close header div -->" 
		puts	"<div class='products'>"

		puts "<div class='container2'>"
		@products.each do |product| 
			if product.has_key?("image_thumb_url") && product.has_key?("id")
				# puts "<div class='id'>#{product['id']}</div>"
				puts "<div class='product_img'> "
					puts " <div class='id'> "
					puts " #{product['id']} "
					puts "</div>"
				puts " <img src='#{product["image_thumb_url"]}'> "
					puts "<div class='product_name'>"
					puts "#{product['name']}"
					puts "</div>"
				puts "</div>"
			end
		end
		puts "</div>"
		@html_end.each { |tag| puts tag }
	end

	def show(product_id)
		@products.each do |product|
			if product.fetch("id") == product_id.to_i
				product.each do |key, value|
					puts "#{key} : #{value}"
				end
			end
		end
	end
end




