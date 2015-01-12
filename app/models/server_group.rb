class ServerGroup < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  has_many :servers
  belongs_to :user
end
