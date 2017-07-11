class CategoriesController < ApplicationController
	def index
		@categories = Category.all
    @category = Category.new
    @product = Product.new
	end
	def new
		@category = Category.new
	end
	def create
		@category = Category.new(params[:category].permit(:name))
		#binding.pry
		if @category.save
			redirect_to categories_path , notice: "Sucessfully created #{@category.name}"
		else
			render new_category_path #render action: "new"
		end

	end

   def show
    begin
     @category = Category.find(params[:id])
     #@products = Product.where('category_id = ?',@category.id)
     @products = @category.products
     rescue ActiveRecord::RecordNotFound
     redirect_to categories_path, notice: "Record Not Found"
    end
   end

   def edit
     @category = Category.find(params[:id])
   end

   def update
   	@category = Category.find(params[:id])
   	if @category.update_attributes(params["category"].permit(:name))
   		redirect_to category_path(@category.id) ,notice: "Sucessfully updated #{@category.name}"
     else
     	render action: "edit"
     end
   end
   def destroy
   	@category = Category.find(params[:id])
   	@category.destroy
   	redirect_to categories_path
   	end
end
