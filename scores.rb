scores = [83, 71, 92, 64, 98, 87, 75, 69]

# high_scores = scores.select { |n| n > 80 }
# p high_scores

# low_scores = scores.reject { |n| n > 80 }
# p low_scores

# puts scores.any? { |n| n < 70 }

# puts scores.detect { |n| n < 70 }

scores_doubled = scores.map { |n| n * 2 }
p scores_doubled

odds, evens = scores.partition { |n| n.odd? }
p odds
p evens