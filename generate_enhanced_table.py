#!/usr/bin/env python3
"""
Enhanced table generator for proverbench pipeline results.
Addresses the issues:
1. Better display of problem-level status (整题状态)
2. Correct sanity check logic (sanity check逻辑)
3. Error information display (错误信息显示)
"""

import json
import pandas as pd
import numpy as np
from typing import Dict, List, Any, Optional

def load_json_data(file_path: str) -> List[Dict]:
    """Load and parse JSON data."""
    with open(file_path, 'r', encoding='utf-8') as f:
        return json.load(f)

def extract_problem_overview(problem_data: Dict) -> Dict:
    """Extract problem-level overview information."""
    problem_id = problem_data['problem_id']
    status = problem_data.get('status', 'unknown')
    
    # Handle different problem statuses
    if status == 'error':
        return {
            'problem_id': problem_id,
            'status': 'ERROR',
            'error_reason': problem_data.get('error', 'Unknown error'),
            'total_steps': 0,
            'sanity_passed_steps': 0,
            'solved_steps': 0,
            'original_verification_pass': 0,
            'synthesized_verification_pass': 0,
            'decomposition_success': 0,
            'all_sanity_steps_have_tactic_success': 0  # 属性b
        }
    
    elif status == 'success' and 'detailed_steps' in problem_data:
        steps = problem_data['detailed_steps']
        total_steps = len(steps)
        sanity_passed_steps = sum(1 for step in steps if step['additional_info']['sanity_check_pass'])
        solved_steps = sum(1 for step in steps 
                          if step['additional_info']['sanity_check_pass'] and 
                             len(step['additional_info']['successful_tactics']) > 0)
        
        # Calculate 属性b: 是否所有子步都通过sanity check并且所有子步都至少有一个tactic成功
        if total_steps == 0:
            # 如果没有子步，则属性b为0
            all_sanity_steps_have_tactic_success = 0
        else:
            # 检查所有子步是否都通过sanity check并且都至少有一个tactic成功
            all_sanity_pass = all(step['additional_info']['sanity_check_pass'] for step in steps)
            all_have_tactic_success = all(
                step['additional_info']['sanity_check_pass'] and 
                len(step['additional_info']['successful_tactics']) > 0 
                for step in steps
            )
            all_sanity_steps_have_tactic_success = 1 if all_sanity_pass and all_have_tactic_success else 0
        
        # Check if problem was overall successful
        original_pass = problem_data.get('original_verification_pass', False)
        synthesized_pass = problem_data.get('synthesized_verification_pass', False)
        
        return {
            'problem_id': problem_id,
            'status': 'SUCCESS',
            'error_reason': None,
            'total_steps': total_steps,
            'sanity_passed_steps': sanity_passed_steps,
            'solved_steps': solved_steps,
            'original_verification_pass': 1 if original_pass else 0,
            'synthesized_verification_pass': 1 if synthesized_pass else 0,
            'decomposition_success': 1,
            'all_sanity_steps_have_tactic_success': all_sanity_steps_have_tactic_success  # 属性b
        }
    
    else:
        return {
            'problem_id': problem_id,
            'status': 'UNKNOWN',
            'error_reason': f'Unexpected status: {status}',
            'total_steps': 0,
            'sanity_passed_steps': 0,
            'solved_steps': 0,
            'original_verification_pass': 0,
            'synthesized_verification_pass': 0,
            'decomposition_success': 0,
            'all_sanity_steps_have_tactic_success': 0  # 属性b
        }

