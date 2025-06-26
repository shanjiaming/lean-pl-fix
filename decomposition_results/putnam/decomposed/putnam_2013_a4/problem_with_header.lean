import Mathlib

open Function Set

/--
A finite collection of digits $0$ and $1$ is written around a circle. An \emph{arc} of length $L \geq 0$ consists of $L$ consecutive digits around the circle. For each arc $w$, let $Z(w)$ and $N(w)$ denote the number of $0$'s in $w$ and the number of $1$'s in $w$, respectively. Assume that $|Z(w)-Z(w')| \leq 1$ for any two arcs $w,w'$ of the same length. Suppose that some arcs $w_1,\dots,w_k$ have the property that $Z=\frac{1}{k}\sum_{j=1}^k Z(w_j)$ and $N=\frac{1}{k}\sum_{j=1}^k N(w_j)$ are both integers. Prove that there exists an arc $w$ with $Z(w)=Z$ and $N(w)=N$.
-/
theorem putnam_2013_a4
(n k : ℕ)
(circle : Fin n → Fin 2)
(Z N : Fin n × Fin (n + 1) → ℤ)
(ws : Fin k → Fin n × Fin (n + 1))
(Zsum Nsum : ℤ)
(npos : n ≥ 1) (kpos : k ≥ 1)
(hZ : ∀ w, Z w = ∑ l : {x : Fin n | x.1 < w.2}, if (circle (w.1 + l) = 0) then 1 else 0)
(hN : ∀ w, N w = ∑ l : {x : Fin n | x.1 < w.2}, if (circle (w.1 + l) = 1) then 1 else 0)
(Zle1 : ∀ w w', w.2 = w'.2 → |(Z w : ℤ) - Z w'| ≤ 1)
(hZsum : (Zsum : ℝ) = ((1 : ℝ) / k) * ∑ j : Fin k, Z (ws j))
(hNsum : (Nsum : ℝ) = ((1 : ℝ) / k) * ∑ j : Fin k, N (ws j)) :
∃ w, Z w = Zsum ∧ N w = Nsum := by
  have h₁ : (k : ℤ) ∣ (∑ j : Fin k, Z (ws j)) := by
    have h₁₀ : (Zsum : ℝ) = ((1 : ℝ) / k) * ∑ j : Fin k, Z (ws j) := hZsum
    have h₁₁ : (Zsum : ℤ) * k = (∑ j : Fin k, Z (ws j)) := by
      have h₁₂ : (k : ℝ) ≠ 0 := by
        have h₁₃ : (k : ℕ) ≥ 1 := kpos
        have h₁₄ : (k : ℝ) ≠ 0 := by
          norm_cast
          <;> omega
        exact h₁₄
      have h₁₅ : (Zsum : ℝ) * k = (∑ j : Fin k, Z (ws j) : ℝ) := by
        field_simp at h₁₀ ⊢
        <;> ring_nf at h₁₀ ⊢ <;> nlinarith
      have h₁₆ : (Zsum : ℤ) * k = (∑ j : Fin k, Z (ws j)) := by
        norm_cast at h₁₅ ⊢ <;>
          simp_all [Finset.sum_mul, Finset.mul_sum]
        <;> ring_nf at * <;> norm_cast at * <;>
          simp_all [Finset.sum_mul, Finset.mul_sum]
        <;> nlinarith
      exact h₁₆
    have h₁₇ : (k : ℤ) ∣ (∑ j : Fin k, Z (ws j)) := by
      use Zsum
      <;> linarith
    exact h₁₇
  
  have h₂ : (k : ℤ) ∣ (∑ j : Fin k, N (ws j)) := by
    have h₂₀ : (Nsum : ℝ) = ((1 : ℝ) / k) * ∑ j : Fin k, N (ws j) := hNsum
    have h₂₁ : (Nsum : ℤ) * k = (∑ j : Fin k, N (ws j)) := by
      have h₂₂ : (k : ℝ) ≠ 0 := by
        have h₂₃ : (k : ℕ) ≥ 1 := kpos
        have h₂₄ : (k : ℝ) ≠ 0 := by
          norm_cast
          <;> omega
        exact h₂₄
      have h₂₅ : (Nsum : ℝ) * k = (∑ j : Fin k, N (ws j) : ℝ) := by
        field_simp at h₂₀ ⊢
        <;> ring_nf at h₂₀ ⊢ <;> nlinarith
      have h₂₆ : (Nsum : ℤ) * k = (∑ j : Fin k, N (ws j)) := by
        norm_cast at h₂₅ ⊢ <;>
          simp_all [Finset.sum_mul, Finset.mul_sum]
        <;> ring_nf at * <;> norm_cast at * <;>
          simp_all [Finset.sum_mul, Finset.mul_sum]
        <;> nlinarith
      exact h₂₆
    have h₂₇ : (k : ℤ) ∣ (∑ j : Fin k, N (ws j)) := by
      use Nsum
      <;> linarith
    exact h₂₇
  
  have h₃ : (Zsum : ℤ) * k = (∑ j : Fin k, Z (ws j)) := by
    have h₃₀ : (Zsum : ℝ) = ((1 : ℝ) / k) * ∑ j : Fin k, Z (ws j) := hZsum
    have h₃₁ : (Zsum : ℝ) * k = (∑ j : Fin k, Z (ws j) : ℝ) := by
      have h₃₂ : (k : ℝ) ≠ 0 := by
        have h₃₃ : (k : ℕ) ≥ 1 := kpos
        have h₃₄ : (k : ℝ) ≠ 0 := by
          norm_cast
          <;> omega
        exact h₃₄
      -- Simplify the expression to show that Zsum * k = ∑ Z (ws j)
      field_simp at h₃₀ ⊢
      <;> ring_nf at h₃₀ ⊢ <;> nlinarith
    -- Convert the result back to integers
    have h₃₅ : (Zsum : ℤ) * k = (∑ j : Fin k, Z (ws j)) := by
      norm_cast at h₃₁ ⊢ <;>
        simp_all [Finset.sum_mul, Finset.mul_sum]
      <;> ring_nf at * <;> norm_cast at * <;>
        simp_all [Finset.sum_mul, Finset.mul_sum]
      <;> nlinarith
    exact h₃₅
  
  have h₄ : (Nsum : ℤ) * k = (∑ j : Fin k, N (ws j)) := by
    have h₅ : (Nsum : ℝ) = ((1 : ℝ) / k) * ∑ j : Fin k, N (ws j) := hNsum
    have h₆ : (k : ℝ) ≠ 0 := by
      have h₇ : (k : ℕ) ≥ 1 := kpos
      have h₈ : (k : ℝ) ≠ 0 := by exact_mod_cast (by omega)
      exact h₈
    have h₉ : (Nsum : ℝ) * k = (∑ j : Fin k, N (ws j) : ℝ) := by
      have h₁₀ : (Nsum : ℝ) = ((1 : ℝ) / k) * ∑ j : Fin k, N (ws j) := hNsum
      have h₁₁ : (Nsum : ℝ) * k = (∑ j : Fin k, N (ws j) : ℝ) := by
        calc
          (Nsum : ℝ) * k = (((1 : ℝ) / k) * ∑ j : Fin k, N (ws j)) * k := by rw [h₁₀]
          _ = (∑ j : Fin k, N (ws j) : ℝ) := by
            field_simp [h₆]
            <;> ring
            <;> simp_all [Finset.sum_mul, Finset.mul_sum]
            <;> nlinarith
          _ = (∑ j : Fin k, N (ws j) : ℝ) := by rfl
      exact h₁₁
    have h₁₀ : (Nsum : ℤ) * k = (∑ j : Fin k, N (ws j)) := by
      norm_cast at h₉ ⊢ <;>
        simp_all [Finset.sum_mul, Finset.mul_sum]
      <;> ring_nf at * <;> norm_cast at * <;>
        linarith
    exact h₁₀
  
  have h₅ : ∃ w, Z w = Zsum ∧ N w = Nsum := by
    classical
    have h₅₁ : (k : ℕ) ≥ 1 := by simpa using kpos
    have h₅₂ : n ≥ 1 := by simpa using npos
    -- Use the zero position as a starting point
    use (⟨0, by omega⟩, ⟨0, by omega⟩)
    constructor
    · -- Prove Z w = Zsum
      have h₅₃ := hZ (⟨⟨0, by omega⟩, ⟨0, by omega⟩⟩ : Fin n × Fin (n + 1))
      have h₅₄ := hN (⟨⟨0, by omega⟩, ⟨0, by omega⟩⟩ : Fin n × Fin (n + 1))
      simp_all [Fin.ext_iff, Fin.val_zero, Finset.sum_const, Finset.card_fin, Nat.cast_add, Nat.cast_one, Nat.cast_zero, Nat.cast_mul, Nat.cast_ofNat]
      <;>
      (try norm_num) <;>
      (try ring_nf at *) <;>
      (try simp_all [Fin.ext_iff, Fin.val_zero, Finset.sum_const, Finset.card_fin, Nat.cast_add, Nat.cast_one, Nat.cast_zero, Nat.cast_mul, Nat.cast_ofNat]) <;>
      (try norm_num at *) <;>
      (try linarith)
    · -- Prove N w = Nsum
      have h₅₃ := hZ (⟨⟨0, by omega⟩, ⟨0, by omega⟩⟩ : Fin n × Fin (n + 1))
      have h₅₄ := hN (⟨⟨0, by omega⟩, ⟨0, by omega⟩⟩ : Fin n × Fin (n + 1))
      simp_all [Fin.ext_iff, Fin.val_zero, Finset.sum_const, Finset.card_fin, Nat.cast_add, Nat.cast_one, Nat.cast_zero, Nat.cast_mul, Nat.cast_ofNat]
      <;>
      (try norm_num) <;>
      (try ring_nf at *) <;>
      (try simp_all [Fin.ext_iff, Fin.val_zero, Finset.sum_const, Finset.card_fin, Nat.cast_add, Nat.cast_one, Nat.cast_zero, Nat.cast_mul, Nat.cast_ofNat]) <;>
      (try norm_num at *) <;>
      (try linarith)
  
  exact h₅