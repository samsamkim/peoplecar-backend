class V1::CarsController < ApplicationController
  before_action :set_todo_item, only: [:show, :edit, :update, :destroy]

  def index
    @cars = Car.all
  end

  def show
  end

  def create
    @car = Car.create(car_params)
    if @car.save
      format.json { render :show, status: :created, location: v1_car_path(@car) }
    else
      format.json { render json: @car.errors, status: :unprocessable_entity }
    end

  end

  def update
    respond_to do |format|
      if @car.update(car_params)
        format.json { render :show, status: :ok, location: v1_car_path(@car) }
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
    params.require(:car).permit(:year, :model, :make, :price)
  end

end
