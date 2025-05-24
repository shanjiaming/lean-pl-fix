theorem demo_simple_arithmetic (x y : ℕ) (h_prod : x * y = 12) (h_lt : x < y) : 
    (x, y) ∈ {(1, 12), (2, 6), (3, 4)} := by
  have h1 : x ≠ 0 := by
    have h1_1 : x * y = 12 := h_prod
    have h1_2 : 12 ≠ 0 := by norm_num
    have h1_3 : x ≠ 0 := by
      by_contra h
      have h1_3_1 : x = 0 := h
      have h1_3_2 : x * y = 0 * y := by rw [h1_3_1]
      have h1_3_3 : 0 * y = 0 := by ring
      have h1_3_4 : x * y = 0 := by rw [h1_3_2, h1_3_3]
      rw [h1_1] at h1_3_4
      exact h1_2 h1_3_4
    exact h1_3
  
  have h2 : y ≠ 0 := by
    have h2_1 : x * y = 12 := h_prod
    have h2_2 : 12 ≠ 0 := by norm_num
    have h2_3 : y ≠ 0 := by
      by_contra h
      have h2_3_1 : y = 0 := h
      have h2_3_2 : x * y = x * 0 := by rw [h2_3_1]
      have h2_3_3 : x * 0 = 0 := by ring
      have h2_3_4 : x * y = 0 := by rw [h2_3_2, h2_3_3]
      rw [h2_1] at h2_3_4
      exact h2_2 h2_3_4
    exact h2_3
  
  have h3 : x ∣ 12 := by
    have h3_1 : x * y = 12 := h_prod
    have h3_2 : x ∣ x * y := by
      use y
      ring
    have h3_3 : x ∣ 12 := by
      rw [← h3_1]
      exact h3_2
    exact h3_3
  
  have h4 : y ∣ 12 := by
    have h4_1 : x * y = 12 := h_prod
    have h4_2 : y ∣ x * y := by
      use x
      have h4_2_1 : y * x = x * y := by ring
      exact h4_2_1
    have h4_3 : y ∣ 12 := by
      rw [← h4_1]
      exact h4_2
    exact h4_3
  
  have h5 : x ∈ {1, 2, 3, 4, 6, 12} := by
    have h5_1 : x ∣ 12 := h3
    have h5_2 : x > 0 := by
      have h5_2_1 : x ≠ 0 := h1
      exact Nat.pos_of_ne_zero h5_2_1
    interval_cases x <;> norm_num at h5_1 ⊢
  
  have h6 : y ∈ {1, 2, 3, 4, 6, 12} := by
    have h6_1 : y ∣ 12 := h4
    have h6_2 : y > 0 := by
      have h6_2_1 : y ≠ 0 := h2
      exact Nat.pos_of_ne_zero h6_2_1
    interval_cases y <;> norm_num at h6_1 ⊢
  
  have h7 : x < y := h_lt
  have h8 : x * y = 12 := h_prod
  
  rcases h5 with (rfl | rfl | rfl | rfl | rfl | rfl) <;>
  rcases h6 with (rfl | rfl | rfl | rfl | rfl | rfl) <;>
  norm_num at h7 h8 ⊢ <;>
  (try omega) <;>
  (try simp)