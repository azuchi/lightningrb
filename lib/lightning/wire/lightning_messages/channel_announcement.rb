# frozen_string_literal: true

module Lightning
  module Wire
    module LightningMessages
      class ChannelAnnouncement < Lightning::Wire::LightningMessages::Generated::ChannelAnnouncement
        include Lightning::Wire::Serialization
        extend Lightning::Wire::Serialization
        TYPE = 256

        def initialize(fields = {})
          super(fields.merge(type: TYPE))
        end

        def valid_signature?
          Bitcoin::Key.new(pubkey: node_id_1).verify(node_signature_1.htb, witness) &&
          Bitcoin::Key.new(pubkey: node_id_2).verify(node_signature_2.htb, witness) &&
          Bitcoin::Key.new(pubkey: bitcoin_key_1).verify(bitcoin_signature_1.htb, witness) &&
          Bitcoin::Key.new(pubkey: bitcoin_key_2).verify(bitcoin_signature_2.htb, witness)
        end

        def witness_data
          witness = ChannelAnnouncementWitness.new(
            features: features,
            chain_hash: chain_hash,
            short_channel_id: short_channel_id,
            node_id_1: node_id_1,
            node_id_2: node_id_2,
            bitcoin_key_1: bitcoin_key_1,
            bitcoin_key_2: bitcoin_key_2
          )
          stream = StringIO.new
          Protobuf::Encoder.encode(witness, stream)
          stream.string
        end

        def witness
          Bitcoin.double_sha256(witness_data)
        end
      end

      class ChannelAnnouncementWitness < Lightning::Wire::LightningMessages::Generated::ChannelAnnouncementWitness
        include Lightning::Wire::Serialization
        extend Lightning::Wire::Serialization
      end
    end
  end
end
