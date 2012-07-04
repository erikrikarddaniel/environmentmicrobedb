module GlobalConstants
  # also notice the call to 'freeze'
  PROPERTY_TYPE = {integer: {can_convert?: (lambda {|value| Integer(value) rescue "Can't Convert"}) }, 
                   string: {can_convert?: (lambda {|value| String(value) rescue "Cant Convert"}) },
                   datetime: {can_convert?: (lambda {|value| value.to_datetime rescue "Cant Convert"}) }, 
                   float: {can_convert?: (lambda {|value| Float(value) rescue "Cant Convert"}) },
                   date: {can_convert?: (lambda {|value| value.to_datetime.to_date rescue "Cant Convert"}) }, 
                   time: {can_convert?: (lambda {|value| value.to_datetime.to_time rescue "Cant Convert"}) },
                   bool: {can_convert?: (lambda {|value| to_bool(value) rescue "Can't Convert"}) } 
                   }.freeze
  def self.to_bool(value)
    return true if value == true || value =~ (/(true|t|yes|y|1)$/i)
    return false if value == false || value.blank? || value =~ (/(false|f|no|n|0)$/i)
    raise ArgumentError.new("invalid value for Boolean: \"#{value}\"")
  end
end
