class StoredProduct < ActiveRecord::Base
	has_many :creators, dependent: :destroy
	has_many :rights_holders, dependent: :destroy
	has_many :reviews, dependent: :destroy
	has_many :tags, dependent: :destroy
	has_many :sub_tags, through: :tags
	has_many :awards, dependent: :destroy

	has_attached_file :featured_image,
	  # styles: {
	  #       thumbnail: '100x100^',
	  #       header: '500x500^'
	  #     },
	  #     convert_options: {
	  #       thumbnail: " -gravity center -crop '100x100+0+0'",
	  #       header: " -gravity center -crop '500x500+0+0'"
	  #     },
	  default_url: "book.jpg"
	  validates_attachment_content_type :featured_image, content_type: /\Aimage\/.*\Z/
	has_attached_file :vendor_logo,
	  styles: {
	        thumbnail: '100x100^',
	        header: '500x500^'
	      },
	      convert_options: {
	        thumbnail: " -gravity center -crop '100x100+0+0'",
	        header: " -gravity center -crop '500x500+0+0'"
	      },
	  default_url: "vendor.jpg"
	  validates_attachment_content_type :vendor_logo, content_type: /\Aimage\/.*\Z/  
end
