
class Post < ActiveRecord::Base
  validate :clickbait
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }

    def clickbait
      unless !title.nil? && title.include?("Won't Believe"||"Secret"||"Top"||"Guess")
        errors.add(:title, "moar clickbait por favor")
      end
    end

end
