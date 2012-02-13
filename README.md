# MarkdownPreview

Command line tool for generating Markdown previews of blog posts within the context of the layout and CSS of it's blog

### Usage

	$ ruby markdown_preview.rb /path/to/markdown_file.md /path/to/blog_template.erb

This will write a HTML file using the supplied template (so make sure the template includes it's CSS) to `./output`. Alternatively you can pass a third argument for the destination path of the rendered file.

Eg

	$ ruby markdown_preview.rb /path/to/markdown_file.md /path/to/blog_template.erb /path/where/the/file/should/be/rendered

#### Questions/Comments

{David A McClain}[mailto:david@uhhuhyeah.com]