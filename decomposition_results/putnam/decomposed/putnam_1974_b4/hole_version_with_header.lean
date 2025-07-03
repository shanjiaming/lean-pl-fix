import Mathlib

open Set Nat Polynomial Filter Topology

/--
Let $f : \mathbb{R} \to \mathbb{R}$ be continuous in each variable seperately. Show that there exists a sequence of continuous functions $g_n : \mathbb{R}^2 \to \mathbb{R}$ such that $f(x,y) = \lim_{n \to \infty} g_n(x,y)$ for all $(x,y) \in \mathbb{R}^2$.
-/
macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)

theorem putnam_1974_b4
(f : ℝ × ℝ → ℝ)
(hfcontx : ∀ y : ℝ, Continuous (fun x => f ⟨x, y⟩))
(hfconty : ∀ x : ℝ, Continuous (fun y => f ⟨x, y⟩))
: ∃ g : ℕ → (ℝ × ℝ → ℝ), (∀ n : ℕ, Continuous (g n)) ∧ (∀ x y : ℝ, Tendsto (fun n => g n ⟨x, y⟩) atTop (𝓝 (f ⟨x, y⟩))) := by
  have h_main : ∃ (g : ℕ → (ℝ × ℝ → ℝ)), (∀ (n : ℕ), Continuous (g n)) ∧ (∀ (x y : ℝ), Tendsto (fun n => g n ⟨x, y⟩) atTop (𝓝 (f ⟨x, y⟩))) := by
    use fun n => f
    constructor
    · 
      intro n
      
      
      sorry
    · 
      intro x y
      
      have h₁ : (fun n : ℕ => f ⟨x, y⟩) = fun n : ℕ => f ⟨x, y⟩ := rfl
      have h₂ : Tendsto (fun n : ℕ => f ⟨x, y⟩) atTop (𝓝 (f ⟨x, y⟩)) := by
        hole_1
      hole_2
  hole_3