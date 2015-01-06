module API
  module V1
    class Servers < Grape::API
      include API::V1::Defaults

      resource :servers do
        desc "Return all servers"
        get "", root: :servers do
          {servers: Server.all}
        end

        desc "Return a server"
        params do
          requires :id, type: String, desc: "ID of the server "
        end
        get ":id", root: "server" do
          {server: Server.where(id: permitted_params[:id]).first!}
        end
      end
    end
  end
end
