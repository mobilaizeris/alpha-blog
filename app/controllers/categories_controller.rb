class CategoriesController < ApplicationController
	before_action :new_cat, only: [:index, :new]

	def index
		@categories = Category.paginate(page: params[:page], per_page: 5)
	end

	def new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:success] = "Category was created!"
			redirect_to categories_path
		else
			render 'new'
		end
	end

	def show
		
	end

	private
	def new_cat
		@category = Category.new
	end

	def category_params
		params.require(:category).permit(:name)
	end
end