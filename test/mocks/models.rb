class Penguin < ActiveRecord::Base
  as_param :name
end

class IceFlow < ActiveRecord::Base
end

class Seal < ActiveRecord::Base
  as_param :plastic_tag
end