class Post < ActiveRecord::Base
  belongs_to :topic
  has_many :comments, dependent: :destroy

  def label_spam
    self.title = self.title + "SPAM"
    self.save!
  end
end
