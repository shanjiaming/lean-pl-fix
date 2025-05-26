theorem putnam_1989_a1 (pdigalt : List ℕ → Prop) (hpdigalt : ∀ (l : List ℕ), pdigalt l ↔ Odd l.length ∧ ∀ (i : Fin l.length), l.get i = if Even (↑i : ℕ) then 1 else 0) : {p | Nat.Prime p ∧ pdigalt (digits 10 p)}.encard = 1 :=
  by
  have h₀ : {p : ℕ | p.Prime ∧ pdigalt (Nat.digits 10 p)} = { 101 } := by sorry
  have h₁ : ({p : ℕ | p.Prime ∧ pdigalt (Nat.digits 10 p)} : Set ℕ).encard = (1 : ℕ∞) := by sorry
  sorry