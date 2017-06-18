class UsersController < ApplicationController
	def index
	end

	def show
		@user = User.find(params[:id])

		if @user != current_user
			redirect_to root_path
		end
	end

	def new
		@user = User.new
	end

	def create
		user = User.new(user_params)

		if user.save
			session[:user_id] = user.id
			redirect_to user_path(user)
		else
			redirect_to root_path
		end
	end

	def update
		ride = Ride.new(attraction_id: params[:attraction_id], user_id: current_user.id)

		if ride.take_ride.is_a? String
			flash[:notice] = ride.take_ride
		else
			flash[:notice] = "Thanks for riding the #{ride.attraction.name}!"
			ride.save
		end

		redirect_to user_path(current_user)
	end

	private

	def user_params
		params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
	end
end
