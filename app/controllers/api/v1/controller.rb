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

      
    end

    class TodoController < ApplicationController
      def index
        todo = Todo.order("created_at DESC")
        render json: {status: 200, data: todo}, status: :ok
      end

      #def show
      #  todo = User.find_by(params[:name])
      #  render json: {status: 200, data: todo}, status: :ok
      #end
    end
  end
end
