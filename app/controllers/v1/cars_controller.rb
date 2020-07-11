class V1::CarsController < ApplicationController
  before_action :set_todo_item, only: [:show, :edit, :update, :destroy]

  def index
    @cars = Car.all
  end

  def show
  end

  def create
    @car = Car.create(car_params)
    respond_to do |format|
      if @car.save
        format.json { render json: @car.as_json, status: :created }
      else
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    respond_to do |format|
      if @car.update(car_params)
        format.json { render json: @car.as_json }

      else
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @car.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def set_todo_item
    @todo_item = TodoItem.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:year, :model, :make, :price, :person_id)
  end

end
