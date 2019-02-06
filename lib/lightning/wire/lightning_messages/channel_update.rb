# frozen_string_literal: true

module Lightning
  module Wire
    module LightningMessages
      class ChannelUpdate < Lightning::Wire::LightningMessages::Generated::ChannelUpdate
        include Lightning::Wire::Serialization
        extend Lightning::Wire::Serialization
        TYPE = 258

        def initialize(fields = {})
          super(fields.merge(type: TYPE))
        end

        def copy(attributes)
          ChannelUpdate[
            attributes[:signature] || self[:signature],
            attributes[:chain_hash] || self[:chain_hash],
            attributes[:short_channel_id] || self[:short_channel_id],
            attributes[:timestamp] || self[:timestamp],
            attributes[:message_flags] || self[:message_flags],
            attributes[:channel_flags] || self[:channel_flags],
            attributes[:cltv_expiry_delta] || self[:cltv_expiry_delta],
            attributes[:htlc_minimum_msat] || self[:htlc_minimum_msat],
            attributes[:fee_base_msat] || self[:fee_base_msat],
            attributes[:fee_proportional_millionths] || self[:fee_proportional_millionths]
          ]
        end

        def valid_signature?(node_id)
          Bitcoin::Key.new(pubkey: node_id).verify(signature.value.htb, witness)
        end

        def witness
          self.class.witness(chain_hash, short_channel_id, timestamp, message_flags, channel_flags, cltv_expiry_delta, htlc_minimum_msat, fee_base_msat, fee_proportional_millionths)
        end

        def self.witness(chain_hash, short_channel_id, timestamp, message_flags, channel_flags, cltv_expiry_delta, htlc_minimum_msat, fee_base_msat, fee_proportional_millionths)
          witness = ChannelUpdateWitness.new(
            chain_hash: chain_hash,
            short_channel_id: short_channel_id,
            timestamp: timestamp,
            message_flags: message_flags,
            channel_flags: channel_flags,
            cltv_expiry_delta: cltv_expiry_delta,
            htlc_minimum_msat: htlc_minimum_msat,
            fee_base_msat: fee_base_msat,
            fee_proportional_millionths: fee_proportional_millionths
          )
          stream = StringIO.new
          Protobuf::Encoder.encode(witness, stream)
          Bitcoin.double_sha256(stream.string)
        end
      end

      class ChannelUpdateWitness < Lightning::Wire::LightningMessages::Generated::ChannelUpdateWitness
        include Lightning::Wire::Serialization
        extend Lightning::Wire::Serialization
      end
    end
  end
end
