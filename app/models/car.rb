class Car < ApplicationRecord
	include PgSearch
	pg_search_scope :search_by_brand_and_model, against: [ :brand, :model ]
	belongs_to :user
	has_attachment :photo
end
