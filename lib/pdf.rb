require 'carriers'

class ReportPdf 
  include Prawn::View

  def initialize(record)
    Prawn::Font::AFM.hide_m17n_warning = true
    super()
    @record = record #record.to_a[0]
    @carriers = Carriers.new
    header
    text_content 
    @uid = Digest::SHA1.hexdigest @record.id.to_s + @record.name 
    self.save_as("#{Rails.root}/public/"+@uid+".pdf")
  end

  def uid
    @uid
  end

  def header
    #This inserts an image in the pdf file and sets the size of the image
    #image "#{Rails.root}/app/assets/images/header.png", width: 530, height: 150
  end

  def text_content
    font "Times-Roman"
    
    # The cursor for inserting content starts on the top left of the page. Here we move it down a little to create more space between the text and the image inserted above
    y_position = cursor - 50

    # The bounding_box takes the x and y coordinates for positioning its content and some options to style it
    bounding_box([0, y_position], :width => 270*2, :height => 100) do
      text @record.created_at.to_formatted_s(:pdf) + ", " + @record.city 
      text @record.name, :align => :right
      text @record.address, :align => :right
      text @record.ssn, :align => :right
    end

    text "Termination letter", :align => :center
    
    text @carriers.name_by_code(@record.reserved1)
    text @carriers.address_by_code(@record.reserved1)

    @signed_date = "signed " + @record.contract_signed_date.to_s(:pdf) if @record.contract_signed_date
    @renewed_date = ", renewed " + @record.renewal_date.to_s(:pdf)
    @signed_date += @renewed_date if @signed_date
    
    @fee1 = "there is no Early Termination Fee" if @record.conditional_letter
    @fee2 = "Early Termination Fee is already lower than " + @record.agree_if_less_than + " USD" unless @record.agree_if_less_than
    @fee = @fee1 if @fee1
    
    move_down 20
    text "Dear Sir/Madam,"
    move_down 20
    bounding_box([0, cursor], :width => 2*270, :height => 150) do
      text "This letter is to notify you I’ve decided to terminate my contract " + @record.agreement +
      " with #{@carriers.name_by_code(@record.reserved1)}, " + @signed_date + ". " + 
      "Align with Terms and Conditions, my contract should be terminated within 30 days of receiving this letter."
      move_down 10
      text "As far as I am correct, " + @fee + " corresponded with this contract."
  
      move_down 20
      text "Yours Sincerely,"
      text @record.name
    end
    
  end
end