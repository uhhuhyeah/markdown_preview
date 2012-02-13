#!/usr/bin/env ruby

## ruby markdown_preview /path/to/markdown_file.md /path/to/blog_template.erb
require './lib/converter.rb'
require './lib/renderer.rb'

markdown_file = ARGV.shift
blog_template = ARGV.shift
destination_path = ARGV.shift

if markdown_file && blog_template
	converter = Converter.new(markdown_file)
	converter.process

	renderer = Renderer.new(converter.html, blog_template, destination_path)
	puts "rendering markdown to #{renderer.destination_path}"
	renderer.process
end