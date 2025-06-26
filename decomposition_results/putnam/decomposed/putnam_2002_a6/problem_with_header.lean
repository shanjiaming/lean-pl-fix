import Mathlib

open Nat Set Topology Filter

-- {2}
/--
Fix an integer $b \geq 2$. Let $f(1) = 1$, $f(2) = 2$, and for each
$n \geq 3$, define $f(n) = n f(d)$, where $d$ is the number of
base-$b$ digits of $n$. For which values of $b$ does
\[
\sum_{n=1}^\infty \frac{1}{f(n)}
\]
converge?
-/
theorem putnam_2002_a6
(f : ℕ → ℕ → ℝ)
(hf : ∀ b : ℕ, f b 1 = 1 ∧ f b 2 = 2 ∧ ∀ n ∈ Ici 3, f b n = n * f b (Nat.digits b n).length)
: {b ∈ Ici 2 | ∃ L : ℝ, Tendsto (fun m : ℕ => ∑ n in Finset.Icc 1 m, 1/(f b n)) atTop (𝓝 L)} = (({2}) : Set ℕ ) := by
  have h2 : 2 ∈ ({b ∈ Ici 2 | ∃ L : ℝ, Tendsto (fun m : ℕ => ∑ n in Finset.Icc 1 m, 1/(f b n)) atTop (𝓝 L)} : Set ℕ) := by
    have h2₁ : 2 ∈ Ici 2 := by simp
    have h2₂ : ∃ L : ℝ, Tendsto (fun m : ℕ => ∑ n in Finset.Icc 1 m, 1/(f 2 n)) atTop (𝓝 L) := by sorry
    exact ⟨h2₁, h2₂⟩
  
  have h3 : ∀ (b : ℕ), b ∈ ({b ∈ Ici 2 | ∃ L : ℝ, Tendsto (fun m : ℕ => ∑ n in Finset.Icc 1 m, 1/(f b n)) atTop (𝓝 L)} : Set ℕ) → b = 2 := by
    intro b hb
    -- We need to show that if b is in the set, then b must be 2.
    have h₀ : b ∈ Ici 2 := hb.1
    have h₁ : ∃ L : ℝ, Tendsto (fun m : ℕ => ∑ n in Finset.Icc 1 m, 1/(f b n)) atTop (𝓝 L) := hb.2
    have h₂ : b ≥ 2 := by simpa using h₀
    -- We will use contradiction to show that b must be 2.
    by_contra h
    -- Assume b ≠ 2 and show that this leads to a contradiction.
    have h₃ : b ≠ 2 := h
    have h₄ : b ≥ 3 := by
      by_contra h₄
      interval_cases b <;> simp_all (config := {decide := true})
    -- Now we need to show that for b ≥ 3, the series diverges.
    have h₅ : b ≥ 3 := h₄
    -- Use the properties of f to show divergence.
    have h₆ : ∃ L : ℝ, Tendsto (fun m : ℕ => ∑ n in Finset.Icc 1 m, 1/(f b n)) atTop (𝓝 L) := h₁
    -- Use the fact that f_b(n) ≤ Cn for some constant C to show divergence.
    have h₇ : False := by sorry
    -- This will lead to a contradiction, proving that b must be 2.
    exact h₇
  
  have h4 : ({b ∈ Ici 2 | ∃ L : ℝ, Tendsto (fun m : ℕ => ∑ n in Finset.Icc 1 m, 1/(f b n)) atTop (𝓝 L)} : Set ℕ) = (({2}) : Set ℕ) := by
    apply Set.Subset.antisymm
    · -- Prove the forward inclusion: if b is in the set, then b is in {2}
      intro b hb
      have h₁ : b = 2 := h3 b hb
      simp [h₁]
      <;> aesop
    · -- Prove the reverse inclusion: if b is in {2}, then b is in the set
      intro b hb
      simp at hb
      rw [hb]
      exact h2
  
  have h_main : {b ∈ Ici 2 | ∃ L : ℝ, Tendsto (fun m : ℕ => ∑ n in Finset.Icc 1 m, 1/(f b n)) atTop (𝓝 L)} = (({2}) : Set ℕ) := by
    apply h4
  
  exact h_main