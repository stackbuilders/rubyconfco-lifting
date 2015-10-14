plus_one = ->(n) { n + 1 }
minus_five = ->(n) { n - 5 }
plus_ten = ->(n) { n + 10 }

[1, 2, 3]
  .map(&plus_one)
  .map(&minus_five)
  .map(&plus_ten) == [7, 8, 9]

2.1.3 :001 > true
