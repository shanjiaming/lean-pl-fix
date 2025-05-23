theorem mathd_numbertheory_85 : 1 * 3 ^ 3 + 2 * 3 ^ 2 + 2 * 3 + 2 = 53 := by
  have h1 : 3 ^ 3 = 27 := by norm_num
  have h2 : 3 ^ 2 = 9 := by norm_num
  have h3 : 1 * 3 ^ 3 = 27 := by norm_num [h1]
  have h4 : 2 * 3 ^ 2 = 18 := by norm_num [h2]
  have h5 : 2 * 3 = 6 := by norm_num
  have h6 : 1 * 3 ^ 3 + 2 * 3 ^ 2 = 45 := by norm_num [h3, h4]
  have h7 : 1 * 3 ^ 3 + 2 * 3 ^ 2 + 2 * 3 = 51 := by norm_num [h6, h5]
  have h8 : 1 * 3 ^ 3 + 2 * 3 ^ 2 + 2 * 3 + 2 = 53 := by norm_num [h7]
  exact h8