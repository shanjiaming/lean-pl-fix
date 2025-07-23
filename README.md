# Lean Theorem Proving Automation System (Streamlined Version)

This project is a streamlined Lean 4 theorem proving automation system focused on three core functionalities. This version has removed complex enumeration and correction features to maintain system simplicity and maintainability.

## 🎯 Three Core Functionalities

### 1. Proof Generation
- **Functionality**: Generate Lean 4 theorem proofs for mathematical problems using AI (DeepSeek Prover V2)
- **Core Files**: `generate_putnam.py`, `dpv2_solver.py`, `unified_lean_environment.py`

### 2. Dataset Integration
- **Functionality**: Unified management of multiple datasets, supporting problem migration and batch processing
- **Supported Datasets**: Demo dataset, Putnam competition problems
- **Core Files**: `unified_problem_manager.py`, `dataset_migration.py`, `migrate_demo.py`

### 3. Proof Decomposition
- **Functionality**: Decompose AI-generated proofs into "skeleton" form and a series of "holes", supporting simple verification pipeline
- **Decomposition Strategy**: Structured decomposition based on `have by` blocks
- **Core Files**: `decompose_hole_merge_pipeline.py`, `decompose_solver.py`, `minimal_verification_pipeline.py`

## 🏗️ System Architecture

```
Proof Generation → Dataset Integration → Proof Decomposition → Verification
       ↓                    ↓                      ↓               ↓
   AI Generated         Unified                Structured        Simple
     Proofs           Management              Decomposition    Verification
```

## 🚀 Quick Start

### End-to-End Workflow (Demo Dataset)

Use the Demo dataset to experience the complete workflow:

```bash
# Method 1: Use unified batch processor for complete workflow
python unified_batch_processor.py full

# Method 2: Step-by-step execution
# 1. Migrate Demo dataset
python migrate_demo.py

# 2. Generate proof decomposition (process first 5 problems)
python decompose_hole_merge_pipeline.py dataset demo 5

# 3. Run simple verification pipeline
python minimal_verification_pipeline.py dataset demo 5
```

### Individual Function Testing

```bash
# Proof generation only (requires API key)
python generate_putnam.py

# Dataset migration only
python unified_batch_processor.py migrate

# Proof decomposition only
python unified_batch_processor.py decompose
```

## 📋 Detailed Usage Guide

### 1. Proof Generation

Generate proofs for Putnam competition problems using AI:

```bash
python generate_putnam.py
```

**Features**:
- Automatically reads problems from `dataset/putnam.jsonl`
- Generated proofs saved to `dataset/putnam/` directory
- Automatically skips existing files to avoid regeneration
- Supports multi-threading with built-in API rate limiting

### 2. Dataset Integration

**Demo Dataset Migration** (small-scale testing):
```bash
python migrate_demo.py
```
- Reads all `.lean` files from `demo/` directory
- Automatically splits into header and problem parts
- Outputs to `unified_problems/demo/` structure

**Putnam Dataset Migration**:
```bash
python dataset_migration.py putnam
```

**Batch Migration**:
```bash
python unified_batch_processor.py migrate
```

### 3. Proof Decomposition

Decompose AI-generated proofs into structured form:

**Process Entire Dataset** (recommended with limit):
```bash
# Demo dataset (process first 5 files)
python decompose_hole_merge_pipeline.py dataset demo 5

# Putnam dataset (process first 10 files)
python decompose_hole_merge_pipeline.py dataset putnam 10
```

**Process Individual Problems**:
```bash
# Process specific problem in demo dataset
python decompose_hole_merge_pipeline.py problem demo demo_complex_p1

# Process specific problem in putnam dataset
python decompose_hole_merge_pipeline.py problem putnam putnam_2007_b6
```

**Output Results**:
- Results saved in `decomposition_results/<dataset_name>/decomposed/<problem_id>/`
- Contains files:
  - `header.lean`: Imports and declarations
  - `problem.lean`: Original problem
  - `hole_version.lean`: Version with hole_X placeholders
  - `decomposition.json`: Metadata containing original tactic information

### 4. Simple Verification Pipeline

Run simple verification and testing:

```bash
# Demo dataset (process first 5 problems)
python minimal_verification_pipeline.py dataset demo 5

# Process individual problem
python minimal_verification_pipeline.py problem demo demo_complex_p1
```

## 📁 Project Structure

```
lean-theorem-prover/
├── 📁 Core Functionality
│   ├── generate_putnam.py           # Proof generation
│   ├── dpv2_solver.py              # AI solver
│   ├── unified_problem_manager.py   # Unified problem management
│   ├── dataset_migration.py         # Dataset migration
│   ├── decompose_hole_merge_pipeline.py  # Decomposition pipeline
│   └── minimal_verification_pipeline.py  # Verification pipeline
├── 📁 Datasets (Retained Only)
│   ├── demo/                       # Demo dataset
│   ├── dataset/putnam/             # Putnam dataset
│   └── unified_problems/           # Unified structure data
├── 📁 Results Output
│   └── decomposition_results/      # Decomposition results
└── 📁 Configuration Files
    ├── requirements.txt            # Streamlined dependencies
    ├── lakefile.lean              # Lean project configuration
    └── lean-toolchain             # Lean toolchain
```

## ⚙️ Environment Setup

### Dependency Installation

```bash
pip install -r requirements.txt
```

### API Configuration

Create `.env` file to configure OpenRouter API:

```env
OPENROUTER_API_KEY=your_api_key_here
```

### Lean Environment

Ensure Lean 4 and Lake are installed:
- Refer to [Lean 4 Installation Guide](https://leanprover.github.io/lean4/doc/setup.html)

## 🔧 Unified Batch Processor

Use `unified_batch_processor.py` for batch operations:

```bash
# Show system status
python unified_batch_processor.py status

# Run complete workflow
python unified_batch_processor.py full

# For specific dataset
python unified_batch_processor.py dataset --dataset demo --operations migrate decompose
```

## ⚠️ Important Notes

- **Streamlined Version**: N-gram enumeration and theorem name correction features have been removed
- **Supported Datasets**: Only Demo and Putnam datasets are supported
- **Processing Recommendations**: Use `limit` parameter to limit processing quantity to avoid long processing times
- **API Limitations**: Proof generation requires API key and has rate limits

## 🎯 Use Cases

- **Research and Learning**: Understand basic workflows of Lean theorem proving automation
- **Prototype Development**: Use as foundation framework for more complex systems
- **Teaching Demonstrations**: Showcase core concepts of AI-assisted theorem proving
- **Quick Verification**: Quick testing on small-scale problem sets

## 📚 Related Resources

- [Lean 4 Documentation](https://leanprover.github.io/lean4/doc/)
- [Putnam Competition Problems](https://artofproblemsolving.com/wiki/index.php/Putnam_Problems)
- [DeepSeek Prover V2](https://openrouter.ai/models/deepseek/deepseek-prover-v2)