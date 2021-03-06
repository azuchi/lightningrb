# frozen_string_literal: true

FactoryBot.define do
  factory(:data_shutdown, class: 'FactoryBotWrapper') do
    commitments { build(:commitment).get }
    local_shutdown { build(:shutdown).get }
    remote_shutdown { build(:shutdown).get }
    initialize_with do
      new(Lightning::Channel::Messages::DataShutdown[commitments, local_shutdown, remote_shutdown])
    end
  end
end
