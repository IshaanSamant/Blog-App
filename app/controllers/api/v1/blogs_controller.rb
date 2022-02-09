module Api
	module V1
			class BlogsController < ApplicationController
			def index
				user = User.find(params[:user_id])
				render json: {status: 'SUCCESS',message: 'User blogs loaded', data:user.blogs},status: :ok
			end

      def show
        blog = Blog.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Welcome User', data:blog},status: :ok
      end

			 def create
    			@user = User.find(params[:user_id])
   			 	@blog = @user.blogs.create(blog_params)
    			render json: {status: 'SUCCESS',message: 'New blog is created',data: @blog},status: :ok
  			end

  			def update
  				blog = Blog.find(params[:id])
  				if blog.update(blog_params)
					render json: {status: 'SUCCESS', message: 'Post updated successfully', data:blog},status: :ok
    			else
      				render json: {status: 'ERROR', message: 'There was a problem in updating the post', data:blog.errors},status: :unprocessable_entity
    			end
  			end

  			def destroy
  				blog = Blog.find(params[:id])
				blog.destroy
				render json: {status: 'SUCCESS', message: 'Blog Post Deleted', data:blog},status: :ok
  			end

   			private
    		
    		def blog_params
      			params.require(:blog).permit(:title, :body, :user_id)
    		end

		end
	
	end

end

