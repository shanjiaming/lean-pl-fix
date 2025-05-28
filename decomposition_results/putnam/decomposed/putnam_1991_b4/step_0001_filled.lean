theorem putnam_1991_b4 (p : ℕ) (podd : Odd p) (pprime : Prime p) : ∑ j, p.choose ↑j * (p + ↑j).choose ↑j ≡ 2 ^ p + 1 [MOD p ^ 2] :=
  by
  have h_main : (∑ j : Fin (p + 1), (p.choose j) * ((p + j).choose j)) ≡ (2 ^ p + 1) [MOD (p ^ 2)] := by sorry
  --  exact h_main
  hole