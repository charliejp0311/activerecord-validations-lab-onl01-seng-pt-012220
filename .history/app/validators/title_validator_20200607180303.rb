class TitleValidator < ActiveModel::Validator
    def validate(record)
        unless record.name.include?("Won't Believe" "Secret", "Top [number]", "Guess")
            record.error[:title] << "this is clickbait"
        end
    end
end
