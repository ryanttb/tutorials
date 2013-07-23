class Project < ActiveRecord::Base
  attr_accessible :description, :repository_url, :title
  acts_as_taggable_on :tags
end
