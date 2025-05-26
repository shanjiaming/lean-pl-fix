theorem eigenvector_preserved_under_commuting_matrix
(lambda : ℂ) (hB : IsEigenvector B u lambda) :
∃ (lambda' : ℂ), IsEigenvector B (A.mulVec u) lambda' :=