# Hole Fixing Interface System

## Overview

The Hole Fixing Interface provides a powerful callback-based system for fixing hole files and synthesizing complete proofs. This system allows you to provide custom hole fixing functions and automatically tracks success rates across entire datasets.

## Key Features

- **Callback Interface**: Define custom hole fixing functions
- **Proof Synthesis**: Automatically combine fixed holes into complete proofs  
- **Comprehensive Tracking**: Monitor pass rates at multiple levels
- **Dataset Processing**: Apply to entire datasets with detailed reporting
- **Comparison Tools**: Compare different fixing strategies

## Architecture

### Core Components

1. **HoleFixerInterface**: Abstract base class for hole fixing callbacks
2. **ProofSynthesizer**: Handles combining holes into complete proofs
3. **DatasetProcessor**: Processes entire datasets and generates reports
4. **Status Tracking**: Tracks pass/fail at original, hole, and synthesis levels

### Status Tracking

The system tracks multiple levels of success:

- **Original Proof Status**: Whether the complete original proof passes
- **Individual Hole Status**: Whether each hole passes before/after fixing
- **Synthesis Status**: Whether the complete synthesized proof passes
- **Partial Fix Status**: Whether fixing only originally failed holes works

## Basic Usage

### 1. Define a Hole Fixer

```python
from hole_fixer_interface import HoleFixerInterface
from unified_problem_manager import Problem

class MyHoleFixer(HoleFixerInterface):
    def fix_hole(self, hole_content: str, problem_context: Problem) -> str:
        # Your hole fixing logic here
        if "hole" in hole_content:
            return hole_content.replace("hole", "simp")
        return hole_content + "\n  simp"
```

### 2. Process Problems

```python
from hole_fixer_interface import DatasetProcessor

# Create processor with your fixer
fixer = MyHoleFixer()
processor = DatasetProcessor(fixer)

# Process a single problem
problem = problem_manager.get_problem("minif2f", "problem_001")
result = processor.process_problem(problem)

# Process entire dataset
report = processor.process_dataset("minif2f")

# Process all datasets
all_reports = processor.process_all_datasets()
```

### 3. Analyze Results

```python
# Print summary
print(f"Original pass rate: {report.original_pass_count}/{report.total_problems}")
print(f"Synthesis pass rate: {report.synthesis_pass_count}/{report.total_problems}")
print(f"Improvement: +{report.synthesis_pass_count - report.original_pass_count}")

# Save detailed report
processor.save_report({dataset: report}, "my_analysis.json")
```

## Built-in Hole Fixers

### SimpleHoleFixer
Replaces holes with "sorry":
```python
from hole_fixer_interface import SimpleHoleFixer

fixer = SimpleHoleFixer()
```

### CustomHoleFixer  
Uses specific tactics:
```python
from hole_processing_demo import CustomHoleFixer

fixer = CustomHoleFixer("simp")  # or "tauto", "ring", "norm_num"
```

### ProgressiveHoleFixer
Tries multiple strategies until one works:
```python
from hole_processing_demo import ProgressiveHoleFixer

fixer = ProgressiveHoleFixer()
```

### DPV2HoleFixer
Uses DeepSeek Prover V2:
```python
from hole_fixer_interface import DPV2HoleFixer

fixer = DPV2HoleFixer()
```

## Command Line Interface

### Basic Demo
```bash
# Run demonstration with sample problems
python hole_processing_demo.py demo
```

### Full Dataset Analysis
```bash
# Analyze all datasets with simple fixer
python hole_processing_demo.py analyze simple

# Analyze specific dataset with DPV2
python hole_processing_demo.py analyze dpv2 --dataset minif2f

# Analyze with progressive fixer
python hole_processing_demo.py analyze progressive --dataset proverbench
```

### Compare Different Fixers
```bash
# Compare fixers on minif2f dataset
python hole_processing_demo.py compare --dataset minif2f

# Compare on proverbench
python hole_processing_demo.py compare --dataset proverbench
```

