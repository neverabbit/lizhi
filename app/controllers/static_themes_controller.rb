class StaticThemesController < ApplicationController
  def home
    @customer = Customer.new
  end

  def contact
  end
  
  def business
  end
end
