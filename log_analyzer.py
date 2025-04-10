#!/usr/bin/env python

import os
import json
import glob
from collections import Counter, defaultdict
import statistics
import matplotlib.pyplot as plt
import numpy as np
from tabulate import tabulate
import argparse

# Default log directory path (will be overridden by command line arguments if provided)
DEFAULT_LOG_DIR = "/data/coding/minif2f/lean_fixed"
LOG_DIR = DEFAULT_LOG_DIR

def collect_log_files():
    """Collect all JSON log files"""
    log_pattern = os.path.join(LOG_DIR, "*_fix_log.json")
    return glob.glob(log_pattern)

def parse_log_file(file_path):
    """Parse a single log file and extract statistics"""
    try:
        with open(file_path, 'r') as f:
            data = json.load(f)
        
        # Check basic structure
        if "statistics" not in data:
            print(f"Warning: Missing 'statistics' in {file_path}")
            return None
        
        stats = data["statistics"]
        file_name = os.path.basename(file_path)
        
        return {
            "file_name": file_name,
            "status": data.get("status", "unknown"),
            "original_errors": stats.get("original_errors", 0),
            "fixed_errors": stats.get("fixed_errors", 0),
            "failed_errors": stats.get("failed_errors", 0),
            "remaining_errors": stats.get("remaining_errors", 0),
            "fix_rate": stats.get("fix_rate", 0),
            "successful_fixes": stats.get("successful_fixes", []),
            "failed_fixes": stats.get("failed_fixes", []),
            "total_time": stats.get("total_time", 0),
        }
    except Exception as e:
        print(f"Error parsing {file_path}: {str(e)}")
        return None

def analyze_logs(log_data):
    """Analyze log data and generate statistics"""
    if not log_data:
        return {"error": "No valid log data found"}
    
    # 1. Overall statistics
    total_files = len(log_data)
    total_original_errors = sum(log["original_errors"] for log in log_data)
    total_fixed_errors = sum(log["fixed_errors"] for log in log_data)
    total_failed_errors = sum(log["failed_errors"] for log in log_data)
    total_remaining_errors = sum(log["remaining_errors"] for log in log_data)
    
    # Avoid division by zero if there are no errors
    overall_fix_rate = total_fixed_errors / total_original_errors if total_original_errors > 0 else 0
    
    # Count of fully fixed files (all errors fixed)
    fully_fixed_files = sum(1 for log in log_data if log["remaining_errors"] == 0 and log["original_errors"] > 0)
    
    # Count of partially fixed files (some errors fixed but not all)
    partially_fixed_files = sum(1 for log in log_data 
                               if log["fixed_errors"] > 0 and log["remaining_errors"] > 0)
    
    # Count of completely unfixed files (no errors fixed)
    unfixed_files = sum(1 for log in log_data 
                       if log["fixed_errors"] == 0 and log["original_errors"] > 0)
    
    # Count of files with no errors
    no_error_files = sum(1 for log in log_data if log["original_errors"] == 0)
    
    # 2. Collect fix_snippet distribution
    fix_snippets = []
    for log in log_data:
        for fix in log["successful_fixes"]:
            fix_snippets.append(fix.get("fix_snippet", "unknown"))
    
    snippet_counter = Counter(fix_snippets)
    
    # 3. Statistics by error type
    error_types_fixed = defaultdict(int)
    error_types_failed = defaultdict(int)
    
    for log in log_data:
        for fix in log["successful_fixes"]:
            error_type = fix.get("error_type", "unknown")
            error_types_fixed[error_type] += 1
        
        for fix in log["failed_fixes"]:
            error_type = fix.get("error_type", "unknown")
            error_types_failed[error_type] += 1
    
    # Calculate fix rate for each error type
    error_type_stats = {}
    for error_type in set(error_types_fixed.keys()) | set(error_types_failed.keys()):
        fixed = error_types_fixed[error_type]
        failed = error_types_failed[error_type]
        total = fixed + failed
        fix_rate = fixed / total if total > 0 else 0
        error_type_stats[error_type] = {
            "fixed": fixed,
            "failed": failed,
            "total": total,
            "fix_rate": fix_rate
        }
    
    # 4. Time statistics
    # Overall time
    total_times = [log["total_time"] for log in log_data if log["total_time"] > 0]
    
    # Time for each fix
    fix_times = []
    for log in log_data:
        for fix in log["successful_fixes"]:
            if "fix_time" in fix and fix["fix_time"] > 0:
                fix_times.append(fix["fix_time"])
    
    # Calculate time statistics metrics
    time_stats = {}
    if fix_times:
        time_stats = {
            "min": min(fix_times),
            "max": max(fix_times),
            "mean": statistics.mean(fix_times),
            "median": statistics.median(fix_times),
            "total_fixes": len(fix_times)
        }
        if len(fix_times) > 1:
            time_stats["stdev"] = statistics.stdev(fix_times)
    
    # 5. Fix success rate by time bucket
    time_buckets = defaultdict(lambda: {"success": 0, "total": 0})
    for log in log_data:
        for fix in log["successful_fixes"]:
            if "fix_time" in fix:
                bucket = int(fix["fix_time"])
                time_buckets[bucket]["success"] += 1
                time_buckets[bucket]["total"] += 1
        
        for fix in log["failed_fixes"]:
            if "attempt_time" in fix:
                bucket = int(fix["attempt_time"])
                time_buckets[bucket]["total"] += 1
    
    # Calculate success rate by bucket
    time_success_rates = {
        bucket: {"success": stats["success"], 
                "total": stats["total"], 
                "rate": stats["success"] / stats["total"] if stats["total"] > 0 else 0}
        for bucket, stats in time_buckets.items()
    }
    
    return {
        "summary": {
            "total_files": total_files,
            "no_error_files": no_error_files,
            "fully_fixed_files": fully_fixed_files,
            "partially_fixed_files": partially_fixed_files,
            "unfixed_files": unfixed_files,
            "total_original_errors": total_original_errors,
            "total_fixed_errors": total_fixed_errors,
            "total_failed_errors": total_failed_errors,
            "total_remaining_errors": total_remaining_errors,
            "overall_fix_rate": overall_fix_rate
        },
        "fix_snippets": snippet_counter,
        "error_types": error_type_stats,
        "time_stats": time_stats,
        "time_success_rates": time_success_rates
    }

