class V1::PersonsController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    @persons = Person.all
  end

  def show
  end

  def create
    @person = Person.create(person_params)
    if @person.save
      format.json { render :show, status: :created, location: v1_person_path(@person) }
    else
      format.json { render json: @person.errors, status: :unprocessable_entity }
    end
  end

  def update
    respond_to do |format|
      if @person.update(person_params)
        format.json { render :show, status: :ok, location: v1_person_path(@person) }
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
