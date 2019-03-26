class Api::V1::TodoController < ApplicationController
    def index
      todos = Todo.order("created_at DESC")
      render json: {status: 200, data: todo}, status: :ok
    end

    def show
      todo = Todo.find_by(params[:id])
      render json: {status: 200, data: todo}, status: :ok
    end

    def create
      todo = Todo.new(todo_params)
      if todo.save
        render json: {status: 200, data: todo}, status: :ok
      else
        render json: {status: 500, data: todo.errors}, status: :unprocessable_entity
      end
    end

    def destroy
      Todo.find(params[:id]).destroy
      render json: {status: 200, data: nil, message: "Todo deleted"}, status: :ok
    end

    def update
      todo = Todo.find(params[:id])
      if todo.update_attributes(todo_params)
        render json: {status: 200, data: todo}, status: :ok
      else
        render json: {status: 500, message: "Todo not updated", data: todo.errors}, status: :unprocessable_entity
      end
    end

    private

    def todo_params
      params.permit(:task, :priority)
    end
end