require 'fileutils'

class SallesController < ApplicationController
  def index
    @salle = Salle.new
  end

  def list_report
    @salles = Salle.all
  end

  def create
    file = salle_params[:file].read.force_encoding("UTF-8")
    line_num = 0
    @salles = Array.new
    
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
            provider: col[5],
            total_price: (col[2].to_f * col[3].to_f)
          })

          unless salle.errors.messages.blank?
            @errors = salle.errors.messages
            raise ActiveRecord::Rollback, @errors
          end

          @salles << salle
        end
      end
    end

    render :template => "salles/list_report"
  end

  private
    def salle_params
      params.require(:salle).permit(:file)
    end
end
