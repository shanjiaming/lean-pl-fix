theorem h₁₄ (A B C A' B' C' P Q R : EuclideanSpace ℝ (Fin 2)) (k : ℝ) (hk : k > 0) (hABC : ¬Collinear ℝ {A, B, C}) (hA' : A' ∈ segment ℝ B C ∧ dist C A' / dist A' B = k) (hB' : B' ∈ segment ℝ C A ∧ dist A B' / dist B' C = k) (hC' : C' ∈ segment ℝ A B ∧ dist B C' / dist C' A = k) (hP : P ∈ segment ℝ B B' ∧ P ∈ segment ℝ C C') (hQ : Q ∈ segment ℝ C C' ∧ Q ∈ segment ℝ A A') (hR : R ∈ segment ℝ A A' ∧ R ∈ segment ℝ B B') (h₂ : A' ∈ segment ℝ B C) (h₃ : dist C A' / dist A' B = k) (h₄ : B' ∈ segment ℝ C A) (h₅ : dist A B' / dist B' C = k) (h₆ : C' ∈ segment ℝ A B) (h₇ : dist B C' / dist C' A = k) (h₈ : P ∈ segment ℝ B B') (h₉ : P ∈ segment ℝ C C') (h₁₀ : Q ∈ segment ℝ C C') (h₁₁ : Q ∈ segment ℝ A A') (h₁₂ : R ∈ segment ℝ A A') (h₁₃ : R ∈ segment ℝ B B') : Collinear ℝ {A, B, C} := by
  exfalso <;> simp_all [Collinear, EuclideanSpace.segment_eq_image] <;> (try norm_num) <;> (try linarith) <;>
          (try ring_nf at *) <;>
        (try field_simp at *) <;>
      (try nlinarith) <;>
    (try {aesop
      })