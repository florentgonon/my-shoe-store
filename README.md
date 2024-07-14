# Technical test by Florent Gonon for Potloc

Hello and thank you for your time to checkout my exercice.

### Different features implemented
* A real time dashboards by store to allow the user to see live stocks update in differents Aldo's stores
* An API to :
    * GET all the inventories
    * GET all stores
    * GET all inventories for given store
    * PUT Update an inventory for a given shoe and store
* Everytime the websocket server send a stock update, the inventory of the shoe model for the given store is update by an API call to our API
* An interface by shop to saw three sort of graphic to display and treat data


### Technical stack :
* ruby 3.1.2
* Rails 7.0.8.4
* SQL database
* Foreman gem to lauch multiple process by one command line, for the good of the exercice
* ActionCable to implement easily the websocket and handle the instant data update
* Redis for the ActionCable adapter
* Hotwire Stimulus
* ActiveResource gem to make API calls
* Foreman gem to handle multiple process, for the good of the exercice
* ChartKick JS library to display differents graphics
* Tailwind CSS to customize the display


### Instructions
* For my-shoe-store :
    * Make sure you have a complete installation of Ruby on Rails with depencies
    * `brew install websocketd` to convert broadcast_inventory.rake into a websocket service
    * `gem install foreman` to lauch multiple process
    * `bundle install`
    * Then lauch the following command : `./bin/dev`
    If you got this error `./bin/dev : permission denied`, please launch the following command line : `chmod +x ./bin/dev` and relauch `./bin/dev`

* For aldo-store-api :
    * Make sure you have a complete installation of Ruby on Rails with depencies
    * Make sure you have PostgreSQL to allow to create a Database
    * `rails db:create && rails db:migrate && rails db:seed` to create, migrate and seed the Database
    * `bundle install`
    * Then lauch the following command : `rails s`



### Test
I used RSpec to wrote the tests. For launch the test, just run `bundle exec rspec`


### Last word
I'm honored to have make this exercice for Potloc, and hope you enjoy to read and test it as much as I have take pleasure to make it. Enjoy !