import Mathlib

open Topology Filter Set Matrix

/--
Let $Q$ be an $n$-by-$n$ real orthogonal matrix, and let $u \in \mathbb{R}^n$ be a unit column vector (that is, $u^T u = 1$). Let $P = I - 2uu^T$, where $I$ is the $n$-by-$n$ identity matrix. Show that if $1$ is not an eigenvalue of $Q$, then $1$ is an eigenvalue of $PQ$.
-/
theorem putnam_2019_b3
(n : ℕ)
(hn : n > 0)
(Q : Matrix (Fin n) (Fin n) ℝ)
(hQ0 : ∀ i j : Fin n, i ≠ j → dotProduct (Q i) (Q j) = 0 ∧ dotProduct (Qᵀ i) (Qᵀ j) = 0)
(hQ1 : ∀ i : Fin n, dotProduct (Q i) (Q i) = 1 ∧ dotProduct (Qᵀ i) (Qᵀ i) = 1)
(u : Matrix (Fin n) (Fin 1) ℝ)
(hu : uᵀ*u = 1)
(P : Matrix (Fin n) (Fin n) ℝ)
(hP : P = 1 - 2 * (u * uᵀ))
: (Q - 1).det ≠ 0 → (P * Q - 1).det = 0 := by
  intro hQ_det_ne_zero
  have h_orthogonal_Q : Q * Qᵀ = 1 ∧ Qᵀ * Q = 1 := by
    constructor
    · -- Prove Q * Qᵀ = 1
      ext i j
      rw [Matrix.mul_apply]
      by_cases h : i = j
      · -- Case i = j
        rw [h]
        simp_all [Matrix.one_apply, dotProduct, Matrix.transpose_apply, Fin.sum_univ_succ]
        have h₁ := hQ1 i
        simp_all [Matrix.one_apply, dotProduct, Matrix.transpose_apply, Fin.sum_univ_succ]
        <;>
        aesop
      · -- Case i ≠ j
        have h₂ := hQ0 i j h
        simp_all [Matrix.one_apply, dotProduct, Matrix.transpose_apply, Fin.sum_univ_succ]
        <;>
        aesop
    · -- Prove Qᵀ * Q = 1
      ext i j
      rw [Matrix.mul_apply]
      by_cases h : i = j
      · -- Case i = j
        rw [h]
        simp_all [Matrix.one_apply, dotProduct, Matrix.transpose_apply, Fin.sum_univ_succ]
        have h₁ := hQ1 i
        simp_all [Matrix.one_apply, dotProduct, Matrix.transpose_apply, Fin.sum_univ_succ]
        <;>
        aesop
      · -- Case i ≠ j
        have h₂ := hQ0 i j h
        simp_all [Matrix.one_apply, dotProduct, Matrix.transpose_apply, Fin.sum_univ_succ]
        <;>
        aesop
  
  have h_P_def : P = 1 - 2 • (u * uᵀ) := by
    rw [hP]
    <;>
    simp [Matrix.mul_smul, Matrix.smul_mul, Matrix.one_mul, Matrix.mul_one]
    <;>
    ring_nf
    <;>
    simp_all [Matrix.mul_assoc]
    <;>
    aesop
  
  have h_P_mul_u : P * u = -u := by
    have h₁ : P * u = (1 : Matrix (Fin n) (Fin n) ℝ) * u - (2 : ℝ) • (u * uᵀ : Matrix (Fin n) (Fin n) ℝ) * u := by
      rw [h_P_def]
      simp [Matrix.mul_sub, Matrix.sub_mul, Matrix.one_mul, Matrix.mul_one, Matrix.mul_assoc, Matrix.mul_smul,
        Matrix.smul_mul]
      <;>
      ring_nf
      <;>
      simp [Matrix.mul_assoc]
      <;>
      aesop
    rw [h₁]
    have h₂ : ((1 : Matrix (Fin n) (Fin n) ℝ) * u : Matrix (Fin n) (Fin 1) ℝ) = u := by
      simp [Matrix.one_mul]
    rw [h₂]
    have h₃ : ((2 : ℝ) • (u * uᵀ : Matrix (Fin n) (Fin n) ℝ) * u : Matrix (Fin n) (Fin 1) ℝ) = (2 : ℝ) • (u * (uᵀ * u) : Matrix (Fin n) (Fin 1) ℝ) := by
      simp [Matrix.mul_assoc, Matrix.mul_smul, Matrix.smul_mul]
      <;>
      ext i j
      <;>
      simp [Matrix.mul_apply, Matrix.dotProduct, Fin.sum_univ_succ, mul_add, mul_comm, mul_left_comm, mul_assoc]
      <;>
      ring_nf
      <;>
      simp_all [Matrix.mul_assoc]
      <;>
      aesop
    rw [h₃]
    have h₄ : (uᵀ * u : Matrix (Fin 1) (Fin 1) ℝ) = (1 : Matrix (Fin 1) (Fin 1) ℝ) := by
      exact hu
    have h₅ : (u * (uᵀ * u) : Matrix (Fin n) (Fin 1) ℝ) = u * (1 : Matrix (Fin 1) (Fin 1) ℝ) := by
      rw [h₄]
    rw [h₅]
    have h₆ : (u * (1 : Matrix (Fin 1) (Fin 1) ℝ) : Matrix (Fin n) (Fin 1) ℝ) = u := by
      simp [Matrix.mul_one]
    rw [h₆]
    have h₇ : (u : Matrix (Fin n) (Fin 1) ℝ) - (2 : ℝ) • (u : Matrix (Fin n) (Fin 1) ℝ) = (-u : Matrix (Fin n) (Fin 1) ℝ) := by
      have h₈ : (u : Matrix (Fin n) (Fin 1) ℝ) - (2 : ℝ) • (u : Matrix (Fin n) (Fin 1) ℝ) = (u : Matrix (Fin n) (Fin 1) ℝ) - (2 : ℝ) • (u : Matrix (Fin n) (Fin 1) ℝ) := rfl
      rw [h₈]
      -- Use matrix operations to simplify the expression
      have h₉ : (u : Matrix (Fin n) (Fin 1) ℝ) - (2 : ℝ) • (u : Matrix (Fin n) (Fin 1) ℝ) = (-u : Matrix (Fin n) (Fin 1) ℝ) := by
        ext i j
        simp [Matrix.sub_apply, Matrix.smul_apply, neg_mul, sub_eq_add_neg, add_assoc]
        <;> ring_nf
        <;> simp_all [Matrix.mul_apply, Fin.sum_univ_succ]
        <;> field_simp
        <;> ring_nf
        <;> simp_all [Matrix.mul_apply, Fin.sum_univ_succ]
        <;> nlinarith
      rw [h₉]
    rw [h₇]
    <;>
    aesop
  
  have h_u_ne_zero : u ≠ 0 := by
    intro h_u_zero
    have h₁ : uᵀ * u = 1 := hu
    have h₂ : u = 0 := h_u_zero
    rw [h₂] at h₁
    have h₃ : (0 : Matrix (Fin n) (Fin 1) ℝ)ᵀ * (0 : Matrix (Fin n) (Fin 1) ℝ) = (1 : Matrix (Fin 1) (Fin 1) ℝ) := by simpa using h₁
    have h₄ : (0 : Matrix (Fin n) (Fin 1) ℝ)ᵀ * (0 : Matrix (Fin n) (Fin 1) ℝ) = (0 : Matrix (Fin 1) (Fin 1) ℝ) := by
      ext i j
      simp [Matrix.mul_apply, Fin.sum_univ_zero]
      <;> aesop
    have h₅ : (0 : Matrix (Fin 1) (Fin 1) ℝ) = (1 : Matrix (Fin 1) (Fin 1) ℝ) := by simpa using h₄.symm.trans h₃
    have h₆ : (0 : Matrix (Fin 1) (Fin 1) ℝ) ≠ (1 : Matrix (Fin 1) (Fin 1) ℝ) := by
      intro h
      have h₇ := congr_arg (fun x => x 0 0) h
      simp at h₇
      <;> contradiction
    exact h₆ h₅
  
  have h_main : (P * Q - 1).det = 0 := by
    have h₁ : P * Q - 1 = - (1 - P * Q) := by
      simp [sub_eq_add_neg, add_assoc]
      <;>
      ext i j <;>
      simp [Matrix.sub_apply, Matrix.one_apply, Matrix.mul_apply, Fin.sum_univ_succ] <;>
      ring_nf <;>
      simp_all [Matrix.mul_assoc] <;>
      aesop
    have h₂ : (P * Q - 1).det = (-1 : ℝ) ^ n * (1 - P * Q).det := by
      rw [h₁]
      simp [Matrix.det_neg, pow_succ]
      <;>
      ring_nf
      <;>
      simp_all [Matrix.mul_assoc]
      <;>
      aesop
    have h₃ : (1 - P * Q : Matrix (Fin n) (Fin n) ℝ) = 2 • (u * uᵀ * Q : Matrix (Fin n) (Fin n) ℝ) - (Q - 1 : Matrix (Fin n) (Fin n) ℝ) := by
      calc
        (1 - P * Q : Matrix (Fin n) (Fin n) ℝ) = 1 - (1 - 2 • (u * uᵀ : Matrix (Fin n) (Fin n) ℝ)) * Q := by rw [h_P_def]
        _ = 2 • (u * uᵀ * Q : Matrix (Fin n) (Fin n) ℝ) - (Q - 1 : Matrix (Fin n) (Fin n) ℝ) := by
          simp [Matrix.mul_sub, Matrix.sub_mul, Matrix.one_mul, Matrix.mul_one, Matrix.mul_assoc,
            Matrix.mul_smul, Matrix.smul_mul]
          <;>
          ext i j <;>
          simp [Matrix.sub_apply, Matrix.one_apply, Matrix.mul_apply, Fin.sum_univ_succ] <;>
          ring_nf <;>
          simp_all [Matrix.mul_assoc] <;>
          aesop
    rw [h₂, h₃]
    have h₄ : (2 • (u * uᵀ * Q : Matrix (Fin n) (Fin n) ℝ) - (Q - 1 : Matrix (Fin n) (Fin n) ℝ)).det = 0 := by
      have h₅ : ((2 : ℝ) • (u * uᵀ * Q : Matrix (Fin n) (Fin n) ℝ) - (Q - 1 : Matrix (Fin n) (Fin n) ℝ)).det = 0 := by
        -- Prove that the determinant is zero
        have h₅₁ : ((2 : ℝ) • (u * uᵀ * Q : Matrix (Fin n) (Fin n) ℝ) - (Q - 1 : Matrix (Fin n) (Fin n) ℝ)).det = 0 := by
          -- Use the fact that the matrix is singular
          have h₅₂ : n ≠ 0 := by linarith
          have h₅₃ : (u * uᵀ * Q : Matrix (Fin n) (Fin n) ℝ) - (u * uᵀ * Q : Matrix (Fin n) (Fin n) ℝ) = 0 := by
            abel
          have h₅₄ : ((2 : ℝ) • (u * uᵀ * Q : Matrix (Fin n) (Fin n) ℝ) - (Q - 1 : Matrix (Fin n) (Fin n) ℝ)).det = 0 := by
            -- Use the fact that the matrix is singular
            have h₅₅ : (u * uᵀ * Q : Matrix (Fin n) (Fin n) ℝ) - (u * uᵀ * Q : Matrix (Fin n) (Fin n) ℝ) = 0 := by
              abel
            -- Use the fact that the matrix is singular
            have h₅₆ : ((2 : ℝ) • (u * uᵀ * Q : Matrix (Fin n) (Fin n) ℝ) - (Q - 1 : Matrix (Fin n) (Fin n) ℝ)).det = 0 := by
              -- Use the fact that the matrix is singular
              apply Matrix.det_eq_zero_of_column_eq_zero (⟨0, by linarith⟩ : Fin n)
              intro i
              ext j k
              simp [Matrix.mul_apply, Matrix.sub_apply, Fin.sum_univ_succ, Matrix.one_apply, Matrix.smul_apply,
                Matrix.mul_smul, Matrix.smul_mul]
              <;>
              aesop
            exact h₅₆
          exact h₅₄
        exact h₅₁
      simpa using h₅
    have h₅ : ((-1 : ℝ) ^ n * (2 • (u * uᵀ * Q : Matrix (Fin n) (Fin n) ℝ) - (Q - 1 : Matrix (Fin n) (Fin n) ℝ)).det : ℝ) = 0 := by
      rw [h₄]
      simp
    simpa [h₂, h₃, h₄] using h₅
  
  exact h_main