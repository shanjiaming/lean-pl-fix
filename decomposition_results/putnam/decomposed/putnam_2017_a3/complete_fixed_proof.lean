theorem putnam_2017_a3 (a b : ℝ) (f g : ℝ → ℝ) (I : ℕ → ℝ) (altb : a < b)
  (fgcont : ContinuousOn f (Set.Icc a b) ∧ ContinuousOn g (Set.Icc a b))
  (fgimg : f '' (Set.Icc a b) ⊆ Set.Ioi 0 ∧ g '' (Set.Icc a b) ⊆ Set.Ioi 0)
  (fgint : ∫ x in Set.Ioo a b, f x = ∫ x in Set.Ioo a b, g x) (fneg : ∃ x : Set.Icc a b, f x ≠ g x)
  (hI : ∀ n > 0, I n = ∫ x in Set.Ioo a b, ((f x) ^ (n + 1)) / ((g x) ^ n)) :
  (∀ n > 0, I (n + 1) > I n) ∧ Tendsto I atTop atTop:=
  by
  have h_main₁ : ∀ n > 0, I (n + 1) > I n:= by
    --  intro n hn
    have h₁ : I (n + 1) = ∫ x in Set.Ioo a b, ((f x) ^ ((n + 1) + 1)) / ((g x) ^ (n + 1)):= by
      --  rw [hI (n + 1) (by linarith)] <;> ring_nf
      hole
    have h₂ : I n = ∫ x in Set.Ioo a b, ((f x) ^ (n + 1)) / ((g x) ^ n):= by -- rw [hI n hn]
      hole
    --  rw [h₁, h₂]
    have h₃ :
      ∫ x in Set.Ioo a b, ((f x) ^ ((n + 1) + 1)) / ((g x) ^ (n + 1)) =
        ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) := by sorry
    --  rw [h₃]
    have h₄ :
      ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) =
        ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) :=
      rfl
    --  rw [h₄]
    have h₅ :
      ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by sorry
    --  exact h₅
    hole
  have h_main₂ : Tendsto I atTop atTop:=
    by
    have h₁ : Tendsto I atTop atTop:=
      by
      have h₂ : Tendsto I atTop atTop:= by
        --  exact
        --    by
        --    have h₃ : Tendsto I atTop atTop := by
        --      exact
        --        by
        --        have h₄ : Tendsto I atTop atTop := by
        --          exact by
        --            have h₅ : Tendsto I atTop atTop := by exact by sorry
        --            exact h₅
        --        exact h₄
        --    exact h₃
        hole
      --  exact h₂
      hole
    --  exact h₁
    hole
  --  exact ⟨h_main₁, h_main₂⟩
  hole