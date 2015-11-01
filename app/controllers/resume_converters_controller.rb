class ResumeConvertersController < ApplicationController
  
  include ResumeConvertersHelper
  
  def new
  end
  
  def convert
    # uploader = ResumeHtmUploader.new
    
    resume = params[:resume_htm]
    if resume.nil?
      name = nil
    else
      name = convert_resume(resume)  
    end  
    send_file("#{Rails.root}/public/converter/output/"+name+'.docx') if !name.nil?
    # render 'new'
    # render 'new'
  end
  
  private
  # def converter_resume_param
  #   params.permit(:resume)
  # end
  

end
