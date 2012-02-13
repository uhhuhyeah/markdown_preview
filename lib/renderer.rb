require 'erb'

class Renderer

	attr :markdown, :template, :destination_path, :filename

	def initialize(markdown, template, destination_path=nil)
		@markdown = markdown
		@template = File.open(template, 'r') {|f| f.read }
		@destination_path = destination_path ? destination_path : default_destination_path
	end

	def default_destination_path
		# YYYYMMDDHHMMSS
		@filename = Time.now.utc.strftime('%Y%m%d%H%M') + '_rendered.html'
		File.join(File.expand_path('.'), 'output', filename)
	end

	def process(open=true)
		@content = markdown
		erb_renderer = ERB.new(template)
		f = File.new(destination_path, 'w')
		f.puts erb_renderer.result(binding)
		f.close

		system "open #{destination_path}" if open
	end
end