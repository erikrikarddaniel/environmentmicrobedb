# == Schema Information
#
# Table name: people
#
#  id         :integer         not null, primary key
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Person < ActiveRecord::Base
end
