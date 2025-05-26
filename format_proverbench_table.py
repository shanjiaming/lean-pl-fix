import pandas as pd
from tabulate import tabulate

def format_proverbench_table():
    """
    Read the CSV and format it nicely with tabulate
    """
    # Read the CSV
    df = pd.read_csv('proverbench_results_table.csv')
    
    # Rename columns for better display
    df.columns = [
        'Benchmark', 'Step', 'Sanity', 'Unigram\nSolved?', 'Overall\nSuccess',
        'norm_num', 'linarith', 'nlinarith', 'omega', 'ring', 
        'ring_nf', 'simp', 'simpa', 'field_simp'
    ]
    
    print("Proverbench Pipeline Results")
    print("=" * 120)
    print()
    print("Legend:")
    print("  Sanity: 1=pass, 0=fail")
    print("  Unigram Solved: 1=solved, 0=not solved, -1=sanity check failed, -2=technical skip")
    print("  Overall Success: 1=problem solved, 0=problem failed")
    print("  Tactics: 1=succeeded, 0=failed, -1=sanity check failed, -2=not tried")
    print()
    
    # Format the table
    table = tabulate(df, headers='keys', tablefmt='grid', showindex=False)
    print(table)
    
    print("\nSummary:")
    print(f"- Total problems: {df['Benchmark'].nunique()}")
    print(f"- Total steps: {len(df)}")
    print(f"- Problems with overall success: {df['Overall\\nSuccess'].sum()}")
    print(f"- Steps with sanity check pass: {df['Sanity'].sum()}")
    print(f"- Steps solved by unigram tactics: {(df['Unigram\\nSolved?'] == 1).sum()}")

if __name__ == "__main__":
    format_proverbench_table() 