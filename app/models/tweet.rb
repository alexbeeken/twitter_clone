class Tweet < ActiveRecord::Base
  belongs_to :user
  validates :body, :presence => true
  has_many :comments

  def words
    self.body.split(" ")
  end

end
