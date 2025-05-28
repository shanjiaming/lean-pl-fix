theorem putnam_1962_b1 (p : ℕ → ℝ → ℝ) (x y : ℝ) (n : ℕ) (h0 : p 0 = fun x : ℝ => 1)
  (hp : ∀ n > 0, p n = fun x : ℝ => ∏ i in Finset.range n, (x - i)) :
  p n (x + y) = ∑ k in Finset.range (n + 1), Nat.choose n k * (p k x) * (p (n - k) y):=
  by
  have h₁ : ∀ (n : ℕ) (x : ℝ), p n x = ∏ i in Finset.range n, (x - i):=
    by
    --  intro n x
    --  by_cases hn : n = 0
    --  · subst hn
      have h₂ : p 0 x = 1:= by
        have h₃ : (p 0) = fun x : ℝ => 1 := h0
        simp [h₃]
        hole
      have h₄ : (∏ i in Finset.range 0, (x - i : ℝ)) = 1:= by simp
        hole
    --    simp_all
    ·
      have hn' : n > 0 := Nat.pos_of_ne_zero hn
      have h₂ : p n = fun x : ℝ => ∏ i in Finset.range n, (x - i) := hp n hn'
      have h₃ : p n x = ∏ i in Finset.range n, (x - i):= by rw [h₂] <;> simp
        hole
      exact h₃
    hole
  have h₂ : p n (x + y) = ∑ k in Finset.range (n + 1), Nat.choose n k * (p k x) * (p (n - k) y):=
    by
    have h₃ : p n (x + y) = ∏ i in Finset.range n, (x + y - i):= by -- rw [h₁]
      hole
    --  rw [h₃]
    have h₄ :
      ∑ k in Finset.range (n + 1), (Nat.choose n k : ℝ) * (p k x) * (p (n - k) y) =
        ∑ k in Finset.range (n + 1),
          (Nat.choose n k : ℝ) * (∏ i in Finset.range k, (x - i)) * (∏ i in Finset.range (n - k), (y - i)) := by sorry
    --  rw [h₄]
    have h₅ :
      ∏ i in Finset.range n, (x + y - i : ℝ) =
        ∑ k in Finset.range (n + 1),
          (Nat.choose n k : ℝ) * (∏ i in Finset.range k, (x - i)) * (∏ i in Finset.range (n - k), (y - i)) := by sorry
    --  rw [h₅] <;> simp [Finset.sum_range_succ, add_assoc] <;> ring_nf <;> norm_num <;> linarith
    hole
  --  rw [h₂]
  hole