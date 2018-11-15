class Roll < ApplicationRecord
  after_create { |roll| roll.message 'create' }
  after_update { |roll| roll.message 'update' }

  def message action
    serializer = RollSerializer.new(self)
    serialization = ActiveModelSerializers::Adapter.create(serializer)

    msg = {
        id: self.id,
        action: action,
        type: self.class.to_s,
        payload: serialization.to_json
    }

    ActionCable.server.broadcast "reactive_data_channel:1", msg
  end
end
