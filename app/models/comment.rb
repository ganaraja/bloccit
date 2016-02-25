class Comment < ActiveRecord::Base

  belongs_to :user

  has_one :commenting

  has_one :topic, through: :commenting, source: :commentable, source_type: :Topic

  has_one :post, through: :commenting, source: :commentable, source_type: :Post

  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true
end
