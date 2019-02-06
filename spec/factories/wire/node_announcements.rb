# frozen_string_literal: true

FactoryBot.define do
  factory(:node_announcement, class: 'Lightning::Wire::LightningMessages::NodeAnnouncement') do
    signature { build(:signature) }
    features { ''.htb }
    timestamp { 1 }
    node_id { build(:key, :remote_funding_pubkey).pubkey }
    node_rgb_color { (100 << 16) + (200 << 8) + 44 }
    node_alias { 'node-alias' }
    addrlen { 1 }
    addresses { ['192.168.1.42:42000'] }
  end
end
