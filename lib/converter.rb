require 'rdiscount'

class Converter
	attr :processed_markdown
	attr :raw_markdown

	def initialize(resource)
		@raw_markdown = File.open(resource, 'r') { |f| f.read }
	end

	def process
		@processed_markdown = RDiscount.new(raw_markdown, :smart)
	end

	def html
		processed_markdown.to_html
	end
end