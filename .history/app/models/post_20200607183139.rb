class Post < ActiveRecord::Base
    validates :title, presence: true, inclusion: {within: %w(Won/'t Believe Secret Top [number] Guess), message: "%{value} is clickbait" }
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250} 
    validates :category, inclusion: {within: %w(Fiction Non-Fiction)}
end