def extract_step_details(problem_data: Dict) -> List[Dict]:
    """Extract step-level details."""
    if problem_data.get('status') != 'success' or 'detailed_steps' not in problem_data:
        return []
    
    problem_id = problem_data['problem_id']
    steps_data = []
    
    for step in problem_data['detailed_steps']:
        step_info = step['additional_info']
        
        # Basic step information
        step_row = {
            'problem_id': problem_id,
            'step_id': step['step_id'],
            'sanity_check_pass': step_info['sanity_check_pass'],
            'hole_verification_pass': step['hole_verification_pass'],
            'filled_verification_pass': step['filled_verification_pass']
        }
        
        # 属性a: 对于通过sanity check的小题，是否至少有一个tactic成功
        if step_info['sanity_check_pass']:
            has_tactic_success = len(step_info['successful_tactics']) > 0
            step_row['has_tactic_success'] = 1 if has_tactic_success else 0  # 属性a
            
            # Assert: has_tactic_success在非-1的情况下就是filled_verification_pass
            assert step_row['has_tactic_success'] == (1 if step['filled_verification_pass'] else 0), \
                f"Assertion failed for {problem_id} {step['step_id']}: has_tactic_success={step_row['has_tactic_success']}, filled_verification_pass={step['filled_verification_pass']}"
        else:
            step_row['has_tactic_success'] = -1  # 未通过sanity check，属性a不适用
        
        # Unigram solving status
        if not step_info['sanity_check_pass']:
            step_row['unigram_solved'] = -1  # Sanity check failed
        elif len(step_info['successful_tactics']) > 0:
            step_row['unigram_solved'] = 1   # Solved
        else:
            step_row['unigram_solved'] = 0   # Not solved but sanity passed
        
        # Individual tactic results
        tactics = ['norm_num', 'linarith', 'nlinarith', 'omega', 'ring', 'ring_nf', 'simp', 'simpa', 'field_simp']
        
        for tactic in tactics:
            if not step_info['sanity_check_pass']:
                step_row[tactic] = -1  # Sanity check failed
            elif tactic in step_info['successful_tactics']:
                step_row[tactic] = 1   # Success
            elif tactic in step_info['failed_tactics']:
                step_row[tactic] = 0   # Failed
            else:
                step_row[tactic] = -2  # Not tried
        
        steps_data.append(step_row)
    
    return steps_data

def create_enhanced_table(json_file_path: str) -> pd.DataFrame:
    """Create enhanced table with problem overview and step details."""
    data = load_json_data(json_file_path)
    
    all_rows = []
    
    for problem_data in data:
        problem_overview = extract_problem_overview(problem_data)
        
        # Add problem overview row
        overview_row = {
            'type': 'PROBLEM_OVERVIEW',
            'problem_id': problem_overview['problem_id'],
            'step_id': 'OVERVIEW',
            'status': problem_overview['status'],
            'error_reason': problem_overview['error_reason'],
            'total_steps': problem_overview['total_steps'],
            'sanity_passed_steps': problem_overview['sanity_passed_steps'],
            'solved_steps': problem_overview['solved_steps'],
            'original_verification_pass': problem_overview['original_verification_pass'],
            'synthesized_verification_pass': problem_overview['synthesized_verification_pass'],
            'decomposition_success': problem_overview['decomposition_success'],
            'all_sanity_steps_have_tactic_success': problem_overview['all_sanity_steps_have_tactic_success'],  # 属性b
            'sanity_check_pass': None,
            'hole_verification_pass': None,  # 步骤级别属性，在概览行为None
            'filled_verification_pass': None,  # 步骤级别属性，在概览行为None
            'has_tactic_success': None,  # 属性a (在overview中为None)
            'unigram_solved': None,
        }
        
        # Initialize tactic columns for overview row
        tactics = ['norm_num', 'linarith', 'nlinarith', 'omega', 'ring', 'ring_nf', 'simp', 'simpa', 'field_simp']
        for tactic in tactics:
            overview_row[tactic] = None
        
        all_rows.append(overview_row)
        
        # Add step detail rows
        step_details = extract_step_details(problem_data)
        for step in step_details:
            step_row = {
                'type': 'STEP_DETAIL',
                'problem_id': step['problem_id'],
                'step_id': step['step_id'],
                'status': None,
                'error_reason': None,
                'total_steps': None,
                'sanity_passed_steps': None,
                'solved_steps': None,
                'original_verification_pass': None,  # 不在步骤行显示
                'synthesized_verification_pass': None,  # 不在步骤行显示
                'decomposition_success': None,
                'all_sanity_steps_have_tactic_success': None,  # 属性b (在step detail中为None)
                'sanity_check_pass': 1 if step['sanity_check_pass'] else 0,
                'hole_verification_pass': 1 if step['hole_verification_pass'] else 0,
                'filled_verification_pass': 1 if step['filled_verification_pass'] else 0,
                'has_tactic_success': step['has_tactic_success'],  # 属性a
                'unigram_solved': step['unigram_solved'],
            }
            
            # Add tactic results
            for tactic in tactics:
                step_row[tactic] = step[tactic]
            
            all_rows.append(step_row)
    
    return pd.DataFrame(all_rows)

