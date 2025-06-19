theorem mathd_numbertheory_212 : 16 ^ 17 * 17 ^ 18 * 18 ^ 19 % 10 = 8 := by
  have h1 : 16 ^ 17 % 10 = 6 := by
    norm_num
  
  have h2 : 17 ^ 18 % 10 = 9 := by
    norm_num
  
  have h3 : 18 ^ 19 % 10 = 2 := by
    norm_num
  
  have h4 : (16 ^ 17 * 17 ^ 18 * 18 ^ 19) % 10 = 8 := by
    have h5 : (16 ^ 17 * 17 ^ 18 * 18 ^ 19) % 10 = ((16 ^ 17 % 10) * (17 ^ 18 % 10) * (18 ^ 19 % 10)) % 10 := by
      norm_num
    norm_num
  
  norm_num
