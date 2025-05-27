lemma comparison_test {a b : ℕ+ → ℝ≥0} (h : ∀ n, a n ≤ b n) (hb : ¬ Summable b) :
    ¬ Summable a :=