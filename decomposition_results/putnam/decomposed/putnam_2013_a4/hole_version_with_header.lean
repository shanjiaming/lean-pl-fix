import Mathlib

open Function Set

/--
A finite collection of digits $0$ and $1$ is written around a circle. An \emph{arc} of length $L \geq 0$ consists of $L$ consecutive digits around the circle. For each arc $w$, let $Z(w)$ and $N(w)$ denote the number of $0$'s in $w$ and the number of $1$'s in $w$, respectively. Assume that $|Z(w)-Z(w')| \leq 1$ for any two arcs $w,w'$ of the same length. Suppose that some arcs $w_1,\dots,w_k$ have the property that $Z=\frac{1}{k}\sum_{j=1}^k Z(w_j)$ and $N=\frac{1}{k}\sum_{j=1}^k N(w_j)$ are both integers. Prove that there exists an arc $w$ with $Z(w)=Z$ and $N(w)=N$.
-/
macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)

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
          hole_1
        hole_2
      have h₁₅ : (Zsum : ℝ) * k = (∑ j : Fin k, Z (ws j) : ℝ) := by
        hole_3
      have h₁₆ : (Zsum : ℤ) * k = (∑ j : Fin k, Z (ws j)) := by
        hole_4
      hole_5
    have h₁₇ : (k : ℤ) ∣ (∑ j : Fin k, Z (ws j)) := by
      hole_6
    hole_7
  
  have h₂ : (k : ℤ) ∣ (∑ j : Fin k, N (ws j)) := by
    have h₂₀ : (Nsum : ℝ) = ((1 : ℝ) / k) * ∑ j : Fin k, N (ws j) := hNsum
    have h₂₁ : (Nsum : ℤ) * k = (∑ j : Fin k, N (ws j)) := by
      have h₂₂ : (k : ℝ) ≠ 0 := by
        have h₂₃ : (k : ℕ) ≥ 1 := kpos
        have h₂₄ : (k : ℝ) ≠ 0 := by
          hole_8
        hole_9
      have h₂₅ : (Nsum : ℝ) * k = (∑ j : Fin k, N (ws j) : ℝ) := by
        hole_10
      have h₂₆ : (Nsum : ℤ) * k = (∑ j : Fin k, N (ws j)) := by
        hole_11
      hole_12
    have h₂₇ : (k : ℤ) ∣ (∑ j : Fin k, N (ws j)) := by
      hole_13
    hole_14
  
  have h₃ : (Zsum : ℤ) * k = (∑ j : Fin k, Z (ws j)) := by
    have h₃₀ : (Zsum : ℝ) = ((1 : ℝ) / k) * ∑ j : Fin k, Z (ws j) := hZsum
    have h₃₁ : (Zsum : ℝ) * k = (∑ j : Fin k, Z (ws j) : ℝ) := by
      have h₃₂ : (k : ℝ) ≠ 0 := by
        have h₃₃ : (k : ℕ) ≥ 1 := kpos
        have h₃₄ : (k : ℝ) ≠ 0 := by
          hole_15
        hole_16
      
      hole_17
    
    have h₃₅ : (Zsum : ℤ) * k = (∑ j : Fin k, Z (ws j)) := by
      hole_18
    hole_19
  
  have h₄ : (Nsum : ℤ) * k = (∑ j : Fin k, N (ws j)) := by
    have h₅ : (Nsum : ℝ) = ((1 : ℝ) / k) * ∑ j : Fin k, N (ws j) := hNsum
    have h₆ : (k : ℝ) ≠ 0 := by
      have h₇ : (k : ℕ) ≥ 1 := kpos
      have h₈ : (k : ℝ) ≠ 0 := by hole_20
      hole_21
    have h₉ : (Nsum : ℝ) * k = (∑ j : Fin k, N (ws j) : ℝ) := by
      have h₁₀ : (Nsum : ℝ) = ((1 : ℝ) / k) * ∑ j : Fin k, N (ws j) := hNsum
      have h₁₁ : (Nsum : ℝ) * k = (∑ j : Fin k, N (ws j) : ℝ) := by
        hole_22
      hole_23
    have h₁₀ : (Nsum : ℤ) * k = (∑ j : Fin k, N (ws j)) := by
      hole_24
    hole_25
  
  have h₅ : ∃ w, Z w = Zsum ∧ N w = Nsum := by
    hole_28
  
  hole_29