import pandas as pd

def create_sample_table():
    """
    Create a sample table showing the first few rows for each problem
    """
    # Read the CSV
    df = pd.read_csv('proverbench_results_table.csv')
    
    print("Proverbench Pipeline Results Table (Sample)")
    print("=" * 120)
    print()
    print("Legend:")
    print("  sanity: 1=pass, 0=fail")
    print("  unigram_solved: 1=solved, 0=not solved, -1=sanity check failed, -2=technical skip")
    print("  overall_success: 1=problem solved, 0=problem failed")
    print("  tactics: 1=succeeded, 0=failed, -1=sanity check failed, -2=not tried")
    print()
    
    # Show first 3 rows of each problem type
    sample_rows = []
    
    # Failed problems (no decomposition)
    failed_probs = df[df['step'] == 'N/A'].head(2)
    sample_rows.extend(failed_probs.values.tolist())
    
    # Problem with steps but all failed sanity check
    sanity_failed = df[df['benchmark'] == 'aime_2024i_p13'].head(3)
    sample_rows.extend(sanity_failed.values.tolist())
    
    # Problem with successful steps
    successful = df[df['benchmark'] == 'aime_2025i_p1'].head(3)
    sample_rows.extend(successful.values.tolist())
    
    # Create sample DataFrame
    sample_df = pd.DataFrame(sample_rows, columns=df.columns)
    
    # Display the sample table
    print("Sample rows (showing different types of results):")
    print("-" * 120)
    print(f"{'benchmark':<16} {'step':<12} {'sanity':<6} {'unigram_solved':<15} {'overall_success':<15} {'norm_num':<8} {'linarith':<9} {'nlinarith':<10} {'omega':<6} {'ring':<5} {'ring_nf':<8} {'simp':<5} {'simpa':<6} {'field_simp':<10}")
    print("-" * 120)
    
    for _, row in sample_df.iterrows():
        print(f"{row['benchmark']:<16} {str(row['step']):<12} {row['sanity']:<6} {row['unigram_solved']:<15} {row['overall_success']:<15} {row['norm_num']:<8} {row['linarith']:<9} {row['nlinarith']:<10} {row['omega']:<6} {row['ring']:<5} {row['ring_nf']:<8} {row['simp']:<5} {row['simpa']:<6} {row['field_simp']:<10}")
    
    print("-" * 120)
    print()
    print("Full table has been saved to 'proverbench_results_table.csv'")
    print(f"Total rows in full table: {len(df)}")

if __name__ == "__main__":
    create_sample_table() 