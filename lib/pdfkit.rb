class ReportPdfKit # Load the html to convert to PDF
    def initialize()
        html = File.read("#{Rails.root}/public/500.html")
        # Create a new kit and define page size to be US letter
        kit = PDFKit.new(html, :page_size => 'Letter')
        # Load our stylesheet into the kit to have colors & formatting
        kit.stylesheets << "#{Rails.root}/public/styles.css"
        # Save the html to a PDF file
        kit.to_file("#{Rails.root}/public/termination.pdf")
        # Render the html
        #render :text => html
    end
end