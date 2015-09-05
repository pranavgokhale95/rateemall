class ReviewsController < ApplicationController
	def create
		@category=Category.where("subcategories.products._id"=>params[:product_id]).one
		@subcategory = @category.subcategories.where("products._id"=>params[:product_id]).one
		@product=@subcategory.products.find(params[:product_id])
		@review=@product.reviews.create!(post_params)
		redirect_to @product
	end

	def post_params
		params.require(:review).permit(:author,:product_name,:body)
	end
end
