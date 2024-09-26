require 'test_helper'

class LessonTest < ActiveSupport::TestCase
  test "should belong to user" do
    lesson = Lesson.new
    assert_respond_to lesson, :user
  end

  test "should have many bookings" do
    lesson = Lesson.new
    assert_respond_to lesson, :bookings
  end

  test "should have many students through bookings" do
    lesson = Lesson.new
    assert_respond_to lesson, :students
  end

  test "should validate presence of teaching_language" do
    lesson = Lesson.new
    assert_not lesson.valid?
    assert_includes lesson.errors[:teaching_language], "can't be blank"
  end

  test "should validate presence of known_language" do
    lesson = Lesson.new
    assert_not lesson.valid?
    assert_includes lesson.errors[:known_language], "can't be blank"
  end

  test "should validate presence of level" do
    lesson = Lesson.new
    assert_not lesson.valid?
    assert_includes lesson.errors[:level], "can't be blank"
  end

  test "should validate presence of available_days" do
    lesson = Lesson.new
    assert_not lesson.valid?
    assert_includes lesson.errors[:available_days], "can't be blank"
  end

  test "should validate presence of meeting_platform" do
    lesson = Lesson.new
    assert_not lesson.valid?
    assert_includes lesson.errors[:meeting_platform], "can't be blank"
  end

  test "should filter by teaching language" do
    lesson1 = lessons(:one)
    lesson2 = lessons(:two)
    filtered_lessons = Lesson.filter_by_teaching_language(lesson1.teaching_language)
    assert_includes filtered_lessons, lesson1
    assert_not_includes filtered_lessons, lesson2
  end

  test "should filter by known language" do
    lesson1 = lessons(:one)
    lesson2 = lessons(:two)
    filtered_lessons = Lesson.filter_by_known_language(lesson1.known_language)
    assert_includes filtered_lessons, lesson1
    assert_not_includes filtered_lessons, lesson2
  end

  test "should filter by level" do
    lesson1 = lessons(:one)
    lesson2 = lessons(:two)
    filtered_lessons = Lesson.filter_by_level(lesson1.level)
    assert_includes filtered_lessons, lesson1
    assert_not_includes filtered_lessons, lesson2
  end

  test "should return correct title" do
    lesson = lessons(:one)
    expected_title = "#{lesson.known_language}-#{lesson.teaching_language}"
    assert_equal expected_title, lesson.title
  end
end