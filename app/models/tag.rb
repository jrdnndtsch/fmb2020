class Tag < ApplicationRecord
  belongs_to :stored_product
  has_many :sub_tags
end
