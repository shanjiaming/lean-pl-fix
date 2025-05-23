import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Because of redistricting, Liberty Middle School's enrollment increased to 598 students. This is an increase of $4\%$ over last year's enrollment. What was last year's enrollment? Show that it is 575\text{ students}.-/
theorem mathd_algebra_137 (x : ℕ) (h₀ : ↑x + (4 : ℝ) / (100 : ℝ) * ↑x = 598) : x = 575 := by
  have h₁ : (104 : ℝ) * (x : ℝ) = (59800 : ℝ) := by
    have h₁ : (x : ℝ) + (4 : ℝ) / (100 : ℝ) * (x : ℝ) = 598 := h₀
    ring_nf at h₁ ⊢
    <;> linarith
  
  have h₂ : 104 * x = 59800 := by
    norm_cast at h₁
    <;>
    (try norm_num at h₁ ⊢) <;>
    (try ring_nf at h₁ ⊢) <;>
    (try norm_num at h₁ ⊢) <;>
    (try omega) <;>
    (try
      {
        norm_num at h₁ ⊢
        <;>
        ring_nf at h₁ ⊢
        <;>
        norm_num at h₁ ⊢
        <;>
        omega
      })
    <;>
    (try
      {
        ring_nf at h₁ ⊢
        <;>
        norm_num at h₁ ⊢
        <;>
        omega
      })
    <;>
    (try
      {
        norm_num at h₁ ⊢
        <;>
        ring_nf at h₁ ⊢
        <;>
        norm_num at h₁ ⊢
        <;>
        omega
      })
    <;>
    (try
      {
        ring_nf at h₁ ⊢
        <;>
        norm_num at h₁ ⊢
        <;>
        omega
      })
    <;>
    (try
      {
        norm_num at h₁ ⊢
        <;>
        ring_nf at h₁ ⊢
        <;>
        norm_num at h₁ ⊢
        <;>
        omega
      })
    <;>
    (try
      {
        ring_nf at h₁ ⊢
        <;>
        norm_num at h₁ ⊢
        <;>
        omega
      })
  
  have h₃ : x = 575 := by
    norm_num at h₂ ⊢
    <;>
    (try omega) <;>
    (try
      {
        ring_nf at h₂ ⊢
        <;>
        norm_num at h₂ ⊢
        <;>
        omega
      })
    <;>
    (try
      {
        ring_nf at h₂ ⊢
        <;>
        norm_num at h₂ ⊢
        <;>
        omega
      })
    <;>
    (try
      {
        ring_nf at h₂ ⊢
        <;>
        norm_num at h₂ ⊢
        <;>
        omega
      })
  
  apply h₃
