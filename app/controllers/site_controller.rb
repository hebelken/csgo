class SiteController < ApplicationController
  def index
    @servers ||= Surf::Server.all
  end
end
