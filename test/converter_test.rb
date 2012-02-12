require 'minitest/spec'
require 'minitest/autorun'

require File.join('.', File.dirname(__FILE__), '..', 'lib', 'converter.rb')


describe Converter do
	before do
		@markdown = '# I am a heading'
		@converter = Converter.new
	end

	describe '#process' do
		it 'should use RDiscount to process markdown' do
			@converter.process(@markdown)
			@converter.processed_markdown.must_be_instance_of RDiscount
			@converter.processed_markdown.text.must_equal @markdown
		end
	end

	describe '#html' do
		it 'should render HTML from Markdown' do
			@converter.process(@markdown)
			@converter.html.must_match '<h1>I am a heading</h1>'
		end
	end
end