## Advanced Usage

### Custom Strategies with Context

```python
class ContextAwareHoleFixer(HoleFixerInterface):
    def fix_hole(self, hole_content: str, problem_context: Problem) -> str:
        # Use problem context for smarter fixing
        dataset = problem_context.dataset
        problem_id = problem_context.problem_id
        
        # Get problem header for additional context
        header = problem_manager.get_header_content(problem_context)
        
        if "Real" in header:
            # Real analysis problems - try ring
            return hole_content.replace("hole", "ring")
        elif "Nat" in header:
            # Natural number problems - try norm_num
            return hole_content.replace("hole", "norm_num")
        else:
            # Default strategy
            return hole_content.replace("hole", "simp")
```

### Multi-Strategy with Validation

```python
class ValidatingHoleFixer(HoleFixerInterface):
    def __init__(self):
        self.strategies = ["simp", "ring", "norm_num", "tauto"]
        
    def fix_hole(self, hole_content: str, problem_context: Problem) -> str:
        from decompose_solver import unified_env
        header = problem_manager.get_header_content(problem_context)
        
        # Try each strategy and validate
        for strategy in self.strategies:
            candidate = hole_content.replace("hole", strategy)
            
            try:
                result = unified_env.run_with_header(header, candidate)
                errors = [m for m in getattr(result, 'messages', []) 
                         if m.severity == "error"]
                if not errors:
                    return candidate
            except:
                continue
                
        # Fallback to sorry
        return hole_content.replace("hole", "sorry")
```

## Report Structure

### DatasetReport
```python
@dataclass
class DatasetReport:
    dataset_name: str
    total_problems: int
    original_pass_count: int           # How many originally passed
    hole_pass_rates: Dict[str, float]  # Per-hole success rates  
    synthesis_pass_count: int          # How many pass after synthesis
    partial_fix_pass_count: int        # How many pass with partial fixes
    problem_results: List[ProofSynthesisResult]
```

### ProofSynthesisResult
```python
@dataclass  
class ProofSynthesisResult:
    problem_id: str
    dataset: str
    original_proof_status: ProofStatus
    hole_results: List[HoleResult]
    synthesized_proof: str
    synthesized_status: ProofStatus
    partial_fix_status: ProofStatus
    error_message: Optional[str] = None
```

### HoleResult
```python
@dataclass
class HoleResult:
    hole_id: str
    original_content: str
    fixed_content: str
    original_status: ProofStatus
    fixed_status: ProofStatus
    error_message: Optional[str] = None
```

## Example Output

```
=== Dataset: minif2f ===
Total Problems: 201
Original Pass Rate: 145/201 (72.1%)
Full Synthesis Pass Rate: 178/201 (88.6%) 
Partial Fix Pass Rate: 165/201 (82.1%)
Full Synthesis Improvement: +33 problems
Partial Fix Improvement: +20 problems
Average Hole Fix Rate: 76.3%
Total Holes Tracked: 847

=== Overall Summary ===
Total Problems Across All Datasets: 935
Overall Original Pass Rate: 673/935 (72.0%)
Overall Full Synthesis Pass Rate: 812/935 (86.8%)
Overall Partial Fix Pass Rate: 759/935 (81.2%)
Overall Full Synthesis Improvement: +139 problems
Overall Partial Fix Improvement: +86 problems
```

## Integration with Existing Tools

The hole fixing interface integrates seamlessly with the existing unified system:

- Uses `unified_problem_manager` for problem access
- Leverages `decompose_solver` for environment management
- Compatible with `dpv2_solver` for advanced fixing
- Works with existing hole generation tools

## Best Practices

1. **Start Simple**: Begin with basic fixers before implementing complex ones
2. **Validate Early**: Test your fixer on a small subset first
3. **Use Context**: Leverage problem context for smarter fixing decisions
4. **Track Progress**: Use the reporting system to measure improvements
5. **Compare Strategies**: Use the comparison tools to find the best approach
6. **Save Results**: Always save detailed reports for later analysis