def print_analysis(analysis):
    """Print analysis results"""
    summary = analysis["summary"]
    print("\n===== Error Fix Statistics Report =====")
    print(f"Total files: {summary['total_files']}")
    print(f"Files with no errors: {summary['no_error_files']}")
    print(f"Fully fixed files: {summary['fully_fixed_files']}")
    print(f"Partially fixed files: {summary['partially_fixed_files']}")
    print(f"Unfixed files: {summary['unfixed_files']}")
    print(f"Total original errors: {summary['total_original_errors']}")
    print(f"Fixed errors: {summary['total_fixed_errors']}")
    print(f"Failed to fix errors: {summary['total_failed_errors']}")
    print(f"Remaining errors: {summary['total_remaining_errors']}")
    print(f"Overall fix rate: {summary['overall_fix_rate']:.2%}")
    
    print("\n===== Fix Snippet Distribution =====")
    snippet_data = [(snippet, count) for snippet, count in analysis["fix_snippets"].most_common()]
    if snippet_data:
        print(tabulate(snippet_data, headers=["Fix Snippet", "Count"], tablefmt="pretty"))
    else:
        print("No successful fixes found.")
    
    print("\n===== Error Type Statistics =====")
    error_type_data = []
    for error_type, stats in sorted(analysis["error_types"].items(), 
                                   key=lambda x: x[1]["total"], reverse=True):
        error_type_data.append([
            error_type, 
            stats["fixed"], 
            stats["failed"], 
            stats["total"],
            f"{stats['fix_rate']:.2%}"
        ])
    
    if error_type_data:
        print(tabulate(error_type_data, 
                     headers=["Error Type", "Fixed", "Failed", "Total", "Fix Rate"],
                     tablefmt="pretty"))
    else:
        print("No error type statistics found.")
    
    print("\n===== Fix Time Statistics =====")
    if analysis["time_stats"]:
        time_stats = analysis["time_stats"]
        print(f"Total fixes: {time_stats['total_fixes']}")
        print(f"Minimum fix time: {time_stats['min']:.2f} seconds")
        print(f"Maximum fix time: {time_stats['max']:.2f} seconds")
        print(f"Average fix time: {time_stats['mean']:.2f} seconds")
        print(f"Median fix time: {time_stats['median']:.2f} seconds")
        if "stdev" in time_stats:
            print(f"Standard deviation: {time_stats['stdev']:.2f} seconds")
    else:
        print("No fix time data found.")

