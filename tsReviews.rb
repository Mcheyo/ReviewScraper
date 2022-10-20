require_relative "Review"
require "test/unit"


class TestReview < Test::Unit::TestCase 
    @title = "testing title"
    @text = "text should return a string"
    @author = "Testing Software"
    @date = "1/1/1111"
    @star_rating = "5 of 5 "
     
    def test_review_title
        assert_equal(@title, Review.new(@title, @text, @author, @date, @star_rating).title )
    end 
    def test_review_text
        assert_equal(@title, Review.new(@title, @text, @author, @date, @star_rating).text )
    end 
    def test_review_author
        assert_equal(@title, Review.new(@title, @text, @author, @date, @star_rating).author )
    end 
    def test_review_date
        assert_equal(@title, Review.new(@title, @text, @author, @date, @star_rating).date )
    end 
    def test_review_star_rating
        assert_equal(@title, Review.new(@title, @text, @author, @date, @star_rating).star_rating )
    end 

    def test_
end