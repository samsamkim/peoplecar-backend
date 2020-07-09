class V1::CarsController < ApplicationController
  before_action :set_todo_item, only: [:show, :edit, :update, :destroy]

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def set_todo_item
    @todo_item = TodoItem.find(params[:id])
  end

end
