class ReactiveDataChannel < ApplicationCable::Channel
  def subscribed
    stream_from "reactive_data_channel:#{params[:roomId]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
