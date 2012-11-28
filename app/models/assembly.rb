# == Schema Information
#
# Table name: assemblies
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  project_id  :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Assembly < ActiveRecord::Base
  belongs_to :project
  validates :name, presence: true, uniqueness: { :scope => :project_id }
  validates :project_id, presence: true

  def list_name
    "#{project.name}:#{name}"
  end
end
