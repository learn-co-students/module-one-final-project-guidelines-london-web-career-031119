class Api::V1::UserController < ApplicationController
  def index
    user = User.order("created_at DESC")
    render json: {status: 200, data: user}, status: :ok
  end

  def show
    user = User.find(params[:id])
    if user
      render json: {status: 200, data: user}, status: :ok
    else 
      render json: {status: 422, message: "No user"}, status: :unprocessable_entity
    end
  end

  def create
    user = User.find_or_create_by(user_params)
    if user.save
      render json: {status: 200, data: user}, status: :ok
    else
      render json: {status: 500, data: user.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    User.find(params[:id]).destroy
    render json: {status: 200, data: nil, message: "User deleted"}, status: :ok
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      render json: {status: 200, data: user}, status: :ok
    else
      render json: {status: 500, message: "User not updated", data: user.errors}, status: :unprocessable_entity
    end
  end

  def matches
    if User.find(params[:id]).todos.size > 0
      user = User.find(params[:id]).todos
      puts "USER HERE #{user.size}"
      render json: {status: 200, data: user}, status: :ok
    else
      render json: {status: 422, message: "No task for user"}, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:name, :id)
  end
end
