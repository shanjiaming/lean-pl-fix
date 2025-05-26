/-- Lemma: Scalar multiplication distributes over matrix-vector multiplication -/
lemma mulVec_smul (A : Matrix n n R) (k : R) (x : n → R) :
A.mulVec (k • x) = k • (A.mulVec x) :=