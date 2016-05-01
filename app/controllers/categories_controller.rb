class CategoriesController < ApplicationController
	before_action :new_cat, only: [:index, :new]
	before_action :require_admin, except: [:index, :show]

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

	def require_admin
		if !logged_in? || (logged_in? and !current_user.admin?)
			flash[:danger] = "Only admins can perform this action!"
			redirect_to categories_path
		end
	end
end