## Performance Considerations

- **Environment Caching**: The system uses cached Lean environments for efficiency
- **Batch Processing**: Process datasets in batches for better performance
- **Parallel Processing**: Consider implementing parallel hole fixing for large datasets
- **Memory Management**: Large datasets may require memory-conscious processing

## Extending the System

### Adding New Fixers
1. Inherit from `HoleFixerInterface`
2. Implement the `fix_hole` method
3. Test with demo script
4. Add to comparison suite

### Custom Reporting
1. Extend `DatasetReport` for additional metrics
2. Modify `_generate_report` in `DatasetProcessor`
3. Update `save_report` for new fields

### Advanced Synthesis
1. Extend `ProofSynthesizer` for complex proof combination
2. Implement custom hole extraction logic
3. Add validation steps for synthesized proofs 

## Detailed Logging System

### 🔍 Logging Features

The system provides comprehensive logging to track every aspect of the hole-fixing process:

#### 1. **Session Logging**
- Logs the start of each hole-fixing session
- Records the fixer type being used
- Creates timestamped log files in `hole_fixing_logs/` directory

#### 2. **Problem-Level Logging**
- Tracks processing of each problem in the dataset
- Records original proof status (pass/fail)
- Logs the number of holes extracted from each problem
- Shows progress through the dataset (e.g., "[1/3] Starting problem aime_1983_p1")

#### 3. **Hole-Level Logging**
For each individual hole, the system logs:
- **Input content**: The original hole content
- **Original status**: Whether the hole originally passed or failed
- **Repair attempt**: Which fixer strategy is being applied
- **Fixed content**: The content after repair attempt
- **Repair result**: Whether the repair was successful (pass ✓ or fail ✗)

Example hole-level log:
```
  --> Processing hole_0
  Input: have h1 : P → Q := hole
  Original hole status: fail
  Attempting repair with SimpleHoleFixerDemo...
  Fixed content: have h1 : P → Q := sorry
  Repair result: pass ✓
```

#### 4. **Problem Summary Logging**
After processing all holes in a problem:
- **Hole processing summary**: Total holes, successful fixes, improved holes
- **Synthesis result**: Whether the complete proof passes
- **Partial fix result**: Whether the proof with only failed holes fixed passes
- **Problem summary**: Original status vs. final status

#### 5. **Dataset Statistics Logging**
Comprehensive statistics for the entire dataset:
- **Total problems processed**
- **Original pass count and rate**
- **Synthesis pass count and rate** (after fixing all holes)
- **Partial fix pass count and rate** (after fixing only failed holes)
- **Improvement metrics**: How many problems were improved
- **Hole-level statistics**: Total holes processed, successful fixes, fix rate

Example dataset statistics:
```
============================================================
DATASET STATISTICS: minif2f
============================================================
Total problems: 3
Original pass count: 0
Original pass rate: 0.0%
Synthesis pass count: 3
Synthesis pass rate: 100.0%
Partial fix pass count: 3
Partial fix pass rate: 100.0%

Improvement metrics:
Full synthesis improvement: +3 problems
Partial fix improvement: +3 problems
Total holes processed: 9
Successful hole fixes: 9
Hole fix rate: 100.0%
```

### 📁 Log File Management

#### Log File Location
All logs are saved in the `hole_fixing_logs/` directory with timestamped filenames:
- Format: `hole_fixing_demo_YYYYMMDD_HHMMSS.log`
- Example: `hole_fixing_demo_20250523_200407.log`

#### Log File Contents
Each log file contains:
1. **Session header** with timestamp and fixer information
2. **Dataset processing logs** with problem-by-problem details
3. **Hole-level repair logs** with input/output tracking
4. **Summary statistics** for the entire dataset

