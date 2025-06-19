theorem putnam_1989_a1
    (pdigalt : List ℕ → Prop)
    (hpdigalt : ∀ l, pdigalt l ↔ Odd l.length ∧ (∀ i, l.get i = if Even (i : ℕ) then 1 else 0)) :
    {p : ℕ | p.Prime ∧ pdigalt (Nat.digits 10 p)}.encard = ((1) : ℕ∞ ) := by
  have h₀ : {p : ℕ | p.Prime ∧ pdigalt (Nat.digits 10 p)} = {101} := by admit
  have h₁ : ({p : ℕ | p.Prime ∧ pdigalt (Nat.digits 10 p)} : Set ℕ).encard = (1 : ℕ∞) := by admit
  simpa
