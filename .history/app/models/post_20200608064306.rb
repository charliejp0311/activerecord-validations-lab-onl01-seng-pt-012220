class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250} 
    validates :category, inclusion: {within: %w(Fiction Non-Fiction)}
    validate  :click_bait_title
    def click_bait_title
        if self.title
            if self.title.exclude?("Won't Believe") || self.title.exclude?("Secret") || self.title.exclude?("Top [number]") || self.title.exclude?("Guess")
                errors.add(:title, "isn't clickbait-y enough")
            end
        else
            errors.add(:title, "must exist")
        end
    end
end
