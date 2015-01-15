module API
  module V1
    class Servers < Grape::API
      include API::V1::Defaults

      resource :servers do
        desc 'Return all servers'
        get '', root: :servers do
          {servers: Surf::Server.all}
        end

        desc 'Return a server'
        params do
          requires :id, type: String, desc: 'ID of the server'
        end
        get ':id', root: 'server' do
          {server: Surf::Server.where(id: permitted_params[:id]).first!}
        end

        desc 'Get server status'
        params do
          requires :id, type: String, desc: 'ID of the server'
        end
        get ':id/status', root: 'server' do
          server = Surf::Server.where(id: permitted_params[:id]).first!

          error!("Server #{permitted_params[:id]} does not exist", 404) unless server

          begin
            server.update
            return {server: server}
          rescue
            error!("Could not get a response from server", 200)
          end
        end
      end
    end
  end
end
