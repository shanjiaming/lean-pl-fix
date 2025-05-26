/-- The area under the parabola between x=1 and x=3 is 44/3 -/
theorem area_under_parabola_from_1_to_3 :
  (∫ x in Icc 1 3, parabola_fun x) = 44/3 :=