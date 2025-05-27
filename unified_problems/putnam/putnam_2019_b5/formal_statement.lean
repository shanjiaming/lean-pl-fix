theorem putnam_2019_b5
(F : ℕ → ℤ)
(P : Polynomial ℝ)
(hF : ∀ x, x ≥ 1 → F (x + 2) = F (x + 1) + F x)
(F12 : F 1 = 1 ∧ F 2 = 1)
(Pdeg: Polynomial.degree P = 1008)
(hp: ∀ n : ℕ, (n ≤ 1008) → P.eval (2 * n + 1 : ℝ) = F (2 * n + 1))
: ∀ j k : ℕ, (P.eval 2019 = F j - F k) ↔ ⟨j, k⟩ = ((⟨2019, 1010⟩) : ℕ × ℕ )  := by