import Mathlib
import Aesop

set_option maxHeartbeats 0  -- Disable heartbeat limit to prevent timeout during proof checking

open BigOperators Real Nat Topology Rat  -- Open common mathematical namespaces

theorem mathd_algebra_182 (y : ℂ) : 7 * (3 * y + 2) = 21 * y + 14 := by
  rw [mul_add]
  rw [<- mul_assoc]
  norm_num  -- Normalizes numerical expressions, computing 7*3 to 21 and 7*2 to 14