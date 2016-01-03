class Post < ActiveRecord::Base
  has_many :comments

  def label_spam
    self.title = self.title + "SPAM"
    self.save!
  end
end
