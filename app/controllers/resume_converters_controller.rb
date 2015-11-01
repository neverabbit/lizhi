class ResumeConvertersController < ApplicationController
  
  include ResumeConvertersHelper
  
  def new
  end
  
  def convert
    # uploader = ResumeHtmUploader.new
    
    resume = params[:resume_htm]
    name = convert_resume(resume)    
    send_file("#{Rails.root}/public/converter/output/"+name+'.docx')
    
  end
  
  private
  # def converter_resume_param
  #   params.permit(:resume)
  # end
  
  def self.import(file)
  end
end
