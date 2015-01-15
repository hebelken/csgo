module API
  module V1
    class Votes < Grape::API
      include API::V1::Defaults

      resource :votes do
        desc 'Return all votes'
        get '', root: :votes do
          {votes: Vote.all}
        end

        desc 'Create a new vote'
        post do
          p = params[:vote]
          vote = Vote.create(voteable_id: p[:id],
                             voteable_type: p[:type], 
                             user_id: 1)

          if vote.save
            {vote: vote}
          else
            error!({errors: vote.errors}, 422)
          end
        end
      end
    end
  end
end
