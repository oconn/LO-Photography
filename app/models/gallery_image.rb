class GalleryImage < ActiveRecord::Base
	belongs_to :gallery

  has_attached_file :image, 
	                  :styles => { :original => "1600x1600>",
	                               :thumb => "100x100#" }, 
	                  :default_url => "/images/:style/missing.png"

	validates_attachment :image,
	                     :presence => true,
                       :content_type => { :content_type => ['image/jpeg'] }

  after_post_process :compress

  private

	  def compress
	    current_format = File.extname(image.queued_for_write[:original].path)

	    image.queued_for_write.each do |key, file|
	      reg_jpegoptim = /(jpg|jpeg|jfif)/i
	      reg_optipng = /(png|bmp|gif|pnm|tiff)/i

	      logger.info("Processing compression: key: #{key} - file: #{file.path} - ext: #{current_format}")

	      if current_format =~ reg_jpegoptim
	        compress_with_jpegoptim(file)
	      elsif current_format =~ reg_optipng
	        compress_with_optpng(file)
	      else
	        logger.info("File: #{file.path} is not compressed!")
	      end
	    end
	  end

	  def compress_with_jpegoptim(file)
	    current_size = File.size(file.path)
	    Paperclip.run("jpegoptim", "-o --strip-all #{file.path}")
	    compressed_size = File.size(file.path)
	    compressed_ratio = (current_size - compressed_size) / current_size.to_f
	    logger.debug("#{current_size} - #{compressed_size} - #{compressed_ratio}")
	    logger.debug("JPEG family compressed, compressed: #{ '%.2f' % (compressed_ratio * 100) }%")
	  end

	  def compress_with_optpng(file)
	    current_size = File.size(file.path)
	    Paperclip.run("optipng", "-o7 --strip=all #{file.path}")
	    compressed_size = File.size(file.path)
	    compressed_ratio = (current_size - compressed_size) / current_size.to_f
	    logger.debug("#{current_size} - #{compressed_size} - #{compressed_ratio}")
	    logger.debug("PNG family compressed, compressed: #{ '%.2f' % (compressed_ratio * 100) }%")   
	  end                              
end
