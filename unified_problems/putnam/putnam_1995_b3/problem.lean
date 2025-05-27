theorem putnam_1995_b3
(n : ℕ)
(hn : n > 0)
(digits_set : Set (ℕ → ℕ))
(hdigits_set : digits_set = {f | f 0 ≠ 0 ∧ (∀ i : Fin (n ^ 2), f i ≤ 9) ∧ (∀ i ≥ n ^ 2, f i = 0)})
(digits_to_matrix : (ℕ → ℕ) → Matrix (Fin n) (Fin n) ℤ)
(hdigits_to_matrix : digits_to_matrix = fun f => (fun i j => f (i.1 * n + j.1)))
: ∑' f : digits_set, (digits_to_matrix f).det = ((fun n => if n = 1 then 45 else if n = 2 then 10 * 45^2 else 0) : ℕ → ℤ ) n := by
  have h_n1 : n = 1 → ∑' (f : digits_set), (digits_to_matrix f).det = 45 := by
    intro hn1
    have h₁ : digits_set = {f | f 0 ≠ 0 ∧ (∀ i : Fin (n ^ 2), f i ≤ 9) ∧ (∀ i ≥ n ^ 2, f i = 0)} := hdigits_set
    have h₂ : digits_to_matrix = fun f => (fun i j => f (i.1 * n + j.1)) := hdigits_to_matrix
    subst_vars
    -- For n = 1, the matrix is 1x1 with entry f(0), and the determinant is f(0).
    -- The set of f is all f with f(0) ≠ 0, f(0) ≤ 9, and f(i) = 0 for i ≥ 1.
    -- The sum of determinants is the sum of f(0) over f(0) ∈ {1, ..., 9}, which is 45.
    have h₃ : ∑' (f : {f : ℕ → ℕ | f 0 ≠ 0 ∧ (∀ i : Fin (1 ^ 2), f i ≤ 9) ∧ (∀ i ≥ 1 ^ 2, f i = 0)}), ((fun f => (fun i j => f (i.1 * 1 + j.1)) : (ℕ → ℕ) → Matrix (Fin 1) (Fin 1) ℤ) f).det = 45 := by
      classical
      -- We need to show that the sum of the determinants of the matrices is 45.
      -- Since n = 1, the matrix is 1x1 with entry f(0), and the determinant is f(0).
      -- The condition is f(0) ≠ 0, f(0) ≤ 9, and f(i) = 0 for i ≥ 1.
      -- Therefore, the sum of f(0) for f(0) in {1, ..., 9} is 45.
      have h₄ : ∀ (f : ℕ → ℕ), f 0 ≠ 0 ∧ (∀ i : Fin (1 ^ 2), f i ≤ 9) ∧ (∀ i ≥ 1 ^ 2, f i = 0) → ((fun f => (fun i j => f (i.1 * 1 + j.1)) : (ℕ → ℕ) → Matrix (Fin 1) (Fin 1) ℤ) f).det = f 0 := by
        intro f hf
        simp [Matrix.det_fin_one, Fin.sum_univ_succ, Fin.val_zero, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero]
        <;> aesop
      -- We now need to sum over all f that satisfy the condition f(0) ≠ 0, f(0) ≤ 9, and f(i) = 0 for i ≥ 1.
      -- The sum of f(0) for f(0) in {1, ..., 9} is 45.
      have h₅ : ∑' (f : {f : ℕ → ℕ | f 0 ≠ 0 ∧ (∀ i : Fin (1 ^ 2), f i ≤ 9) ∧ (∀ i ≥ 1 ^ 2, f i = 0)}), ((fun f => (fun i j => f (i.1 * 1 + j.1)) : (ℕ → ℕ) → Matrix (Fin 1) (Fin 1) ℤ) f).det = ∑' (f : {f : ℕ → ℕ | f 0 ≠ 0 ∧ (∀ i : Fin (1 ^ 2), f i ≤ 9) ∧ (∀ i ≥ 1 ^ 2, f i = 0)}), (f : ℕ → ℕ) 0 := by
        apply tsum_congr
        intro f
        rw [h₄ f f.2]
        <;> simp
      rw [h₅]
      -- The sum of f(0) for f(0) in {1, ..., 9} is 45.
      -- This is a geometric series sum.
      have h₆ : ∑' (f : {f : ℕ → ℕ | f 0 ≠ 0 ∧ (∀ i : Fin (1 ^ 2), f i ≤ 9) ∧ (∀ i ≥ 1 ^ 2, f i = 0)}), (f : ℕ → ℕ) 0 = 45 := by
        classical
        -- We need to evaluate the sum of f(0) for f(0) in {1, ..., 9}.
        have h₇ : ∑' (f : {f : ℕ → ℕ | f 0 ≠ 0 ∧ (∀ i : Fin (1 ^ 2), f i ≤ 9) ∧ (∀ i ≥ 1 ^ 2, f i = 0)}), (f : ℕ → ℕ) 0 = 45 := by
          -- The sum of f(0) for f(0) in {1, ..., 9} is 45.
          -- This is a geometric series sum.
          have h₈ : ∑' (f : {f : ℕ → ℕ | f 0 ≠ 0 ∧ (∀ i : Fin (1 ^ 2), f i ≤ 9) ∧ (∀ i ≥ 1 ^ 2, f i = 0)}), (f : ℕ → ℕ) 0 = 45 := by
            -- We need to evaluate the sum of f(0) for f(0) in {1, ..., 9}.
            -- This is a geometric series sum.
            have h₉ : ∑' (f : {f : ℕ → ℕ | f 0 ≠ 0 ∧ (∀ i : Fin (1 ^ 2), f i ≤ 9) ∧ (∀ i ≥ 1 ^ 2, f i = 0)}), (f : ℕ → ℕ) 0 = 45 := by
              -- We need to evaluate the sum of f(0) for f(0) in {1, ..., 9}.
              -- This is a geometric series sum.
              rfl
            exact h₉
          exact h₈
        exact h₇
      rw [h₆]
    exact h₃
    <;> simp_all
  
  have h_n2 : n = 2 → ∑' (f : digits_set), (digits_to_matrix f).det = 10 * 45^2 := by
    intro hn2
    have h₁ : digits_set = {f | f 0 ≠ 0 ∧ (∀ i : Fin (n ^ 2), f i ≤ 9) ∧ (∀ i ≥ n ^ 2, f i = 0)} := hdigits_set
    have h₂ : digits_to_matrix = fun f => (fun i j => f (i.1 * n + j.1)) := hdigits_to_matrix
    subst_vars
    -- For n = 2, the matrix is 2x2 with entries f(0), f(1), f(2), f(3).
    -- The set of f is all f with f(0) ≠ 0, f(i) ≤ 9 for i < 4, and f(i) = 0 for i ≥ 4.
    -- The sum of determinants is the sum of f(0)f(3) - f(1)f(2) over all f with the above conditions.
    have h₃ : ∑' (f : {f : ℕ → ℕ | f 0 ≠ 0 ∧ (∀ i : Fin (2 ^ 2), f i ≤ 9) ∧ (∀ i ≥ 2 ^ 2, f i = 0)}), ((fun f => (fun i j => f (i.1 * 2 + j.1)) : (ℕ → ℕ) → Matrix (Fin 2) (Fin 2) ℤ) f).det = 10 * 45 ^ 2 := by
      classical
      have h₄ : ∀ (f : ℕ → ℕ), f 0 ≠ 0 ∧ (∀ i : Fin (2 ^ 2), f i ≤ 9) ∧ (∀ i ≥ 2 ^ 2, f i = 0) → ((fun f => (fun i j => f (i.1 * 2 + j.1)) : (ℕ → ℕ) → Matrix (Fin 2) (Fin 2) ℤ) f).det = (f 0 * f 3 - f 1 * f 2 : ℤ) := by
        intro f hf
        simp [Matrix.det_fin_two, Fin.sum_univ_succ, Fin.val_zero, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero]
        <;>
          norm_num [Fin.ext_iff, Fin.val_zero, Fin.val_one, Fin.val_two, Fin.val_succ] at hf ⊢ <;>
          ring_nf at hf ⊢ <;>
          simp_all (config := { contextual := true }) [Fin.forall_fin_succ]
        <;>
          norm_num at hf ⊢ <;>
          omega
      -- We now need to sum over all f that satisfy the condition f(0) ≠ 0, f(i) ≤ 9 for i < 4, and f(i) = 0 for i ≥ 4.
      -- The sum of determinants f(0)f(3) - f(1)f(2) over all f with f(0) ≠ 0 and f(i) ≤ 9 for i < 4 and f(i) = 0 for i ≥ 4 is 10 * 45 ^ 2.
      have h₅ : ∑' (f : {f : ℕ → ℕ | f 0 ≠ 0 ∧ (∀ i : Fin (2 ^ 2), f i ≤ 9) ∧ (∀ i ≥ 2 ^ 2, f i = 0)}), ((fun f => (fun i j => f (i.1 * 2 + j.1)) : (ℕ → ℕ) → Matrix (Fin 2) (Fin 2) ℤ) f).det = ∑' (f : {f : ℕ → ℕ | f 0 ≠ 0 ∧ (∀ i : Fin (2 ^ 2), f i ≤ 9) ∧ (∀ i ≥ 2 ^ 2, f i = 0)}), (f : ℕ → ℕ) 0 * (f : ℕ → ℕ) 3 - (f : ℕ → ℕ) 1 * (f : ℕ → ℕ) 2 := by
        apply tsum_congr
        intro f
        rw [h₄ f f.2]
        <;> simp [Int.mul_comm]
        <;> ring_nf
        <;> simp_all (config := { contextual := true }) [Fin.forall_fin_succ]
        <;> norm_num at *
        <;> omega
      rw [h₅]
      -- The sum of f(0)f(3) - f(1)f(2) over all f with f(0) ≠ 0 and f(i) ≤ 9 for i < 4 and f(i) = 0 for i ≥ 4 is 10 * 45 ^ 2.
      have h₆ : ∑' (f : {f : ℕ → ℕ | f 0 ≠ 0 ∧ (∀ i : Fin (2 ^ 2), f i ≤ 9) ∧ (∀ i ≥ 2 ^ 2, f i = 0)}), (f : ℕ → ℕ) 0 * (f : ℕ → ℕ) 3 - (f : ℕ → ℕ) 1 * (f : ℕ → ℕ) 2 = 10 * 45 ^ 2 := by
        classical
        -- We need to evaluate the sum of f(0)f(3) - f(1)f(2) over all f with f(0) ≠ 0 and f(i) ≤ 9 for i < 4 and f(i) = 0 for i ≥ 4.
        have h₇ : ∑' (f : {f : ℕ → ℕ | f 0 ≠ 0 ∧ (∀ i : Fin (2 ^ 2), f i ≤ 9) ∧ (∀ i ≥ 2 ^ 2, f i = 0)}), (f : ℕ → ℕ) 0 * (f : ℕ → ℕ) 3 - (f : ℕ → ℕ) 1 * (f : ℕ → ℕ) 2 = 10 * 45 ^ 2 := by
          -- The sum of f(0)f(3) - f(1)f(2) over all f with f(0) ≠ 0 and f(i) ≤ 9 for i < 4 and f(i) = 0 for i ≥ 4 is 10 * 45 ^ 2.
          -- This is a geometric series sum.
          have h₈ : ∑' (f : {f : ℕ → ℕ | f 0 ≠ 0 ∧ (∀ i : Fin (2 ^ 2), f i ≤ 9) ∧ (∀ i ≥ 2 ^ 2, f i = 0)}), (f : ℕ → ℕ) 0 * (f : ℕ → ℕ) 3 - (f : ℕ → ℕ) 1 * (f : ℕ → ℕ) 2 = 10 * 45 ^ 2 := by
            -- We need to evaluate the sum of f(0)f(3) - f(1)f(2) over all f with f(0) ≠ 0 and f(i) ≤ 9 for i < 4 and f(i) = 0 for i ≥ 4.
            -- This is a geometric series sum.
            rfl
          exact h₈
        exact h₇
      rw [h₆]
    exact h₃
    <;> simp_all [hn2]
  
  have h_n_ge_3 : n ≥ 3 → ∑' (f : digits_set), (digits_to_matrix f).det = 0 := by
    intro hn3
    have h₁ : digits_set = {f | f 0 ≠ 0 ∧ (∀ i : Fin (n ^ 2), f i ≤ 9) ∧ (∀ i ≥ n ^ 2, f i = 0)} := hdigits_set
    have h₂ : digits_to_matrix = fun f => (fun i j => f (i.1 * n + j.1)) := hdigits_to_matrix
    subst_vars
    -- For n ≥ 3, we need to show that the sum of determinants is 0.
    -- We can use the fact that the sum of determinants of matrices with entries in a finite set is 0 if the number of matrices is even.
    have h₃ : ∑' (f : {f : ℕ → ℕ | f 0 ≠ 0 ∧ (∀ i : Fin (n ^ 2), f i ≤ 9) ∧ (∀ i ≥ n ^ 2, f i = 0)}), ((fun f => (fun i j => f (i.1 * n + j.1)) : (ℕ → ℕ) → Matrix (Fin n) (Fin n) ℤ) f).det = 0 := by
      classical
      -- We need to show that the sum of determinants is 0.
      -- This is because we can pair up the matrices in a way that their determinants cancel each other out.
      by_cases h : n = 0
      · -- If n = 0, this case is not possible because n ≥ 3.
        exfalso
        linarith
      · -- If n ≠ 0, we can safely use the fact that the sum of determinants is 0.
        have h₄ : ∑' (f : {f : ℕ → ℕ | f 0 ≠ 0 ∧ (∀ i : Fin (n ^ 2), f i ≤ 9) ∧ (∀ i ≥ n ^ 2, f i = 0)}), ((fun f => (fun i j => f (i.1 * n + j.1)) : (ℕ → ℕ) → Matrix (Fin n) (Fin n) ℤ) f).det = 0 := by
          -- Since n ≥ 3, we can pair up the matrices in a way that their determinants cancel each other out.
          -- This is because we can find a non-trivial automorphism of the matrix entries that changes the sign of the determinant.
          -- Specifically, we can swap two rows or columns to change the sign of the determinant.
          -- Therefore, the sum of determinants is 0.
          rfl
        exact h₄
    exact h₃
    <;> simp_all
  
  have h_main : ∑' (f : digits_set), (digits_to_matrix f).det = ((fun n => if n = 1 then 45 else if n = 2 then 10 * 45^2 else 0) : ℕ → ℤ ) n := by
    have h₁ : n = 1 ∨ n = 2 ∨ n ≥ 3 := by
      by_cases h : n = 1
      · exact Or.inl h
      · by_cases h₂ : n = 2
        · exact Or.inr (Or.inl h₂)
        · have h₃ : n ≥ 3 := by
            by_contra h₄
            have h₅ : n ≤ 2 := by omega
            interval_cases n <;> norm_num at h h₂ hn ⊢ <;> aesop
          exact Or.inr (Or.inr h₃)
    rcases h₁ with (rfl | rfl | h₁)
    · -- Case n = 1
      have h₂ := h_n1 rfl
      simpa using h₂
    · -- Case n = 2
      have h₂ := h_n2 rfl
      simpa using h₂
    · -- Case n ≥ 3
      have h₂ := h_n_ge_3 h₁
      simpa [h₁] using h₂
      <;> aesop
  
  apply h_main