def add_statistics_rows(df: pd.DataFrame) -> pd.DataFrame:
    """Add statistics rows to the dataframe."""
    # Separate step details for statistics calculation
    step_details = df[df['type'] == 'STEP_DETAIL'].copy()
    problem_overviews = df[df['type'] == 'PROBLEM_OVERVIEW'].copy()
    
    if len(step_details) == 0:
        return df
    
    # Calculate statistics
    total_problems = len(problem_overviews)
    total_steps = len(step_details)
    
    # Problem-level statistics
    original_success_problems = len(problem_overviews[problem_overviews['original_verification_pass'] == 1])
    synthesized_success_problems = len(problem_overviews[problem_overviews['synthesized_verification_pass'] == 1])
    overall_success_problems = len(problem_overviews[
        (problem_overviews['original_verification_pass'] == 1) | 
        (problem_overviews['synthesized_verification_pass'] == 1)
    ])
    
    # 属性b统计：有多少问题的所有sanity passed步骤都至少有一个tactic成功
    all_sanity_tactic_success_problems = len(problem_overviews[problem_overviews['all_sanity_steps_have_tactic_success'] == 1])
    all_sanity_tactic_success_rate = all_sanity_tactic_success_problems / total_problems if total_problems > 0 else 0
    
    original_success_rate = original_success_problems / total_problems if total_problems > 0 else 0
    synthesized_success_rate = synthesized_success_problems / total_problems if total_problems > 0 else 0
    overall_success_rate = overall_success_problems / total_problems if total_problems > 0 else 0
    
    # Step-level statistics  
    sanity_passed_steps = len(step_details[step_details['sanity_check_pass'] == 1])
    sanity_pass_rate = sanity_passed_steps / total_steps if total_steps > 0 else 0
    
    solved_steps = len(step_details[step_details['unigram_solved'] == 1])
    unigram_solve_rate = solved_steps / total_steps if total_steps > 0 else 0
    
    # 属性a统计：有多少sanity passed步骤至少有一个tactic成功
    sanity_passed_step_details = step_details[step_details['sanity_check_pass'] == 1]
    if len(sanity_passed_step_details) > 0:
        tactic_success_steps = len(sanity_passed_step_details[sanity_passed_step_details['has_tactic_success'] == 1])
        tactic_success_rate_sanity = tactic_success_steps / len(sanity_passed_step_details)
    else:
        tactic_success_rate_sanity = 0
    
    # Tactic success rates
    tactics = ['norm_num', 'linarith', 'nlinarith', 'omega', 'ring', 'ring_nf', 'simp', 'simpa', 'field_simp']
    tactic_stats = {}
    
    for tactic in tactics:
        # Overall tactic success rate
        total_attempts = len(step_details[step_details[tactic].isin([0, 1])])
        successful_attempts = len(step_details[step_details[tactic] == 1])
        tactic_stats[tactic] = successful_attempts / total_attempts if total_attempts > 0 else 0
    
    # For "good sketch only", filter problems by all_sanity_steps_have_tactic_success==1
    good_problems = problem_overviews[problem_overviews['all_sanity_steps_have_tactic_success'] == 1]
    good_problems_count = len(good_problems)
    
    # Problem-level statistics for good problems only
    if good_problems_count > 0:
        good_original_success_rate = (good_problems['original_verification_pass'] == 1).mean()
        good_synthesized_success_rate = (good_problems['synthesized_verification_pass'] == 1).mean()
        good_all_sanity_tactic_success_rate = (good_problems['all_sanity_steps_have_tactic_success'] == 1).mean()  # 应该是1.0
    else:
        good_original_success_rate = 0
        good_synthesized_success_rate = 0
        good_all_sanity_tactic_success_rate = 0
    
    # Step-level statistics for good steps only (sanity passed steps)
    good_steps = step_details[step_details['sanity_check_pass'] == 1]
    
    # For good problems, get all steps from those problems
    if good_problems_count > 0:
        good_problem_ids = good_problems['problem_id'].tolist()
        good_steps_from_good_problems = step_details[step_details['problem_id'].isin(good_problem_ids)]
        # Filter to only sanity passed steps from good problems
        good_steps_from_good_problems_sanity = good_steps_from_good_problems[good_steps_from_good_problems['sanity_check_pass'] == 1]
        
        # Calculate tactic stats for steps from good problems
        good_problem_tactic_stats = {}
        for tactic in tactics:
            good_problem_attempts = len(good_steps_from_good_problems_sanity[good_steps_from_good_problems_sanity[tactic].isin([0, 1])])
            good_problem_successful = len(good_steps_from_good_problems_sanity[good_steps_from_good_problems_sanity[tactic] == 1])
            good_problem_tactic_stats[tactic] = good_problem_successful / good_problem_attempts if good_problem_attempts > 0 else 0
    else:
        good_steps_from_good_problems_sanity = pd.DataFrame()
        good_problem_tactic_stats = {tactic: 0 for tactic in tactics}
    
    stats_row_overall = {
        'type': 'STATISTICS',
        'problem_id': 'OVERALL_STATS',
        'step_id': 'percentage',
        'status': None,
        'error_reason': None,
        'total_steps': total_steps,
        'sanity_passed_steps': sanity_passed_steps,
        'solved_steps': solved_steps,
        'original_verification_pass': original_success_rate,
        'synthesized_verification_pass': synthesized_success_rate,
        'decomposition_success': None,
        'all_sanity_steps_have_tactic_success': all_sanity_tactic_success_rate,  # 属性b统计
        'sanity_check_pass': sanity_pass_rate,
        'hole_verification_pass': None,  # 步骤级别统计，在overall stats中不适用
        'filled_verification_pass': None,  # 步骤级别统计，在overall stats中不适用
        'has_tactic_success': None,  # 删除
        'unigram_solved': None,  # 删除
    }
    
    for tactic in tactics:
        stats_row_overall[tactic] = None  # 删除所有tactic统计
        print(f"Overall tactic success rate for {tactic}: {tactic_stats[tactic]:.2%}")
    
    # For "good sketch only" stats:
    # - Problem-level: only problems with all_sanity_steps_have_tactic_success==1
    # - Step-level: ALL sanity_check_pass==1 steps (regardless of which problem they come from)
    all_sanity_passed_steps = step_details[step_details['sanity_check_pass'] == 1]  # 所有sanity通过的步骤
    
    # Calculate tactic stats for all sanity passed steps
    all_sanity_tactic_stats = {}
    for tactic in tactics:
        all_sanity_attempts = len(all_sanity_passed_steps[all_sanity_passed_steps[tactic].isin([0, 1])])
        all_sanity_successful = len(all_sanity_passed_steps[all_sanity_passed_steps[tactic] == 1])
        all_sanity_tactic_stats[tactic] = all_sanity_successful / all_sanity_attempts if all_sanity_attempts > 0 else 0
    
    stats_row_good = {
        'type': 'STATISTICS',
        'problem_id': 'GOOD_SKETCHES_STATS',
        'step_id': 'percentage (good sketch only)',
        'status': None,
        'error_reason': None,
        'total_steps': len(all_sanity_passed_steps),  # 所有sanity通过的步骤数
        'sanity_passed_steps': len(all_sanity_passed_steps),  # 都是sanity通过的
        'solved_steps': len(all_sanity_passed_steps[all_sanity_passed_steps['unigram_solved'] == 1]) if len(all_sanity_passed_steps) > 0 else 0,
        'original_verification_pass': good_original_success_rate,  # 只统计all_sanity_steps_have_tactic_success==1的问题
        'synthesized_verification_pass': good_synthesized_success_rate,  # 只统计all_sanity_steps_have_tactic_success==1的问题
        'decomposition_success': None,
        'all_sanity_steps_have_tactic_success': good_all_sanity_tactic_success_rate,  # 只统计all_sanity_steps_have_tactic_success==1的问题
        'sanity_check_pass': 1.0,  # 都是sanity通过的，所以是1.0
        'hole_verification_pass': (all_sanity_passed_steps['hole_verification_pass'] == 1).mean() if len(all_sanity_passed_steps) > 0 else 0,  # 所有sanity通过步骤的hole验证率
        'filled_verification_pass': (all_sanity_passed_steps['filled_verification_pass'] == 1).mean() if len(all_sanity_passed_steps) > 0 else 0,  # 所有sanity通过步骤的filled验证率
        'has_tactic_success': (all_sanity_passed_steps['has_tactic_success'] == 1).mean() if len(all_sanity_passed_steps) > 0 else 0,  # 所有sanity通过步骤的tactic成功率
        'unigram_solved': (all_sanity_passed_steps['unigram_solved'] == 1).mean() if len(all_sanity_passed_steps) > 0 else 0,  # 所有sanity通过步骤的解决率
    }
    
    for tactic in tactics:
        stats_row_good[tactic] = all_sanity_tactic_stats[tactic]
    
    # Add statistics rows to dataframe
    df_with_stats = pd.concat([
        df,
        pd.DataFrame([stats_row_overall]),
        pd.DataFrame([stats_row_good])
    ], ignore_index=True)
    
    return df_with_stats

