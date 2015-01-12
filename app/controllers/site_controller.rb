class SiteController < ApplicationController
  def index
    @servers ||= SurfServer.all
  end
end
