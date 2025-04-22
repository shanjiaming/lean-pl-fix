import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- If $|x - 2| = p$, where $x < 2$, then $x - p =$

$ \textbf{(A)} \ -2 \qquad \textbf{(B)} \ 2 \qquad \textbf{(C)} \ 2-2p \qquad \textbf{(D)} \ 2p-2 \qquad \textbf{(E)} \ |2p-2|  $ Show that it is \text{(C)2-2p}.-/
theorem amc12_2000_p5 (x p : ℝ) (h₀ : x < 2) (h₁ : abs (x - 2) = p) : x - p = 2 - 2 * p := by
  -- Since x < 2, the expression inside the absolute value (x - 2) is negative
  -- Therefore, |x - 2| = -(x - 2) = 2 - x
  have h₂ : abs (x - 2) = 2 - x := by
    -- The absolute value of a negative number is its negation
    rw [abs_of_neg] 
    -- Show that (x - 2) is negative because x < 2
    · exact sub_neg.mpr h₀
    -- The above line proves x - 2 < 0 from h₀ (x < 2)

  -- From the problem statement h₁: |x - 2| = p and our derivation h₂: |x - 2| = 2 - x
  -- We can equate them to get p = 2 - x
  have h₃ : p = 2 - x := by
    -- Substitute h₂ into h₁
    rw [h₁]
    rw [h₂]

  -- Now we can solve for x in terms of p from h₃
  have h₄ : x = 2 - p := by
    -- Rearrange h₃: p = 2 - x → x = 2 - p
    linarith

  -- Now we can compute x - p using the expression for x from h₄
  -- x - p = (2 - p) - p = 2 - 2p
  calc
    x - p = (2 - p) - p := by rw [h₄]  -- Substitute x = 2 - p
    _ = 2 - (p + p) := by ring          -- Combine like terms
    _ = 2 - 2 * p := by ring             -- Simplify to final form