class Surf::Server < ActiveRecord::Base
  self.table_name = 'servers'

  validates :ip, uniqueness: true
  validates :name, :ip, presence: true

  belongs_to :created_by_user, class_name: 'User'
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

    update_attributes(
      name:                 info[:server_name],
      number_of_players:    info[:number_of_players],
      max_players:          info[:max_players],
      map_name:             info[:map_name],
      player_names:         server.players.keys,
      ping:                 server.ping,
      last_ping_succeeded:  true,
    )

  rescue
    # If we can, note that this failed for the UI to display.
    update_attributes(
      last_ping_succeeded: false
    )

    raise
  end
end
