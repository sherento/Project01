# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  post_id    :integer
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#



class Comment < ApplicationRecord

  belongs_to :user, :optional => true
  belongs_to :post, :optional => true


end
