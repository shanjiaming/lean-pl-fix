# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Lean theorem proving automation system called "Lean Enumerator" that automatically fixes errors in Lean mathematical proof code using program synthesis techniques. The system works with multiple datasets (minif2f, proverbench, putnam) and provides unified problem management with automated error detection, classification, and fixing capabilities.

## Key Components

### Core Systems
- **Lean REPL Interface** (`lean_api.py`, `lean_interact_api.py`): Interfaces with Lean 4 for error detection and code execution
- **Error Analysis** (`lean_theorem_analyzer.py`): Analyzes and classifies Lean errors for targeted fixing strategies
- **Program Synthesis** (`decompose_solver.py`): Core solving system using Tyrell framework for generating fix candidates
- **Unified Problem Manager** (`unified_problem_manager.py`): Centralized management of problems across datasets
- **Trinity Framework** (`Trinity/`): Program synthesis framework for automated Lean code fixing

### Dataset Structure
The system uses a unified structure under `unified_problems/`:
```
unified_problems/
├── dataset_name/
│   ├── problem_id/
│   │   ├── header.lean          # Extracted imports/declarations
│   │   ├── problem.lean         # Original problem file
│   │   ├── decomposed/          # Decomposed problem versions
│   │   └── hole/               # Generated hole versions
```

## Development Commands

### Environment Setup
```bash
# Install Python dependencies
pip install -r requirements.txt

# Lean environment is in matheye/benchmarks/
cd matheye/benchmarks
lake build  # Build Lean project with mathlib4
```

### Testing
```bash
# Run Python tests (uses pytest)
pytest

# Test specific Lean files
cd matheye/benchmarks
lake exe repl  # Interactive Lean REPL
```

### Core Operations

#### Problem Management
```bash
# Migrate datasets to unified structure
python dataset_migration.py

# Process all datasets with unified batch processor
python unified_batch_processor.py migrate
python unified_batch_processor.py solve
python unified_batch_processor.py full  # Complete pipeline
```

#### Single Problem Solving
```bash
# Solve individual problems
python decompose_solver.py path/to/problem.lean

# Analyze theorems in files
python lean_theorem_analyzer.py path/to/file.lean
```

#### Batch Processing
```bash
# Process datasets individually
python generate_minif2f.py
python generate_proverbench.py  
python generate_putnam.py

# Generate enhanced results
python generate_enhanced_table.py
```

## Architecture Notes

### Lean Integration
- Uses Lean 4 v4.19.0 with mathlib4
- Primary integration through `lean-interact` library with fallback to `pty`/`lake exe repl`
- Local Lean project located in `matheye/benchmarks/`

### Error Fixing Pipeline
1. Parse Lean file and extract headers/content
2. Use REPL to detect errors with precise location information
3. Apply program synthesis to generate fix candidates
4. Evaluate fixes against original errors
5. Apply successful fixes and continue until no errors remain

### Problem Synthesis Framework
- **Tyrell Framework**: DSL-based program synthesis for fix generation
- **Dynamic Headers**: Automatic header extraction and caching for performance
- **Environment Caching**: Lean server state caching based on header content

## Key File Locations

- **Main solvers**: `decompose_solver.py`, `dpv2_solver.py`
- **Dataset processing**: `generate_*.py` files
- **Analysis tools**: `lean_theorem_analyzer.py`, `mathlib_analyzer.py`
- **Utilities**: `similarity_utils.py`, `static_theorem_filter.py`
- **Documentation**: `docs/` directory with architecture and API details
- **Configuration**: `.cursor/rules/project_guidelines.mdc` for development guidelines

## Development Guidelines

1. Use English for code, 中文 for communication
2. Update `docs/` when adding features or structural changes
3. Use pytest for testing
4. Never hide errors with try-except - let them surface for debugging
5. Update `docs/taskflow.md` before/after running tasks
6. Store dataset-related outputs under paths like `minif2f/<foldername>/`
7. Run implementations automatically after development

## Lean 4 Specifics

- Lean toolchain: `leanprover/lean4:v4.19.0`
- Uses mathlib4 for mathematical libraries
- Lake build system for project management
- REPL-based interaction for error detection and fixing