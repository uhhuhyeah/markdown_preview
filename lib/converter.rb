require 'rdiscount'

class Converter
	attr :processed_markdown

	def process(markdown)
		@processed_markdown = RDiscount.new(markdown)
	end

	def html
		@processed_markdown.to_html
	end
end