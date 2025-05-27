import json
import pandas as pd

def process_proverbench_results(json_file_path):
    """
    Process proverbench pipeline results and generate a detailed table.
    """
    with open(json_file_path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    rows = []
    tactics = ['norm_num', 'linarith', 'nlinarith', 'omega', 'ring', 'ring_nf', 'simp', 'simpa', 'field_simp']
    
    for problem in data:
        problem_id = problem['problem_id']
        overall_success = 1 if problem.get('status') == 'success' else 0
        
        # If no detailed steps, create a single row indicating the problem failed
        if 'detailed_steps' not in problem or not problem['detailed_steps']:
            row = {
                'benchmark': problem_id,
                'step': 'N/A',
                'sanity': 0,
                'unigram_solved': -2,  # Technical skip
                'overall_success': overall_success
            }
            for tactic in tactics:
                row[tactic] = -2  # Technical skip
            rows.append(row)
            continue
        
        # Process each step
        for step in problem['detailed_steps']:
            step_id = step['step_id']
            
            # Extract sanity check pass - check if additional_info exists and has sanity_check_pass
            additional_info = step.get('additional_info', {})
            sanity_pass = additional_info.get('sanity_check_pass', False)
            sanity = 1 if sanity_pass else 0
            
            # Check if step was skipped due to sanity check failure
            skip_reason = additional_info.get('skip_reason', '')
            was_skipped = skip_reason == 'sanity_check_failed'
            
            # Determine unigram solved status
            if was_skipped or not sanity_pass:
                unigram_solved = -1  # Sanity check failed
            else:
                # Check if any tactic was successful
                successful_tactics = additional_info.get('successful_tactics', [])
                if successful_tactics:
                    unigram_solved = 1  # Solved
                else:
                    unigram_solved = 0  # Not solved
            
            # Create row
            row = {
                'benchmark': problem_id,
                'step': step_id,
                'sanity': sanity,
                'unigram_solved': unigram_solved,
                'overall_success': overall_success
            }
            
            # Process each tactic
            tactics_tried = additional_info.get('tactics_tried', [])
            successful_tactics = additional_info.get('successful_tactics', [])
            failed_tactics = additional_info.get('failed_tactics', [])
            
            for tactic in tactics:
                if was_skipped or not sanity_pass:
                    row[tactic] = -1  # Sanity check failed
                elif tactic in successful_tactics:
                    row[tactic] = 1  # Tactic succeeded
                elif tactic in failed_tactics:
                    row[tactic] = 0  # Tactic failed
                elif tactic in tactics_tried:
                    row[tactic] = 0  # Tactic was tried but not listed as successful
                else:
                    row[tactic] = -2  # Tactic not tried (technical skip)
            
            rows.append(row)
    
    # Create DataFrame
    df = pd.DataFrame(rows)
    
    # Reorder columns
    column_order = ['benchmark', 'step', 'sanity', 'unigram_solved', 'overall_success'] + tactics
    df = df[column_order]
    
    return df

def calculate_statistics(df):
    """
    Calculate percentage statistics for the table
    """
    tactics = ['norm_num', 'linarith', 'nlinarith', 'omega', 'ring', 'ring_nf', 'simp', 'simpa', 'field_simp']
    
    # Calculate overall statistics
    total_steps = len(df)
    total_problems = df['benchmark'].nunique()
    
    # Overall problem success rate
    problem_success_rate = df.groupby('benchmark')['overall_success'].first().mean()
    
    # Sanity check pass rate
    sanity_pass_rate = (df['sanity'] == 1).mean()
    
    # Unigram solved rate (only counting cases where sanity passed or failed, not technical skips)
    valid_unigram = df[df['unigram_solved'].isin([0, 1, -1])]
    unigram_success_rate = (valid_unigram['unigram_solved'] == 1).mean() if len(valid_unigram) > 0 else 0
    
    # Overall tactic success rates
    tactic_stats = {}
    for tactic in tactics:
        # Count all attempted cases (success=1, failure=0, don't count -1 sanity fails or -2 not tried)
        attempted = df[df[tactic].isin([0, 1])]
        if len(attempted) > 0:
            tactic_stats[tactic] = (attempted[tactic] == 1).mean()
        else:
            tactic_stats[tactic] = 0
    
    # Calculate "good sketch only" statistics (only sanity check passed steps)
    good_sketch_df = df[df['sanity'] == 1]
    
    if len(good_sketch_df) > 0:
        # Sanity rate for good sketches (always 1.0)
        good_sanity_rate = 1.0
        
        # Unigram solved rate for good sketches
        good_unigram_rate = (good_sketch_df['unigram_solved'] == 1).mean()
        
        # Tactic success rates for good sketches
        good_tactic_stats = {}
        for tactic in tactics:
            attempted = good_sketch_df[good_sketch_df[tactic].isin([0, 1])]
            if len(attempted) > 0:
                good_tactic_stats[tactic] = (attempted[tactic] == 1).mean()
            else:
                good_tactic_stats[tactic] = 0
    else:
        good_sanity_rate = 0
        good_unigram_rate = 0
        good_tactic_stats = {tactic: 0 for tactic in tactics}
    
    return {
        'overall': {
            'problem_success': problem_success_rate,
            'sanity': sanity_pass_rate,
            'unigram_solved': unigram_success_rate,
            'tactics': tactic_stats
        },
        'good_sketch': {
            'problem_success': problem_success_rate,  # Same as overall
            'sanity': good_sanity_rate,
            'unigram_solved': good_unigram_rate,
            'tactics': good_tactic_stats
        }
    }

def add_statistics_rows(df):
    """
    Add percentage statistics rows to the DataFrame
    """
    tactics = ['norm_num', 'linarith', 'nlinarith', 'omega', 'ring', 'ring_nf', 'simp', 'simpa', 'field_simp']
    stats = calculate_statistics(df)
    
    # Create percentage row
    percentage_row = {
        'benchmark': 'percentage',
        'step': '',
        'sanity': f"{stats['overall']['sanity']:.4f}",
        'unigram_solved': f"{stats['overall']['unigram_solved']:.4f}",
        'overall_success': f"{stats['overall']['problem_success']:.4f}"
    }
    
    for tactic in tactics:
        percentage_row[tactic] = f"{stats['overall']['tactics'][tactic]:.4f}"
    
    # Create good sketch only row
    good_sketch_row = {
        'benchmark': 'percentage (good sketch only)',
        'step': '',
        'sanity': f"{stats['good_sketch']['sanity']:.4f}",
        'unigram_solved': f"{stats['good_sketch']['unigram_solved']:.4f}",
        'overall_success': f"{stats['good_sketch']['problem_success']:.4f}"
    }
    
    for tactic in tactics:
        good_sketch_row[tactic] = f"{stats['good_sketch']['tactics'][tactic]:.4f}"
    
    # Add rows to DataFrame
    stats_df = pd.DataFrame([percentage_row, good_sketch_row])
    
    # Add empty row for separation
    empty_row = {col: '' for col in df.columns}
    empty_row['benchmark'] = ''
    empty_df = pd.DataFrame([empty_row])
    
    # Combine DataFrames
    result_df = pd.concat([df, empty_df, stats_df], ignore_index=True)
    
    return result_df

def main():
    # Process the results
    df = process_proverbench_results('decomposition_results/proverbench_pipeline_results.json')
    
    # Add statistics rows
    df_with_stats = add_statistics_rows(df)
    
    # Display the table
    print("Proverbench Pipeline Results Table")
    print("=" * 100)
    print()
    print("Legend:")
    print("  sanity: 1=pass, 0=fail")
    print("  unigram_solved: 1=solved, 0=not solved, -1=sanity check failed, -2=technical skip")
    print("  overall_success: 1=problem solved, 0=problem failed")
    print("  tactics: 1=succeeded, 0=failed, -1=sanity check failed, -2=not tried")
    print()
    
    # Print with better formatting
    pd.set_option('display.max_columns', None)
    pd.set_option('display.width', None)
    pd.set_option('display.max_colwidth', None)
    
    print(df_with_stats.to_string(index=False))
    
    # Save to CSV
    df_with_stats.to_csv('proverbench_results_table_with_stats.csv', index=False)
    print(f"\nTable with statistics saved to 'proverbench_results_table_with_stats.csv'")
    
    # Summary statistics
    stats = calculate_statistics(df)
    print("\nSummary Statistics:")
    print(f"Total problems: {df['benchmark'].nunique()}")
    print(f"Total steps: {len(df)}")
    print(f"Problem success rate: {stats['overall']['problem_success']:.2%}")
    print(f"Step sanity check pass rate: {stats['overall']['sanity']:.2%}")
    print(f"Unigram solving rate: {stats['overall']['unigram_solved']:.2%}")
    print(f"Unigram solving rate (good sketches only): {stats['good_sketch']['unigram_solved']:.2%}")

if __name__ == "__main__":
    main() 