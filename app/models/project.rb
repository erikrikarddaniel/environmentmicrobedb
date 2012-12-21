# == Schema Information
#
# Table name: projects
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Project < ActiveRecord::Base
  attr_accessible :name
  has_many :properties, class_name: "ProjectProperty", dependent: :destroy
  has_many :sample_sets, dependent: :destroy
  has_many :samples, through: :sample_sets
  validates_presence_of :name
  validates :name, uniqueness: true
  accepts_nested_attributes_for :properties, reject_if: lambda { |a| a[:name].blank? }, allow_destroy: true

  # Finds an existing project with the same name as in the parsed json ``project_data''.
  # Also parses sample sets and samples.
  def self.find_or_create_from_json(project_data)
    project_name = project_data['name']

    # Find or create a project
    project = Project.find_by_name(project_name)
    project ||= Project.create(name: project_name)

    # Add sample sets with samples, if necessary
    project_data['sample_sets'].each do |ssdata|
      current_ss = project.sample_sets.detect { |ss| ssdata['name'] == ss.name }
      current_ss ||= project.sample_sets.create!(name: ssdata['name'])
      ssdata['samples'].each do |sdata|
	current_s = current_ss.samples.detect { |s| sdata['code'] == s.code }
	current_s ||= current_ss.samples.create!(code: sdata['code'])
      end
    end
    project
  end
end
