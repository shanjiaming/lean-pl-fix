theorem h_main (n : ℕ) (hn : n > 0) (fourAP : ℤ → ℤ → ℤ → ℤ → Prop) (hfourAP : ∀ (n1 n2 n3 n4 : ℤ), fourAP n1 n2 n3 n4 ↔ n4 - n3 = n3 - n2 ∧ n3 - n2 = n2 - n1) : ∀ r > 0, r + 3 ≤ n → ¬fourAP ↑(n.choose r) ↑(n.choose (r + 1)) ↑(n.choose (r + 2)) ↑(n.choose (r + 3)) :=
  by
  --  intro r hr hrn
  have h₁ : ¬fourAP (n.choose r : ℤ) (n.choose (r + 1) : ℤ) (n.choose (r + 2) : ℤ) (n.choose (r + 3) : ℤ) := by sorry
  --  exact h₁
  hole