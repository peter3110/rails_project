# bin/rails generate model Article title:string text:text -> build Article model with title and text
# attributes

class Article < ActiveRecord::Base
    #if an article is destroyed, so are all it's comments (otherwise they would
    # unncecesarily occupy space in the database)
    has_many :comments, dependent: :destroy
    
    validates :title, presence: true,
                      length: { minimum: 5 }
end
