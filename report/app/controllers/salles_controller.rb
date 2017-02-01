class SallesController < ApplicationController
  before_action :set_salle, only: [:show, :edit, :update, :destroy]

  # GET /salles
  def index
    @salles = Salle.all
  end

  # GET /salles/1
  def show
  end

  # GET /salles/new
  def new
    @salle = Salle.new
  end

  # GET /salles/1/edit
  def edit
  end

  # POST /salles
  def create
    @salle = Salle.new(salle_params)

    if @salle.save
      redirect_to @salle, notice: 'Salle was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /salles/1
  def update
    if @salle.update(salle_params)
      redirect_to @salle, notice: 'Salle was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /salles/1
  def destroy
    @salle.destroy
    redirect_to salles_url, notice: 'Salle was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_salle
      @salle = Salle.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def salle_params
      params.require(:salle).permit(:purchaser, :description, :unit_price, :quantity, :address, :provider)
    end
end
