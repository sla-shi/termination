require 'pdf'
class RecordsController < ApplicationController
    def index
        @records = Record.all
    end
    
    def new
      @record = Record.new
    end
    
    def show
      @record = Record.find(params[:id])
      # TODO: render the PDF here
      @pdf = ReportPdf.new(@record)
      Digest::SHA1.hexdigest @record.id.to_s + @record.name 
      render 'pdf'
    end
    
    def create
      @record = Record.new(record_params)
      if @record.save
        #logger.info record_params
        render json: @record
      else
        render json: @record.errors, status: :unprocessable_entity
      end
    end
  
    private

    def record_params
      params.require(:record).permit(
        :name, :address, :city,
          :state, :snn, :contract_signed_date, :type_of_contract, :agreement, 
        :renewal_date, :conditional_letter, :agree_if_less_than, :reserved1)
    end
end
