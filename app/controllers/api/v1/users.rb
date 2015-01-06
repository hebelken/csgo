module API
  module V1
    class Users < Grape::API
      include API::V1::Defaults

      resource :users do
        desc "Return all users"
        get "", root: :users do
          {users: User.all}
        end

        desc "Return a user"
        get ":id", root: "user" do
          {user: User.where(id: params[:id]).first!}
        end

        desc "Create a new user"
        post do
          p = params[:user]
          user = User.create(username: p[:username],
                             email: p[:email], 
                             password: p[:password], 
                             password_confirmation: p[:password])

          if user.save
            {user: user}
          else
            error!({errors: user.errors}, 422)
          end
        end
      end
    end
  end
end
