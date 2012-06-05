# == Schema Information
#
# Table name: properties
#
#  id         :integer         not null, primary key
#  property   :integer
#  value      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Property < ActiveRecord::Base
end
