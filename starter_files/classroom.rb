require 'pry'

# Given a grade_hash, student name, and assignment number, return the score
# for that student and assignment. Note that Ruby counts arrays from 0, but
# we are referring to them as 1-10.
def assignment_score(grade_hash, student, assignment_num)
  grade_hash[student][assignment_num-1]
end

# Given a grade_hash and assignment number, return all scores for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.
def assignment_scores(grade_hash, assignment_num)
  scores = []
  grade_hash.map do |student, assignments|
    scores << assignments[assignment_num-1]
  end
  scores
end

# Given a grade_hash and assignment number, return the average score for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.
def assignment_average_score(grade_hash, assignment_num)
  average = 0
  grade_hash.map do |student, assignments|
    average = average + assignments[assignment_num-1]
  end
  average / grade_hash.length
end

# Return a hash of students and their average score.
# TIP: To convert an array like [[:indiana, 90], [:nevada, 80]] to a hash,
# use .to_h. Also look at Hash#transform_values.
def averages(grade_hash)
  # v runs through the hash values, sums them
  # divides them by their length
  grade_hash.transform_values {|v| v.sum / v.length}
end

# Return a letter grade for a numerical score.
# 90+ => A
# 80-89 => B
# 70-79 => C
# 60-69 => D
# < 60 => F
def letter_grade(score)
  return "A" if score > 90
  return "B" if score >= 80 && score <= 89
  return "C" if score >= 70 && score <= 79
  return "D" if score >= 60 && score <= 69
  return "F" if score < 60
end

# Return a hash of students and their final letter grade, as determined
# by their average.
def final_letter_grades(grade_hash)
  score = averages(grade_hash)
  score.transform_values.each do |n|
    letter_grade(n)
  end
end

# Return the average for the entire class.
def class_average(grade_hash)
  score = averages(grade_hash)
  score.values.sum / score.values.length
end

# Return an array of the top `number_of_students` students.
def top_students(grade_hash, number_of_students)
  top = Array.new
  results = averages(grade_hash).sort_by{|name, grade| grade }.reverse
  results.each do |name|
    top << name
  end
  top.to_h.keys[0..number_of_students-1]
end
