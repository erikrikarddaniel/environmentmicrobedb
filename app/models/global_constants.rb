module GlobalConstants
  # also notice the call to 'freeze'
  PROPERTY_TYPE = {"integer" => {can_convert?: (lambda {|value| Integer(value) rescue :error}) }, 
                   "string" => {can_convert?: (lambda {|value| String(value) rescue :error}) },
                   "datetime" => {can_convert?: (lambda {|value| value.to_datetime rescue :error}) }, 
                   "float" => {can_convert?: (lambda {|value| Float(value) rescue :error}) },
                   "date" => {can_convert?: (lambda {|value| value.to_datetime.to_date rescue :error}) }, 
                   "time" => {can_convert?: (lambda {|value| value.to_datetime.to_time rescue :error}) },
                   "bool" => {can_convert?: (lambda {|value| to_bool(value) rescue :error}) } 
                   }.freeze
  def self.to_bool(value)
    return true if value == true || value =~ (/(true|t|yes|y|1)$/i)
    return false if value == false || value.blank? || value =~ (/(false|f|no|n|0)$/i)
    raise ArgumentError.new("invalid value for Boolean: \"#{value}\"")
  end
  def self.convert(datatype,value)
    if GlobalConstants::PROPERTY_TYPE[datatype][:can_convert?].call(value) == :error
      return :error
    else
      return GlobalConstants::PROPERTY_TYPE[datatype][:can_convert?].call(value)
    end
  end
end
