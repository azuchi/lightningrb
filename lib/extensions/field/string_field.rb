# frozen_string_literal: true

module Protobuf
  module Field
    class StringField < BytesField
      def encode_to_stream(value, stream)
        hex = get_option('.lightning.wire.hex')
        value = value.htb if hex
        length = get_option('.lightning.wire.length')
        if length.to_i == 0
          stream << [value.bytesize].pack('n')
        end
        stream << value
      end

      def decode_from(stream)
        return if stream.eof?
        length = get_option('.lightning.wire.length')
        if length.to_i == 0
          length = stream.read(2).unpack('n').first
        end
        hex = get_option('.lightning.wire.hex')
        if hex
          stream.read(length).unpack("H#{length * 2}").first
        else
          stream.read(length).unpack("a#{length}").first
        end
      end
    end
  end
end
