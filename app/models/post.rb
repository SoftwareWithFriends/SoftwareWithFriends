class Post
  include MongoMapper::Document
  
  key :content,     String
  key :title,       String
  key :author,      String
  key :tags,        Array
  key :subject_ids, Array
  many :subjects, :in => :subject_ids
  
  def self.by_subjects(subjects)
    where(:subject_ids => subjects.map(&:id)).all
  end
  
  timestamps!
end