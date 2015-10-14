plus_one = ->(n) { n + 1 }
minus_five = ->(n) { n - 5 }
plus_ten = ->(n) { n + 10 }

Some(5)
  .map(&plus_one)
  .map(&minus_five)
  .map(&plus_ten) == Some(11)

# 2.1.3 :001 > true
