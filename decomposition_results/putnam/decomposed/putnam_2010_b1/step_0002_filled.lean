theorem h_main  : ¬∃ a, ∀ m > 0, ∑' (i : ℕ), a i ^ m = (↑m : ℝ) :=
  by
  --  intro h
  --  rcases h with ⟨a, ha⟩
  have h₁ : ∑' i : ℕ, a i = 1 := by sorry
  have h₂ : ∑' i : ℕ, (a i) ^ 2 = 2 := by sorry
  have h₃ : Tendsto (fun (i : ℕ) => a i) atTop (nhds 0) := by sorry
  have h₄ : ∃ (N : ℕ), ∀ (i : ℕ), i ≥ N → |a i| ≤ 1 := by sorry
  --  rcases h₄ with ⟨N, hN⟩
  have h₅ : ∀ (m : ℕ), m ≥ 2 → ∑' i : ℕ, (a i) ^ m = m := by sorry
  have h₆ : ∑' i : ℕ, (a i) ^ 2 = 2 := h₂
  have h₇ : ∑' i : ℕ, a i = 1 := h₁
  have h₈ : ∀ (m : ℕ), m ≥ 2 → ∑' i : ℕ, (a i) ^ m = m := h₅
  have h₉ : ∑' i : ℕ, (a i) ^ 4 = 4 := by sorry
  have h₁₀ : ∑' i : ℕ, (a i) ^ 4 ≤ (N : ℝ) * (Finset.univ.sup (fun i : Fin N => |a i.val|)) ^ 4 + 1 := by sorry
  have h₁₁ : (N : ℝ) * (Finset.univ.sup (fun i : Fin N => |a i.val|)) ^ 4 + 1 < 4 := by sorry
  linarith
  hole