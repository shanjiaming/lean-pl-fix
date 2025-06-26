import Mathlib

open Set Function Filter Topology Polynomial Real

-- True
/--
Let $B_n(x) = 1^x + 2^x + \dots + n^x$ and let $f(n) = \frac{B_n(\log_n 2)}{(n \log_2 n)^2}$. Does $f(2) + f(3) + f(4) + \dots$ converge?
-/
macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)

theorem putnam_1982_a2
(B : ℕ → ℝ → ℝ)
(hB : B = fun (n : ℕ) (x : ℝ) ↦ ∑ k in Finset.Icc 1 n, (k : ℝ) ^ x)
(f : ℕ → ℝ)
(hf : f = fun n ↦ B n (logb n 2) / (n * logb 2 n) ^ 2)
: (∃ L : ℝ, Tendsto (fun N ↦ ∑ j in Finset.Icc 2 N, f j) atTop (𝓝 L)) ↔ ((True) : Prop ) := by
  have h₁ : (∃ L : ℝ, Tendsto (fun N ↦ ∑ j in Finset.Icc 2 N, f j) atTop (𝓝 L)) := by
    
    refine' ⟨∑' j : ℕ, if j ≥ 2 then f j else 0, _⟩
    
    have h₂ : Tendsto (fun N ↦ ∑ j in Finset.Icc 2 N, f j) atTop (𝓝 (∑' j : ℕ, if j ≥ 2 then f j else 0)) := by
      
      hole_1
    hole_2
  
  hole_3