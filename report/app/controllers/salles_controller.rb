# encoding: UTF-8

require 'fileutils'

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
    file = salle_params[:file].read.force_encoding("UTF-8")

    line_num = 0
    file.each_line do |doc|
      line_num += 1

      unless line_num == 1
        item = doc.split("\t")

        @salle = Salle.create({
          purchaser: item[0],
          description: item[1],
          unit_price: item[2],
          quantity: item[3],
          address: item[4],
          provider: item[5]
        })

        Rails.logger.warn("\n\n\n file: #{@salle.errors.inspect} \n\n\n")
      end
    end

    # if @salle.save
    #   redirect_to @salle, notice: 'Salle was successfully created.'
    # else
    #   render action: 'new'
    # end
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
      # params.require(:salle).permit(:purchaser, :description, :unit_price, :quantity, :address, :provider)
      params.require(:salle).permit(:file)
    end
end
