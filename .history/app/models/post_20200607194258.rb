class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250} 
    validates :category, inclusion: {within: %w(Fiction Non-Fiction), message: "%{value} is clickbait" }
    validate  :click_bait_title
    def click_bait_title
        if self.title.include?("Won't Believe") || self.title.include?("Secret") || self.title.include?("Top [number]") || self.title.include?("Guess")
            self.errors[:title] << "this is clickbait"
        elsif self.title == nil
            self.errors[:title] << "must have a title"
        end
    end
end
