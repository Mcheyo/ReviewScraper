class Review 

    def initialize (title, text, author, date, star_rating)
        @author = author
        @title = title 
        @text = text
        @date = date
        @star_rating = star_rating
    end 

    def text 
        @text
    end

    def title
        @title
    end 

    def author
        @author
    end 

    def date 
        @date
    end 

    def star_rating
        @star_rating
    end

end 