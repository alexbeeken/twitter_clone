class Tweet < ActiveRecord::Base
  belongs_to :user
  validates :body, :presence => true

  def words
    self.body.split(" ")
  end

end
