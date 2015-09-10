require "sentimentalizer"
class ReviewsController < ApplicationController
	def create
		@category=Category.where("subcategories.products._id"=>params[:product_id]).one
		@subcategory = @category.subcategories.where("products._id"=>params[:product_id]).one
		@product=@subcategory.products.find(params[:product_id])
		@review=@product.reviews.new(post_params)
		@review.product_name=params[:product_id]
		@review.review_date = Time.now.utc.iso8601
		
		@probability=Sentimentalizer.analyze(@review.body,true).split(':')[2].split(',')[0]
		@review.rating = ((@probability.to_f)*10).round(1)

		if(@review.save)
			redirect_to @product
		end

	end

	def post_params
		params.require(:review).permit(:author,:product_name,:body)
	end
end
