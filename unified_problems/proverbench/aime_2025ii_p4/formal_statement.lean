theorem aime_2025ii_p4 (ans : ℚ)
    (answer : ans = (∏ k in Finset.Icc (4 : ℕ) 63,
      (Real.logb k (5 ^ (k ^ 2 - 1)) / Real.logb (k + 1) (5 ^ (k ^ 2 - 4)))
    )) :
    ↑ans.den + ans.num = 106 := by