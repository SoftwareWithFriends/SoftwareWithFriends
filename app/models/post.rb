class Post
  include MongoMapper::Document
  
  key :content, String
  key :title,   String
  key :author,  String
  
  timestamps!
end