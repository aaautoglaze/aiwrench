class PagesController < ApplicationController
  def home
    @lead = Lead.new
  end
end