def format_enhanced_table(df: pd.DataFrame) -> str:
    """Format the enhanced table for display."""
    output_lines = []
    
    current_problem = None
    for _, row in df.iterrows():
        if row['type'] == 'PROBLEM_OVERVIEW':
            current_problem = row['problem_id']
            output_lines.append(f"\n=== PROBLEM: {current_problem} ===")
            output_lines.append(f"Status: {row['status']}")
            if row['error_reason']:
                output_lines.append(f"Error: {row['error_reason']}")
            if row['status'] != 'ERROR':
                output_lines.append(f"Total steps: {row['total_steps']}")
                output_lines.append(f"Sanity passed: {row['sanity_passed_steps']}")
                output_lines.append(f"Solved steps: {row['solved_steps']}")
                output_lines.append(f"All sanity steps have tactic success (属性b): {'YES' if row['all_sanity_steps_have_tactic_success'] else 'NO'}")
                output_lines.append(f"Original verification: {'YES' if row['original_verification_pass'] else 'NO'}")
                output_lines.append(f"Synthesized verification: {'YES' if row['synthesized_verification_pass'] else 'NO'}")
        
        elif row['type'] == 'STEP_DETAIL':
            sanity = '✓' if row['sanity_check_pass'] else '✗'
            hole_pass = '✓' if row['hole_verification_pass'] else '✗'
            filled_pass = '✓' if row['filled_verification_pass'] else '✗'
            solved = '✓' if row['unigram_solved'] == 1 else ('✗' if row['unigram_solved'] == 0 else 'N/A')
            tactic_success = ('✓' if row['has_tactic_success'] == 1 else 
                            ('✗' if row['has_tactic_success'] == 0 else 'N/A'))
            output_lines.append(f"  {row['step_id']}: sanity={sanity}, hole_pass={hole_pass}, filled_pass={filled_pass}, tactic_success(属性a)={tactic_success}, solved={solved}")
        
        elif row['type'] == 'STATISTICS':
            output_lines.append(f"\n=== {row['problem_id']} ===")
            output_lines.append(f"Original verification success rate: {row['original_verification_pass']:.2%}")
            output_lines.append(f"Synthesized verification success rate: {row['synthesized_verification_pass']:.2%}")
            output_lines.append(f"All sanity steps have tactic success rate (属性b): {row['all_sanity_steps_have_tactic_success']:.2%}")
            output_lines.append(f"Step sanity pass rate: {row['sanity_check_pass']:.2%}")
            if row['hole_verification_pass'] is not None:
                output_lines.append(f"Hole verification pass rate: {row['hole_verification_pass']:.2%}")
            if row['filled_verification_pass'] is not None:
                output_lines.append(f"Filled verification pass rate: {row['filled_verification_pass']:.2%}")
            output_lines.append(f"Sanity passed steps tactic success rate (属性a): {row['has_tactic_success']:.2%}")
            output_lines.append(f"Unigram solve rate: {row['unigram_solved']:.2%}")
    
    return '\n'.join(output_lines)

