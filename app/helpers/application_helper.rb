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
			Rails.logger = Logger.new(STDOUT)
			logger.info "\nStart generate_url_attributes_preview"
			url_attributes = LinkThumbnailer.generate(micropostcontent)
			logger.info "url_attributes: #{url_attributes}"			
		rescue =>e
			nil
		end
	end
	
	def check4video(microposturl)
		begin
			Rails.logger = Logger.new(STDOUT)
			logger.info "\nStart check4video"
			
			require 'magic'
			
			if Rails.env.production?
				filewithpath = "#{microposturl}"
			else
				filewithpath = "./public#{microposturl}"
			end
			
			logger.info "filewithpath: #{filewithpath}"
			
			res = Magic.guess_file_mime(filewithpath)
			logger.info "res: #{res}"
			
			res.start_with? 'video'
		rescue =>e
			nil
		end
	end
	
	def check4image(microposturl)
		begin
			Rails.logger = Logger.new(STDOUT)
			logger.info "\nStart check4image"
			
			require 'magic'
			
			if Rails.env.production?
				filewithpath = "#{microposturl}"
			else
				filewithpath = "./public#{microposturl}"
			end
			
			logger.info "filewithpath: #{filewithpath}"
			
			res = Magic.guess_file_mime(filewithpath)
			logger.info "res: #{res}"
			
			res.start_with? 'image'
		rescue =>e
			nil
		end
	end
end
