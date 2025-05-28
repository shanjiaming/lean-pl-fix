theorem putnam_2008_b5 (fqsat : (ℝ → ℝ) → ℚ → Prop) (hfqsat : ∀ (f : ℝ → ℝ) (q : ℚ), fqsat f q ↔ ContDiff ℝ 1 f ∧ ∃ p, ↑p = f ↑q ∧ p.den = q.den) : ∀ (f : ℝ → ℝ), (∀ (q : ℚ), fqsat f q) ↔ f ∈ {x | ∃ n, (fun x => x + ↑n) = x} ∪ {x | ∃ n, (fun x => -x + ↑n) = x} :=
  by
  have h_main :
    ∀ (f : ℝ → ℝ),
      (∀ (q : ℚ), fqsat f q) ↔ f ∈ ({fun (x : ℝ) => x + n | n : ℤ} ∪ {fun (x : ℝ) => -x + n | n : ℤ} : Set (ℝ → ℝ)) := by sorry
  --  exact h_main
  hole