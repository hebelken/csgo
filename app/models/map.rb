class Map < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :map_type, presence: true

  acts_as_votable

  belongs_to :user

  def as_json(option = {})
    super.merge({votes: self.votes})
  end

  def votes
    self.votes_for.map do |vote|
      vote.attributes.except!('voter_type', 'vote_flag', 'vote_scope', 'vote_weight')
    end
  end
end
