ActiveRecord::Base.class_eval do
  
  def self.find_by_to_param(*param)
    self.find_by_id(*param)
  end
  
  def self.find_by_to_param!(*param)
    to_return = self.find_by_to_param(*param)
    unless to_return
      raise ActiveRecord::RecordNotFound, "Couldn't find #{self.name} with param=#{param.inspect}"
    end
    to_return
  end
  
  def self.as_param(param_name)
    self.class_eval do
      eval %Q{
        def to_param
          self.#{param_name}.to_s
        end
        
        def self.find_by_to_param(*arg)
          self.find_by_#{param_name.to_s}(*arg)
        end
      }
    end
  end
  
end