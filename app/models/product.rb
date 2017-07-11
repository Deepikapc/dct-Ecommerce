class Product < ActiveRecord::Base
	belongs_to :category
	belongs_to :sub_category
	has_many :reviews
	has_many :cart_line_items

	validates_presence_of :name ,:price, :category_id, :description, :stock,:sub_category_id
	validates_numericality_of :price,:sub_category_id,greater_than:1
	validates_numericality_of :stock,greater_than_or_equal_to: 0
	validates_length_of :description,minimum: 10 #maximum: 100
	validates_numericality_of :category_id,greater_than: 0
	validate :check_for_cod_based_on_price #invoke custom validation
    validate :check_product_category
    validate :product_name_length
	# def formatted_name
 #      "#{self.id}-#{self.name}"
	# end
	#make use of instance method name in collection_select as 4th argument.

	def check_for_cod_based_on_price
		if !self.price.nil?
			if self.price > 50000 && self.cod_eligibility
				self.errors.add(:cod_eligibility,"not available for products greater than 50000")
			end
		end
	end

	def check_product_category
		if !self.category_id.nil?
			if (self.category_id == 1 || self.category_id == 2) && self.cod_eligibility
				self.errors.add(:cod_eligibility,"there is no cod")
			end
		end

	end

	def product_name_length
        if !self.name.nil?
        	if self.name.length < 4
        		self.errors.add(:name,"product name is less than 4 character")
        	end
        end
	end
end
