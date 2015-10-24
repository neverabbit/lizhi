class StaticThemesController < ApplicationController
  def home
    @customer = Customer.new
  end

  def contact
  end
  
  def business
    @customer = Customer.new
  end
  
  def intro
  end
  
  def recruit
  end

end
