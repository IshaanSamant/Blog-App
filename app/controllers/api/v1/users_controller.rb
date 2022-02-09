module Api
	module V1
		class UsersController < ApplicationController
			def index
				users = User.all
				render json: {status: 'SUCCESS', message:'Loaded Users', data:users},status: :ok
			end

			def show
				user = User.find(params[:id])
				render json: {status: 'SUCCESS', message: 'Welcome User', data:user},status: :ok
			end

			def create
				user = User.new(user_params)
				if user.save
					render json: {status: 'SUCCESS', message: 'New User Created', data:user},status: :ok
				else
					render json: {status: 'ERROR', message: 'Failed to create user', data:user.errors},status: :unprocessable_entity
				end
			end

			def destroy
				user = User.find(params[:id])
				user.destroy
				render json: {status: 'SUCCESS', message: 'User Deleted', data:user},status: :ok
			end

			def update
				user = User.find(params[:id])
				if user.update(user_params)
					render json: {status: 'SUCCESS', message: 'User Credentials Updated', data:user},status: :ok
    			else
      				render json: {status: 'ERROR', message: 'Username is already taken', data:user.errors},status: :unprocessable_entity
    			end
			end

			def validate
  				user = User.find_by(username: params[:username])
				if user.present? 
					if user[:password]==params[:password] 
						@user = user[:id]
						render json: {status: 'SUCCESS', message: 'User logged in', data:@user},status: :ok
					else
						render json: {status: 'ERROR', message: 'Wrong Password'},status: :unprocessable_entity
					end
		
				else
					render json: {status: 'ERROR', message: 'Invalid Username'},status: :unprocessable_entity
				end
  			end



			private

		 	def user_params
      			params.require(:user).permit(:username, :password)
    		end
		end
	end

end



