require 'test_helper'

class CourseTest < ActiveSupport::TestCase

  test "course title " do
    course = Course.new(title: 'Rails',user_id: 1)
    assert_equal 'Rails', course.title 
  end
end
