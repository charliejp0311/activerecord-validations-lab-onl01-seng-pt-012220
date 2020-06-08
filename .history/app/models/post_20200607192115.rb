class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250} 
    validates :category, inclusion: {within: %w(Fiction Non-Fiction), message: "%{value} is clickbait" }
    def click_bait_title
        if self.title.include?("Won't Believe" "Secret", "Top [number]", "Guess")
            record.error[:title] << "this is clickbait"
        end
    end
end
