# encoding: utf-8

##
# This file is auto-generated. DO NOT EDIT!
#
require 'protobuf'


##
# Imports
#
require 'lightning/wire/types.pb'

module Lightning
  module Wire
    module LightningMessages
      module Generated
        ::Protobuf::Optionable.inject(self) { ::Google::Protobuf::FileOptions }

        ##
        # Message Classes
        #
        class Init < ::Protobuf::Message; end


        ##
        # Message Fields
        #
        class Init
          optional :uint32, :type, 1, :".lightning.wire.bits" => 16
          optional :string, :globalfeatures, 2, :".lightning.wire.hex" => true
          optional :string, :localfeatures, 3, :".lightning.wire.hex" => true
        end

      end

    end

  end

end

