ActiveRecord::Schema.define do

  create_table "penguins", :force => true do |t|
    t.string   "name"
  end

  create_table "ice_flows", :force => true do |t|
    t.integer   "latitude"
    t.integer   "longitude"
  end
  
  create_table "seals", :force => true do |t|
    t.integer   "plastic_tag"
  end  

end