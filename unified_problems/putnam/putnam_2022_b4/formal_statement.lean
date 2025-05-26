theorem putnam_2022_b4
  (n : ℕ)
  (hn : n ≥ 4)
  (ap3 : ℝ → ℝ → ℝ → Prop)
  (xprog : (ℕ → ℝ) → Prop)
  (hap3 : ∀ x0 x1 x2, ap3 x0 x1 x2 ↔ ∀ o0 o1 o2 : ℝ, (o0 < o1 ∧ o1 < o2 ∧ ({o0, o1, o2} : Set ℝ) = {x0, x1, x2}) → (o1 - o0 = o2 - o1))
  (hxprog : ∀ x, xprog x ↔
    ((∀ i j : Fin n, i.1 ≠ j.1 → x i.1 ≠ x j.1) ∧ (∀ i : Fin n, ap3 (x i.1) (x ((i.1 + 1) % n)) (x ((i.1 + 2) % n))))) :
  (∃ x, xprog x) ↔ n ∈ (({n : ℕ | 3 ∣ n ∧ n ≥ 9}) : Set ℕ ) := by