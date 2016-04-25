module ApplicationHelper

	# Returns the full title on a per-page basis.
	def full_title(page_title = '')
		base_title = "you-win.net"
	
		if page_title.empty?
			base_title
		else
			"#{page_title} | #{base_title}"
		
		end
	end
	
	def generate_url_attributes_preview(micropostcontent)
		begin
			url_attributes = LinkThumbnailer.generate(micropostcontent)
		rescue =>e
			nil
		end
	end
	
	def check4video(microposturl)
		begin
			require 'filemagic'
			filewithpath = "./public#{microposturl}"
			res = FileMagic.new(FileMagic::MAGIC_MIME).file(filewithpath)
			res.start_with? 'video'
		rescue =>e
			nil
		end
	end
	
	def check4image(microposturl)
		begin
			require 'filemagic'
			filewithpath = "./public#{microposturl}"
			res = FileMagic.new(FileMagic::MAGIC_MIME).file(filewithpath)
			res.start_with? 'image'
		rescue =>e
			nil
		end
	end
end
