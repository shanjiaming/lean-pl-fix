/-- Lemma 1: Rewrite a_n as (1 + (2/3)^n) / (3 * (1 - (2/3)^(n+1))) -/
lemma sequence_rewrite (n : ℕ) : a_n n = (1 + (2/3)^n) / (3 * (1 - (2/3)^(n+1))) :=