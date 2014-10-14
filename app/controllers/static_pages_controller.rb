class StaticPagesController < ApplicationController
  def home
    
  end

  def help
  end

  def about 
  	5.times{puts '*'}
  puts "redirect to about.html.erb" 
  end

  def contact
  end
end
