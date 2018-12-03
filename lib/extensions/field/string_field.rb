
module Protobuf
  module Field
    class StringField < BytesField
      def encode_to_stream(value, stream)
        stream << value
      end

      def decode_from(stream)
        unless stream.eof?
          length = get_option('.lightning.wire.length')
          stream.read(length).unpack('a*').first
        end
      end
    end
  end
end
