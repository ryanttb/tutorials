class Project < ActiveRecord::Base
  attr_accessible :description, :repository_url, :title, :tag_list
  acts_as_taggable_on :tags

  searchable :auto_index => true, :auto_remove => true do
    string :title, :stored => true
    text :description, :stored => true
    string :tag_list, :multiple => true, :stored => true
  end
end
