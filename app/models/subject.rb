class Subject
  include MongoMapper::Document
  
  key :name, String
  
  belongs_to :subject
  
  scope :roots, where(:subject_id => nil)
  
  def self.by_name_with_children(page)
    subject = where(:name => page).first
    [subject, *subject.children]
  end
  
  def children
    Subject.where(:subject_id => id).all
  end
  
end