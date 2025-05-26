theorem h₂ (Xrandvar : (ℕ → ℝ) → Prop) (hXrandvar : Xrandvar = fun X => (∀ (n : ℕ), X n ∈ Set.Icc 0 1) ∧ ∑' (n : ℕ), X n = 1) (E : (ℕ → ℝ) → (ℕ → ℝ) → ℝ) (hE : E = fun X f => ∑' (n : ℕ), f n * X n) (h₁ :  1 / 3 ∈    {X0 |      ∃ X,        Xrandvar X ∧          (E X fun x => (↑x : ℝ)) = 1 ∧ (E X fun x => (↑x : ℝ) ^ 2) = 2 ∧ (E X fun x => (↑x : ℝ) ^ 3) = 5 ∧ X0 = X 0}) : sInf
      {X0 |
        ∃ X,
          Xrandvar X ∧
            (E X fun x => (↑x : ℝ)) = 1 ∧
              (E X fun x => (↑x : ℝ) ^ 2) = 2 ∧ (E X fun x => (↑x : ℝ) ^ 3) = 5 ∧ X0 = X 0} ≤
    1 / 3 :=
  --  by sorry
  hole