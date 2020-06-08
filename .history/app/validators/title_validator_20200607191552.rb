class TitleValidator < ActiveModel::Validator
    def validate_title(record)
        unless record.title.include?("Won't Believe" "Secret", "Top [number]", "Guess")
            record.error[:title] << "this is clickbait"
        end
    end
end
