require 'minitest/spec'
require 'minitest/autorun'

require File.join('.', File.dirname(__FILE__), '..', 'lib', 'converter.rb')


describe Converter do
	before do
		@path = File.join('.', File.dirname(__FILE__), 'fixtures', 'markdown.md')
		@converter = Converter.new(@path)
	end

	describe '#initialize' do
		it 'should read Markdown from a file'	do	
			content = File.open(@path) {|f| f.read }
			@converter.raw_markdown.must_equal content
		end
	end

	describe '#process' do	
		before do
			@converter.process
		end
		it 'should use RDiscount to process markdown' do
			content = File.open(@path) {|f| f.read }
			@converter.processed_markdown.must_be_instance_of RDiscount
			@converter.processed_markdown.text.must_equal content
		end
	end

	describe '#html' do
		before do
			@converter.process
		end

		it 'should render HTML from Markdown' do
			@converter.html.must_equal "<h1>Hello, World</h1>\n"
		end
	end
end
