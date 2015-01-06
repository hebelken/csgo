class Server < ActiveRecord::Base
  validates :ip, uniqueness: true
  validates :name, :ip, presence: true
end
