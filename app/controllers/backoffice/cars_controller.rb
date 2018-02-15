class Backoffice::CarsController < BackofficeController
  before_action :set_backoffice_car, only: %i[show edit update destroy]

  # GET /backoffice/cars
  # GET /backoffice/cars.json
  def index
    @backoffice_cars = Backoffice::Car.all
  end

  # GET /backoffice/cars/1
  # GET /backoffice/cars/1.json
  def show; end

  # GET /backoffice/cars/new
  def new
    @backoffice_car = Backoffice::Car.new
  end

  # GET /backoffice/cars/1/edit
  def edit; end

  # POST /backoffice/cars
  # POST /backoffice/cars.json
  def create
    @backoffice_car = Backoffice::Car.new(backoffice_car_params)

    respond_to do |format|
      if @backoffice_car.save
        format.html { redirect_to @backoffice_car, notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @backoffice_car }
      else
        format.html { render :new }
        format.json { render json: @backoffice_car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backoffice/cars/1
  # PATCH/PUT /backoffice/cars/1.json
  def update
    respond_to do |format|
      if @backoffice_car.update(backoffice_car_params)
        format.html { redirect_to @backoffice_car, notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @backoffice_car }
      else
        format.html { render :edit }
        format.json { render json: @backoffice_car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backoffice/cars/1
  # DELETE /backoffice/cars/1.json
  def destroy
    @backoffice_car.destroy
    respond_to do |format|
      format.html { redirect_to backoffice_cars_url, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_backoffice_car
    @backoffice_car = Backoffice::Car.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def backoffice_car_params
    params.require(:backoffice_car).permit(:marca, :ano, :modelo, :cor)
  end
end
