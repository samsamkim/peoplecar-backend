class V1::PersonsController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    @persons = Person.includes(:cars).all
  end

  def show
  end

  def create
    @person = Person.create(person_params)
    respond_to do |format|
      if @person.save
        format.json { render json: @person.as_json, status: :created }
      else
          format.json { render json: @person.errors, status: :unprocessable_entity }
        end
      end
  end

  def update
    respond_to do |format|
      if @person.update(person_params)
        format.json { render json: @person.as_json }
      else
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @person.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:first_name, :last_name, :email)
  end

end
