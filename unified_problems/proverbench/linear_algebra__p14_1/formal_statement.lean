/-- The determinant of a product is the product of determinants. -/
lemma det_product_eq (X Y : Matrix n n K) : det (X * Y) = det X * det Y :=