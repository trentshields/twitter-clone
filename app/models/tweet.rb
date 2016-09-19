class Tweet < ApplicationRecord
  validates :message, length: {maximum: 140}
  belongs_to :user
  acts_as_votable
  include SimpleHashtag::Hashtaggable
  hashtaggable_attribute :message

  def score
    self.get_upvotes.size - self.get_downvotes.size
  end
end
