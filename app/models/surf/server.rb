class Surf::Server < ActiveRecord::Base
  self.table_name = 'servers'

  validates :ip, uniqueness: true
  validates :name, :ip, presence: true

  belongs_to :user
  belongs_to :server_group

  def group
    self.server_group.try(:name)
  end

  def ip_address
    ip + ':' + port
  end

  def players_info
    "#{number_of_players}/#{max_players}"
  end

  def update
    server_ip = IPAddr.new(ip)
    server    = GoldSrcServer.new(server_ip, port)

    server.init

    return unless server.server_info

    info = server.server_info

    update_attributes({
      name:               info[:server_name],
      number_of_players:  info[:number_of_players],
      max_players:        info[:max_players],
      map_name:           info[:map_name],
      player_names:       server.players.keys,
      ping:               server.ping,
      pinged:             true,
    })
  end
end
