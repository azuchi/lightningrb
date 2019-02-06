# frozen_string_literal: true

module Lightning
  module Wire
    module LightningMessages
      class AnnouncementSignatures < Lightning::Wire::LightningMessages::Generated::AnnouncementSignatures
        include Lightning::Wire::Serialization
        extend Lightning::Wire::Serialization
        TYPE = 259

        def initialize(fields = {})
          super(fields.merge(type: TYPE))
        end
      end
    end
  end
end