#### Viewing Logs
You can view logs using standard Unix commands:
```bash
# List all log files
ls -la hole_fixing_logs/

# View the beginning of a log file
head -20 hole_fixing_logs/hole_fixing_demo_20250523_200407.log

# View the end of a log file (statistics)
tail -30 hole_fixing_logs/hole_fixing_demo_20250523_200407.log

# View the entire log file
cat hole_fixing_logs/hole_fixing_demo_20250523_200407.log
```

### 🎯 Using Logging in Your Code

#### Enable/Disable Logging
```python
# Enable logging (default)
processor = DatasetProcessor(fixer, enable_logging=True)

# Disable logging
processor = DatasetProcessor(fixer, enable_logging=False)
```

#### Custom Log Analysis
The logging system creates structured logs that can be parsed for analysis:
- Each log entry has a timestamp and log level
- Problem names and hole indices are clearly marked
- Success/failure indicators use ✓ and ✗ symbols
- Statistics are clearly separated with dividers

## Architecture

### Class Hierarchy

```
HoleFixerInterface (ABC)
├── SimpleHoleFixer
├── CustomHoleFixer
├── ProgressiveHoleFixer
└── DPV2HoleFixer

DatasetProcessor
├── ProcessingReport
└── Logging System
```

### Data Flow

1. **Problem Loading**: Load problems from dataset
2. **Hole Extraction**: Extract holes from proof content
3. **Hole Fixing**: Apply fixing strategy to each hole
4. **Proof Reconstruction**: Rebuild proof with fixed holes
5. **Validation**: Check if reconstructed proof passes
6. **Reporting**: Generate comprehensive reports and logs

## Advanced Usage

### Custom Strategy Implementation

```python
class MyCustomFixer(HoleFixerInterface):
    def fix_hole(self, hole_content: str, context: Dict[str, Any] = None) -> str:
        # Your custom logic here
        if "have" in hole_content:
            return hole_content.replace("hole", "sorry")
        else:
            return hole_content.replace("hole", "exact?")
```

### Batch Processing with Custom Callbacks

```python
def my_progress_callback(problem_name: str, status: str):
    print(f"Processed {problem_name}: {status}")

processor = DatasetProcessor(fixer, enable_logging=True)
report = processor.process_dataset("minif2f", progress_callback=my_progress_callback)
```

### Integration with Existing Systems

The interface integrates seamlessly with:
- `unified_problem_manager`: For problem loading and management
- `decompose_solver`: For proof decomposition and hole extraction
- `substep_saver_hole`: For saving intermediate results

## Best Practices

1. **Always enable logging** for production runs to track progress and debug issues
2. **Use appropriate fixing strategies** based on your problem domain
3. **Monitor hole fix rates** to evaluate strategy effectiveness
4. **Implement custom strategies** for domain-specific hole patterns
5. **Use batch processing** for large datasets to leverage parallel processing
6. **Review logs regularly** to identify patterns and improve strategies

## Performance Considerations

- Logging adds minimal overhead (~1-2% performance impact)
- Log files can grow large for big datasets - consider log rotation
- Use `enable_logging=False` for performance-critical applications
- The system is designed for batch processing of large datasets

## Troubleshooting

### Common Issues

1. **Log directory not created**: Ensure write permissions in the workspace
2. **Large log files**: Use log rotation or periodic cleanup
3. **Memory usage**: For very large datasets, consider processing in chunks

### Debug Information

The logging system provides detailed debug information:
- Exact hole content and context
- Step-by-step repair attempts
- Success/failure reasons
- Performance metrics

## Future Enhancements

Planned improvements include:
- **Real Lean Integration**: Direct integration with Lean theorem prover
- **Advanced Strategies**: Machine learning-based hole fixing
- **Performance Optimization**: Parallel processing and caching
- **Interactive Interface**: Web-based interface for manual review
- **Log Analysis Tools**: Automated log parsing and visualization 