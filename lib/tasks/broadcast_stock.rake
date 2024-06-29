# lib/tasks/broadcast_stock.rake
namespace :stock do
  desc "Broadcast stock changes"
  task broadcast: :environment do
    require "json"
    STORE_STORES = ["ALDO Centre Eaton", "ALDO Destiny USA Mall", "ALDO Pheasant Lane Mall", "ALDO Holyoke Mall", "ALDO Maine Mall", "ALDO Crossgates Mall", "ALDO Burlington Mall", "ALDO Solomon Pond Mall", "ALDO Auburn Mall", "ALDO Waterloo Premium Outlets"]
    SHOES_MODELS = ["ADERI", "MIRIRA", "CAELAN", "BUTAUD", "SCHOOLER", "SODANO", "MCTYRE", "CADAUDIA", "RASIEN", "WUMA", "GRELIDIEN", "CADEVEN", "SEVIDE", "ELOILLAN", "BEODA", "VENDOGNUS", "ABOEN", "ALALIWEN", "GREG", "BOZZA"]
    INVENTORY = Array(0..100)
    RANDOMNESS = Array(1..3)

    loop do
      RANDOMNESS.sample.times do
        data = {
          store: STORE_STORES.sample,
          model: SHOES_MODELS.sample,
          inventory: INVENTORY.sample
        }
        ActionCable.server.broadcast "stock_channel", data
      end
      sleep 1
    end
  end
end
