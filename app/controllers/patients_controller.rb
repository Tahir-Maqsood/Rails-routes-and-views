class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  def index
    # @patients = Patient.all

    # Using kaminari paginate
    @patients = Patient.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      redirect_to @patient, notice: 'Patient was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @patient.update(patient_params)
      redirect_to @patient, notice: 'Patient was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_url, notice: 'Patient was successfully destroyed.'
  end

  private

  def set_patient
    if params[:id].to_i.to_s == params[:id]
      # If params[:id] is an integer, treat it as an ID
      @patient = Patient.find(params[:id])
    else
      # If params[:id] is not an integer, treat it as a name
      @patient = Patient.find_by(name: params[:id])
    end
    # Ensure that the patient is found before attempting to destroy
    raise ActiveRecord::RecordNotFound unless @patient
  end


  def patient_params
    params.require(:patient).permit(:name, :age, :email, :address)
  end
end
