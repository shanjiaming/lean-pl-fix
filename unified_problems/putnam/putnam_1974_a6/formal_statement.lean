theorem putnam_1974_a6
(hdivnallx : Polynomial ℤ → Prop)
(hdivnallx_def : hdivnallx = fun f => Monic f ∧ (∀ x : ℤ, (10^6 : ℤ) ∣ f.eval x))
: sInf {d : ℕ | ∃ f : Polynomial ℤ, hdivnallx f ∧ d = f.natDegree} = ((25) : ℕ ) := by