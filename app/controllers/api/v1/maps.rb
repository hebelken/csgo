module API
  module V1
    class Maps < Grape::API
      include API::V1::Defaults

      resource :maps do
        desc "Return all maps"
        get "", root: :maps do
          {maps: Map.all}
        end

        desc "Update maps"
        put ":id", root: :maps do
          map_params = params[:map]
          map = Map.find_by_name(map_params[:name])

          if map.nil?
            error!("Map #{map_params[:id]} does not exist")
          end

          # mass assignment issues with strong parameters?
          if map.update_attributes({
            name: map_params[:name],
            votes: map_params[:votes],
            url: map_params[:url],
            tier: map_params[:tier],
            map_type: map_params[:map_type]
          })
            {map: map.as_json}
          else
            error!({errors: map.errors.messages}, 422)
          end
        end

        desc "Create a new map"
        post do
          map_params = params[:map]
          map = Map.create(map_params)

          if map.save
            {map: map}
          else
            error!({errors: map.errors.messages}, 422)
          end
        end


        desc "Return a map"
        params do
          requires :id, type: String, desc: "ID of the map "
        end
        get ":id", root: "map" do
          {map: Map.where(id: permitted_params[:id]).first!}
        end
      end
    end
  end
end
