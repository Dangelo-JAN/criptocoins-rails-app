class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { in: 1..250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_initialize :default_values
  after_save :post_count

  def five_last_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def post_count
    author.update(posts_counter: author.posts.count)
  end

  def default_values
    self.comments_counter ||= 0
    self.likes_counter ||= 0
  end
end
