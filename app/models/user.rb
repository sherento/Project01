# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :text
#  email           :text
#  profile         :text
#  image           :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  admin           :boolean          default(FALSE)
#

class User < ApplicationRecord

  has_secure_password
  has_many :posts, dependent: :destroy

  validates :email, :presence => true, :uniqueness => true
  validates :name, :presence => true

  mount_uploader :image, PhotoUploader

  has_many :comments, dependent: :destroy

end
