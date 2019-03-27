class Api::V1::ListController < ApplicationController
    def index
      list = List.order("created_at DESC")
      render json: {status: 200, data: list}, status: :ok
    end

    def show
      list = List.find_by(params[:id])
      render json: {status: 200, data: list}, status: :ok
    end

    def create
      list = List.new(list_params)
      if list.save
        render json: {status: 200, data: list}, status: :ok
      else
        render json: {status: 422, data: list.errors}, status: :unprocessable_entity
      end
    end

    def destroy
      List.find(params[:id]).destroy
      render json: {status: 200, data: nil, message: "List deleted"}, status: :ok
    end

    def destroy_selected
      if Todo.find_by(id: split_query(params[:details], 1))
        Todo.delete(split_query(params[:details], 1))
        List.delete("user_id = #{split_query(params[:details], 0)} AND todo_id = #{split_query(params[:details], 0)}")
        render json: {status: 200, message: 'Todo deleted'}, status: :ok
      else
        render json: {status: 422, message: "No model found"}, status: :unprocessable_entity
      end
    end

    private

    def list_params
      params.permit(:user_id, :todo_id, :data)
    end

    def split_query(arg, pos)
      puts "#{arg} = arg, #{pos} = pos"
      arg.split("&")[pos].split("=")[1]
    end
end
