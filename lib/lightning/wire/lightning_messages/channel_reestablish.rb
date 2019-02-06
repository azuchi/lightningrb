# frozen_string_literal: true

module Lightning
  module Wire
    module LightningMessages
      class ChannelReestablish < Lightning::Wire::LightningMessages::Generated::ChannelReestablish
        include Lightning::Wire::Serialization
        extend Lightning::Wire::Serialization
        TYPE = 136

        def initialize(fields = {})
          super(fields.merge(type: TYPE))
        end
      end
    end
  end
end
