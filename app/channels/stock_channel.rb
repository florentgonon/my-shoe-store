class StockChannel < ApplicationCable::Channel
  def subscribed
    stream_from "stock_channel"
  end
end
