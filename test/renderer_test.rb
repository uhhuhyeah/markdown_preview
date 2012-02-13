require 'minitest/spec'
require 'minitest/autorun'

require File.join('.', File.dirname(__FILE__), '..', 'lib', 'renderer.rb')

describe Renderer do
	before do
		@template = File.join('.', File.dirname(__FILE__), 'fixtures', 'template.erb')
	end

	describe '#initialize' do

		it 'should store the processed Markdown' do
			markdown = '<h1>Foo</h1>'
			renderer = Renderer.new(markdown, @template)
			renderer.markdown.must_equal markdown
		end

		it 'should open and store the template file' do
			template_content = File.open(@template, 'r') {|f| f.read }
			renderer = Renderer.new('markdown', @template)
			renderer.template.must_equal template_content
		end

		it 'should use a supplied desitnation file path if provided one' do
			destination_path = File.join('.', File.expand_path(__FILE__))
			renderer = Renderer.new('markdown', @template, destination_path)
			renderer.destination_path.must_equal destination_path
		end

		it 'should use a default desitnation file path if none provided' do
			filename = Time.now.utc.strftime('%Y%m%d%H%M') + '_rendered.html'
			default_destination_path = File.join(File.expand_path('.'), 'output', filename)

			renderer = Renderer.new('markdown', @template)
			renderer.destination_path.must_equal default_destination_path
		end
	end

	describe '#process' do
		before do
			@markdown = '<h1>Foo</h1>'
			@renderer = Renderer.new(@markdown, @template)
			@renderer.process
		end

		it 'should write rendered file to disk' do
			File.exists?(@renderer.destination_path).must_equal true
		end
		
		it 'should render the processed Markdown in with the template' do
			file = File.open(@renderer.destination_path, 'r') {|f| f.read }
			file.must_match @markdown
		end
	end
end