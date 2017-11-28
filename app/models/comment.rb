

class Comment < ApplicationRecord

  belongs_to :user, polymorphic: true
  belongs_to :post, polymorphic: true

  attr_accessor :content

end
