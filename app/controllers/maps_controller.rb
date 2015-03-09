class MapsController < ApplicationController
  before_action :require_login_for_api, except: [ :index ]
  
  def index
    @maps = Surf::Map.all
  end
  
  def like
    Surf::Map.find(params[:map_id]).liked_by current_user

    head status: 200
  end

  def unlike
    Surf::Map.find(params[:map_id]).unliked_by current_user

    head status: 200
  end

end
