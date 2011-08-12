class HomeController < ApplicationController
  def index
    @haiku = Haiku.new
    if params[:line1] || params[:line2] || params[:line3]
      @haiku.line1 = params[:line1] 
      @haiku.line2 = params[:line2] 
      @haiku.line3 = params[:line3]
      @haiku.check      
    end
  end
end
