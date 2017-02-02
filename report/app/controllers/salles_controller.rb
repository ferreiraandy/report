require 'fileutils'

class SallesController < ApplicationController
  before_action :set_salle, only: [:show, :edit, :update, :destroy]

  def index
    @salles = Salle.all
  end

  def show
  end

  def new
    @salle = Salle.new
  end

  def create
    file = salle_params[:file].read.force_encoding("UTF-8")
    line_num = 0
    @salles = @errors = Array.new

    ActiveRecord::Base.transaction do
      file.each_line do |doc|
        line_num += 1

        unless line_num == 1
          col = doc.split("\t")

          salle = Salle.create({
            purchaser: col[0],
            description: col[1],
            unit_price: col[2],
            quantity: col[3],
            address: col[4],
            provider: col[5]
          })

          @salles << salle
          unless salle.errors.messages.blank?
            @errors = salle.errors.messages
            raise ActiveRecord::Rollback, @errors
          end
        end
      end
    end

    Rails.logger.warn("\n\n\n Errors #{@errors.inspect}\n\n\n")
    Rails.logger.warn("\n\n\n Saves #{@salles.inspect}\n\n\n")

    render :template => "salles/list_report"
  end

  private
    def set_salle
      @salle = Salle.find(params[:id])
    end

    def salle_params
      params.require(:salle).permit(:file)
    end
end
