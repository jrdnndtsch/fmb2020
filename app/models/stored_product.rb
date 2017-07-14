class StoredProduct < ApplicationRecord
	has_many :creators, dependent: :destroy
	has_many :rights_holders, dependent: :destroy
	has_many :reviews, dependent: :destroy
	has_many :tags, dependent: :destroy
	has_many :sub_tags, through: :tags
end
