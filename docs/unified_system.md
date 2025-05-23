# Unified Problem Management System

## Overview

The Unified Problem Management System provides a centralized approach to managing Lean theorem proving problems across multiple datasets (minif2f, proverbench, putnam). This system supports dynamic headers, environment caching, and unified operations for solving, hole generation, and decomposition.

## System Architecture

### Core Components

1. **UnifiedProblemManager** (`unified_problem_manager.py`)
   - Central management of all problems
   - Dynamic header support
   - Organized file structure
   - Metadata management

2. **Dataset Migration** (`dataset_migration.py`)
   - Converts existing datasets to unified structure
   - Preserves original data with backups
   - Extracts headers and problem content

3. **Enhanced Solvers**
   - `decompose_solver.py`: Core solving with unified environment
   - `dpv2_solver.py`: DPv2 integration with unified support
   - `dpv2_batch_solver.py`: Batch processing capabilities

4. **Substep Processors**
   - `substep_saver_hole.py`: Hole generation for all datasets
   - `substep_saver_decompose.py`: Decomposition for all datasets

5. **Unified Batch Processor** (`unified_batch_processor.py`)
   - Single interface for all operations
   - Pipeline management
   - Status monitoring

## Directory Structure

```
unified_problems/
├── minif2f/
│   ├── problem_001/
│   │   ├── problem.lean          # Original problem file
│   │   ├── header.lean           # Extracted header
│   │   ├── content.lean          # Problem content only
│   │   ├── holes/                # Generated hole versions
│   │   └── decomposed/           # Decomposed versions
│   └── ...
├── proverbench/
│   └── ...
├── putnam/
│   └── ...
└── metadata.json                 # System metadata
```

## Key Features

### Dynamic Headers
- Automatic header extraction from problem files
- Header caching for improved performance
- Support for dataset-specific headers

### Environment Caching
- Lean server environment caching based on header content
- Reduced initialization overhead
- Better performance for batch operations

### Unified Operations
- Consistent interface across all datasets
- Backward compatibility with existing tools
- Extensible architecture for new datasets

## Usage

### Migration
```bash
# Migrate all datasets
python unified_batch_processor.py migrate

# Or use individual migration
python dataset_migration.py
```

### Problem Solving
```bash
# Solve all problems
python unified_batch_processor.py solve

# Solve specific dataset
python unified_batch_processor.py dataset minif2f solve
```

### Hole Generation
```bash
# Generate holes for all
python unified_batch_processor.py holes

# Generate holes for specific dataset
python unified_batch_processor.py dataset proverbench holes
```

### Decomposition
```bash
# Generate decomposed versions for all
python unified_batch_processor.py decompose

# Generate decomposed for specific dataset
python unified_batch_processor.py dataset putnam decompose
```

### Full Pipeline
```bash
# Run complete pipeline
python unified_batch_processor.py full
```

### Status Monitoring
```bash
# Check system status
python unified_batch_processor.py status
```

## API Usage

### Problem Manager
```python
from unified_problem_manager import problem_manager

# List all datasets
datasets = problem_manager.list_datasets()

# Get problems from a dataset
problems = problem_manager.list_problems("minif2f")

# Get specific problem
problem = problem_manager.get_problem("minif2f", "problem_001")

# Get problem content
header = problem_manager.get_header_content(problem)
content = problem_manager.get_problem_content(problem)
full_content = problem_manager.get_full_content(problem)
```

### Unified Solving
```python
from decompose_solver import solve_theorem_unified, solve_theorem_by_id

# Solve by problem object
result = solve_theorem_unified(problem)

# Solve by ID
result = solve_theorem_by_id("minif2f", "problem_001")
```

### DPv2 Integration
```python
from dpv2_solver import solve_theorem_dpv2_unified, solve_theorem_dpv2_by_id

# DPv2 solving with unified system
result = solve_theorem_dpv2_unified(problem)

# DPv2 solving by ID
result = solve_theorem_dpv2_by_id("proverbench", "problem_042")
```

## Implementation Status

✅ **Completed Components:**
- UnifiedProblemManager core implementation
- Dataset migration tools
- Enhanced decompose_solver with unified support
- DPv2 solver integration
- Batch processing capabilities
- Substep processors (hole and decompose)
- Unified batch processor
- Documentation

✅ **Key Features Implemented:**
- Dynamic header support
- Environment caching
- Backward compatibility
- Multi-dataset support
- Unified API
- Command-line interface

## Benefits

1. **Consistency**: Uniform handling across all datasets
2. **Performance**: Environment caching reduces overhead
3. **Maintainability**: Centralized management reduces code duplication
4. **Extensibility**: Easy to add new datasets and operations
5. **Backward Compatibility**: Existing tools continue to work
6. **Flexibility**: Support for both unified and legacy workflows

## Migration Notes

- Original datasets are preserved with backups
- Headers are automatically extracted and cached
- Existing file structures remain intact
- Legacy tools continue to function alongside unified system
- Gradual migration path available

## Future Enhancements

- Web interface for problem management
- Advanced caching strategies
- Distributed processing support
- Integration with additional theorem provers
- Enhanced metadata and search capabilities 