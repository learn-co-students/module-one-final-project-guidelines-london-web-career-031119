module Api
  module V1
    class UserController < ApplicationController
      def index
        user = User.order("created_at DESC")
        render json: {status: 200, data: user}, status: :ok
      end

      def show
        user = User.find_by(params[:name])
        render json: {status: 200, data: user}, status: :ok
      end

      def create
        user = User.new(user_params)
        if user.save
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
          render json: {status: 200, data:article},status: :ok
        else
          render json: {status: 500, message:'User not updated', data:user.errors},status: :unprocessable_entity
        end
      end
    end

    class TodoController < ApplicationController
      def index
        todo = Todo.order("created_at DESC")
        render json: {status: 200, data: todo}, status: :ok
      end
    end

    class ListController < ApplicationController
      def index
        list = List.order("created_at DESC")
        render json: {status: 200, data: list}, status: :ok
      end
    end

    private

    def user_params
      params.permit(:name)
    end
  end
end
