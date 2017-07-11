class SubCategory < ActiveRecord::Base
	belongs_to :category
	has_many :products

	validates_presence_of :name
	validates_uniqueness_of :name
	validates_numericality_of :category_id
end
