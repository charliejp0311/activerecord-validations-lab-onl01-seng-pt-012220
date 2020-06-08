class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250} 
    validates :category, inclusion: {within: %w(Fiction Non-Fiction)}
    validate  :click_bait_title, on: :create
    def click_bait_title
        if title.include?("Won't Believe") || title.include?("Secret") || title.include?("Top [number]") || title.include?("Guess")
            errors[:title] << "this is clickbait"
        end
    end
end
