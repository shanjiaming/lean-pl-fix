import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- We write $\lfloor X \rfloor$ to mean the greatest integer less than or equal to $X$; for example $\lfloor 3\frac{1}{2} \rfloor = 3$. If $N = \frac{1}{3}$, what is the value of $\lfloor 10N \rfloor + \lfloor 100N \rfloor + \lfloor 1000N \rfloor + \lfloor 10,000N \rfloor$? Show that it is 3702.-/
theorem mathd_algebra_153 (n : ℝ) (h₀ : n = 1 / 3) :
    Int.floor (10 * n) + Int.floor (100 * n) + Int.floor (1000 * n) + Int.floor (10000 * n) = 3702 := by
  have h₁ : Int.floor (10 * n) = 3 := by
    rw [h₀]
    norm_num [Int.floor_eq_iff, Int.cast_ofNat]
    <;> norm_num <;>
    (try constructor <;> norm_num) <;>
    (try linarith) <;>
    (try ring_nf at * <;> norm_num)
    <;>
    (try linarith)
  
  have h₂ : Int.floor (100 * n) = 33 := by
    rw [h₀]
    norm_num [Int.floor_eq_iff, Int.cast_ofNat]
    <;> norm_num <;>
    (try constructor <;> norm_num) <;>
    (try linarith) <;>
    (try ring_nf at * <;> norm_num)
    <;>
    (try linarith)
  
  have h₃ : Int.floor (1000 * n) = 333 := by
    rw [h₀]
    norm_num [Int.floor_eq_iff, Int.cast_ofNat]
    <;> norm_num <;>
    (try constructor <;> norm_num) <;>
    (try linarith) <;>
    (try ring_nf at * <;> norm_num)
    <;>
    (try linarith)
  
  have h₄ : Int.floor (10000 * n) = 3333 := by
    rw [h₀]
    norm_num [Int.floor_eq_iff, Int.cast_ofNat]
    <;> norm_num <;>
    (try constructor <;> norm_num) <;>
    (try linarith) <;>
    (try ring_nf at * <;> norm_num)
    <;>
    (try linarith)
  
  have h₅ : Int.floor (10 * n) + Int.floor (100 * n) + Int.floor (1000 * n) + Int.floor (10000 * n) = 3702 := by
    rw [h₁, h₂, h₃, h₄]
    <;> norm_num
    <;> rfl
  
  apply h₅
