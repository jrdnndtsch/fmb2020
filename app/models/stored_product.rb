class StoredProduct < ApplicationRecord
	has_many :creators
	has_many :rights_holders
	has_many :reviews
	has_many :tags
	has_many :sub_tags, through: :tags
end
