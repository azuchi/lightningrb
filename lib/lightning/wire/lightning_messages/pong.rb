# frozen_string_literal: true

module Lightning
  module Wire
    module LightningMessages
      class Pong < Lightning::Wire::LightningMessages::Generated::Pong
        include Lightning::Wire::Serialization
        extend Lightning::Wire::Serialization
        TYPE = 19

        def initialize(fields = {})
          super(fields.merge(type: TYPE))
        end

        def valid?
          return false if ignored.empty?
          true
        end
      end
    end
  end
end
