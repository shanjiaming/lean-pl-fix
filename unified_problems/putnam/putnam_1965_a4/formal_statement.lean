theorem putnam_1965_a4
{G B : Type*}
[Fintype G] [Nonempty G]
[Fintype B] [Nonempty B]
(dances : G → B → Prop)
(h : (¬∃ b : B, ∀ g : G, dances g b) ∧ ∀ g : G, ∃ b : B, dances g b)
: ∃ g h : G, ∃ b c : B, dances g b ∧ dances h c ∧ ¬dances h b ∧ ¬dances g c := by