def main():
    json_file_path = "decomposition_results/proverbench_pipeline_results.json"
    
    print("生成增强版proverbench结果表格...")
    
    # Create enhanced table
    df = create_enhanced_table(json_file_path)
    
    # Add statistics
    df_with_stats = add_statistics_rows(df)
    
    # Save to CSV
    output_csv = "proverbench_enhanced_results_table.csv"
    df_with_stats.to_csv(output_csv, index=False)
    print(f"✓ 增强版表格已保存到: {output_csv}")
    
    # Display formatted summary
    formatted_output = format_enhanced_table(df_with_stats)
    print("\n" + "="*50)
    print("SUMMARY:")

    # 只打印最后100行
    print("最后100行：")
    print(formatted_output.split("\n")[-100:])
    
    # Print CSV info
    print(f"\n表格包含 {len(df_with_stats)} 行，包括:")
    print(f"- 问题概览行: {len(df_with_stats[df_with_stats['type'] == 'PROBLEM_OVERVIEW'])}")
    print(f"- 步骤详情行: {len(df_with_stats[df_with_stats['type'] == 'STEP_DETAIL'])}")
    print(f"- 统计行: {len(df_with_stats[df_with_stats['type'] == 'STATISTICS'])}")

if __name__ == "__main__":
    main() 