def generate_plots(analysis, output_dir, log_data):
    """Generate visualization charts"""
    try:
        # Ensure output directory exists
        os.makedirs(output_dir, exist_ok=True)
        
        # 1. Pie chart: File fix status distribution
        summary = analysis["summary"]
        labels = ["Fully Fixed", "Partially Fixed", "Unfixed", "No Errors"]
        sizes = [
            summary["fully_fixed_files"],
            summary["partially_fixed_files"],
            summary["unfixed_files"],
            summary["no_error_files"]
        ]
        
        # Remove empty values
        filtered_data = [(label, size) for label, size in zip(labels, sizes) if size > 0]
        if filtered_data:
            plt.figure(figsize=(10, 6))
            plt.pie([x[1] for x in filtered_data], 
                   labels=[x[0] for x in filtered_data], 
                   autopct='%1.1f%%')
            plt.axis('equal')
            plt.title("File Fix Status Distribution")
            plt.savefig(os.path.join(output_dir, "file_fix_status.png"))
            plt.close()
        
        # 2. Bar chart: Error type fix status
        error_types = analysis["error_types"]
        if error_types:
            # Show only the top 15 most common error types
            top_error_types = sorted(error_types.items(), 
                                    key=lambda x: x[1]["total"], 
                                    reverse=True)[:15]
            
            fig, ax = plt.subplots(figsize=(14, 8))
            
            labels = [et for et, _ in top_error_types]
            fixed = [stats["fixed"] for _, stats in top_error_types]
            failed = [stats["failed"] for _, stats in top_error_types]
            
            x = np.arange(len(labels))
            width = 0.35
            
            ax.bar(x - width/2, fixed, width, label='Fixed')
            ax.bar(x + width/2, failed, width, label='Failed')
            
            ax.set_xticks(x)
            ax.set_xticklabels(labels, rotation=45, ha='right')
            ax.legend()
            
            plt.title("Error Type Fix Status")
            plt.tight_layout()
            plt.savefig(os.path.join(output_dir, "error_type_fix_status.png"))
            plt.close()
        
        # 3. Histogram: Fix time distribution
        if analysis["time_stats"]:
            # Collect all fix times
            fix_times = []
            for log in log_data:
                for fix in log["successful_fixes"]:
                    if "fix_time" in fix and fix["fix_time"] > 0:
                        fix_times.append(fix["fix_time"])
            
            if fix_times:
                plt.figure(figsize=(10, 6))
                plt.hist(fix_times, bins=20, alpha=0.7)
                plt.title("Fix Time Distribution")
                plt.xlabel("Time (seconds)")
                plt.ylabel("Frequency")
                plt.savefig(os.path.join(output_dir, "fix_time_distribution.png"))
                plt.close()
        
        # 4. Bar chart: Fix snippet distribution
        snippet_counter = analysis["fix_snippets"]
        if snippet_counter:
            # Show only the top 10 most common fix snippets
            top_snippets = snippet_counter.most_common(10)
            
            labels = [s for s, _ in top_snippets]
            counts = [c for _, c in top_snippets]
            
            plt.figure(figsize=(12, 6))
            plt.bar(range(len(labels)), counts)
            plt.xticks(range(len(labels)), labels, rotation=45, ha='right')
            plt.title("Common Fix Snippet Distribution")
            plt.tight_layout()
            plt.savefig(os.path.join(output_dir, "fix_snippet_distribution.png"))
            plt.close()
            
        print(f"Charts saved to {output_dir} directory")
        
    except Exception as e:
        print(f"Error generating charts: {str(e)}")

