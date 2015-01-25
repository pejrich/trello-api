class Api::TasksController < ApplicationController
  respond_to :json

  def show
    @task = Task.find(params[:id])
    render :json => @task.to_json
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task, status: :ok
    else
      render json: @task.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      render json: @task
    else
      render json: @task.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    task = Task.find(params[:id])
    if task.destroy
      render json: task, status: :ok
    else
      render nothing: true, status: :unprocessable_entity
    end
  end

  private

    def task_params
      params.require(:task).permit(:name, :bucket_id, :order)
    end
end
