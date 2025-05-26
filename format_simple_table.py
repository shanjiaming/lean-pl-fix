import pandas as pd

def format_simple_table():
    """
    Read the CSV and format it in a simple table
    """
    # Read the CSV
    df = pd.read_csv('proverbench_results_table.csv')
    
    print("Proverbench Pipeline Results Table")
    print("=" * 100)
    print()
    print("Legend:")
    print("  sanity: 1=pass, 0=fail")
    print("  unigram_solved: 1=solved, 0=not solved, -1=sanity check failed, -2=technical skip")
    print("  overall_success: 1=problem solved, 0=problem failed")
    print("  tactics: 1=succeeded, 0=failed, -1=sanity check failed, -2=not tried")
    print()
    
    # Display with basic formatting
    pd.set_option('display.max_columns', None)
    pd.set_option('display.width', None)
    pd.set_option('display.max_colwidth', 15)
    
    print(df.to_string(index=False))
    
    print("\n" + "=" * 100)
    print("Summary Statistics:")
    print(f"- Total problems: {df['benchmark'].nunique()}")
    print(f"- Total steps: {len(df)}")
    print(f"- Problems with overall success: {df['overall_success'].sum()}")
    print(f"- Steps with sanity check pass: {df['sanity'].sum()}")
    print(f"- Steps solved by unigram tactics: {(df['unigram_solved'] == 1).sum()}")
    
    # Problem breakdown
    print("\nProblem Status:")
    for problem in df['benchmark'].unique():
        prob_data = df[df['benchmark'] == problem]
        overall_success = prob_data['overall_success'].iloc[0]
        status = "SUCCESS" if overall_success == 1 else "FAILED"
        
        if 'N/A' in prob_data['step'].values:
            reason = "No decomposition generated"
        elif prob_data['sanity'].sum() == 0:
            reason = "All steps failed sanity check"
        else:
            reason = "Steps generated but not solved"
            
        print(f"  {problem}: {status} ({reason})")

if __name__ == "__main__":
    format_simple_table() 