def save_report_to_file(analysis, output_file):
    """Save analysis results to a text file"""
    try:
        with open(output_file, 'w') as f:
            # Write summary
            summary = analysis["summary"]
            f.write("\n===== Error Fix Statistics Report =====\n")
            f.write(f"Total files: {summary['total_files']}\n")
            f.write(f"Files with no errors: {summary['no_error_files']}\n")
            f.write(f"Fully fixed files: {summary['fully_fixed_files']}\n")
            f.write(f"Partially fixed files: {summary['partially_fixed_files']}\n")
            f.write(f"Unfixed files: {summary['unfixed_files']}\n")
            f.write(f"Total original errors: {summary['total_original_errors']}\n")
            f.write(f"Fixed errors: {summary['total_fixed_errors']}\n")
            f.write(f"Failed to fix errors: {summary['total_failed_errors']}\n")
            f.write(f"Remaining errors: {summary['total_remaining_errors']}\n")
            f.write(f"Overall fix rate: {summary['overall_fix_rate']:.2%}\n")
            
            # Write fix snippet distribution
            f.write("\n===== Fix Snippet Distribution =====\n")
            snippet_data = [(snippet, count) for snippet, count in analysis["fix_snippets"].most_common()]
            if snippet_data:
                f.write(tabulate(snippet_data, headers=["Fix Snippet", "Count"], tablefmt="grid") + "\n")
            else:
                f.write("No successful fixes found.\n")
            
            # Write error type statistics
            f.write("\n===== Error Type Statistics =====\n")
            error_type_data = []
            for error_type, stats in sorted(analysis["error_types"].items(), 
                                          key=lambda x: x[1]["total"], reverse=True):
                error_type_data.append([
                    error_type, 
                    stats["fixed"], 
                    stats["failed"], 
                    stats["total"],
                    f"{stats['fix_rate']:.2%}"
                ])
            
            if error_type_data:
                f.write(tabulate(error_type_data, 
                               headers=["Error Type", "Fixed", "Failed", "Total", "Fix Rate"],
                               tablefmt="grid") + "\n")
            else:
                f.write("No error type statistics found.\n")
            
            # Write fix time statistics
            f.write("\n===== Fix Time Statistics =====\n")
            if analysis["time_stats"]:
                time_stats = analysis["time_stats"]
                f.write(f"Total fixes: {time_stats['total_fixes']}\n")
                f.write(f"Minimum fix time: {time_stats['min']:.2f} seconds\n")
                f.write(f"Maximum fix time: {time_stats['max']:.2f} seconds\n")
                f.write(f"Average fix time: {time_stats['mean']:.2f} seconds\n")
                f.write(f"Median fix time: {time_stats['median']:.2f} seconds\n")
                if "stdev" in time_stats:
                    f.write(f"Standard deviation: {time_stats['stdev']:.2f} seconds\n")
            else:
                f.write("No fix time data found.\n")
            
        print(f"Analysis report saved to {output_file}")
    except Exception as e:
        print(f"Error saving report to file: {str(e)}")

def save_json_report(analysis, output_file):
    """Save analysis results to a JSON file"""
    try:
        # Convert any non-serializable objects to strings or numbers
        json_safe_analysis = analysis.copy()
        
        # Ensure Counter objects are converted to dict
        json_safe_analysis["fix_snippets"] = dict(analysis["fix_snippets"])
        
        with open(output_file, 'w') as f:
            json.dump(json_safe_analysis, f, indent=2)
        
        print(f"JSON report saved to {output_file}")
    except Exception as e:
        print(f"Error saving JSON report: {str(e)}")

def main():
    """Main function to execute the script with command-line arguments"""
    # Setup argument parser
    parser = argparse.ArgumentParser(description='Analyze Lean fix log files')
    parser.add_argument('--input-dir', '-i', type=str, required=False,
                        default=DEFAULT_LOG_DIR,
                        help=f'Directory containing JSON log files to analyze (default: {DEFAULT_LOG_DIR})')
    parser.add_argument('--output-dir', '-o', type=str,
                        help='Directory to store analysis results (default: input_dir/analysis)')
    args = parser.parse_args()
    
    # Set global LOG_DIR
    global LOG_DIR
    LOG_DIR = args.input_dir
    
    # Create output directory based on input directory if not specified
    output_dir = args.output_dir
    if not output_dir:
        output_dir = os.path.join(os.path.dirname(args.input_dir), 
                                 f"{os.path.basename(args.input_dir)}_analysis")
    
    # Ensure output directory exists
    os.makedirs(output_dir, exist_ok=True)
    
    print(f"Analyzing fix logs in {LOG_DIR}...")
    log_files = collect_log_files()
    print(f"Found {len(log_files)} log files")
    
    log_data = [parse_log_file(file) for file in log_files]
    log_data = [log for log in log_data if log]  # Filter out invalid logs
    
    if not log_data:
        print("No valid log data found")
        exit(1)
    
    print(f"Successfully parsed {len(log_data)} log files")
    analysis = analyze_logs(log_data)
    
    # Print analysis results to console
    print_analysis(analysis)
    
    # Save text report
    text_report_path = os.path.join(output_dir, "analysis_report.txt")
    save_report_to_file(analysis, text_report_path)
    
    # Save JSON report
    json_report_path = os.path.join(output_dir, "analysis_report.json")
    save_json_report(analysis, json_report_path)
    
    # Generate and save charts
    try:
        generate_plots(analysis, output_dir, log_data)
    except Exception as e:
        print(f"Error generating charts: {str(e)}")

if __name__ == "__main__":
    main() 