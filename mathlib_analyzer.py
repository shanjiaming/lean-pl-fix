#!/usr/bin/env python

import re
import os
import sys
import argparse
from collections import defaultdict

def extract_imports(file_content):
    """Extract all import statements from a Lean file"""
    imports = []
    # Match import statements (including those with attributes)
    import_pattern = re.compile(r'^\s*(?:@\[[^\]]*\]\s*)?import\s+([^\n]+)', re.MULTILINE)
    
    for match in import_pattern.finditer(file_content):
        # Process each import statement
        import_statement = match.group(1).strip()
        # Handle multiple modules in a single import statement
        for module in import_statement.split(','):
            imports.append(module.strip())
    
    return imports

def extract_theorem_uses(file_content):
    """Extract all potential theorem uses from a Lean file"""
    # This regex captures various ways theorems might be used in Lean
    theorem_pattern = re.compile(r'''
        # After proof tactics
        (?:apply|rw|rewrite|simp|exact|have|specialize|use|refine)\s+
        ([\w.]+(?:\.\{[^}]*\})?)  # Capture the identifier with possible {...} arguments
        |
        # In function application with dot notation (excluding common non-theorem patterns)
        (?<!\bimport\s)(?<!\bopen\s)([\w]+\.\w+)(?!\s*:=)
        |
        # After "by" tactic
        by\s+([\w.]+)
        |
        # After using showing/theorem statements
        (?:theorem|lemma|corollary|proposition|example)\s+[^:]+\s*:\s*(?:[^:]+:[^:]+:)*\s*
        ([\w.]+)
        |
        # After arrow in expressions like (h : P → Q)
        \(\s*\w+\s*:\s*[^→]*→\s*([\w.]+)
        |
        # Infer theorems used in tactics blocks
        begin\s+([^end]+?)\s+end
    ''', re.VERBOSE | re.MULTILINE | re.DOTALL)
    
    theorems = set()
    
    for match in theorem_pattern.finditer(file_content):
        groups = match.groups()
        
        # Process regular theorem references
        for i, group in enumerate(groups[:-1]):  # Skip the last group (tactics block)
            if group:
                # Clean up the theorem reference
                theorem = group.strip()
                # Remove any {...} arguments
                theorem = re.sub(r'\.\{[^}]*\}', '', theorem)
                theorems.add(theorem)
        
        # Process tactics block separately to find theorem references
        if groups[-1]:  # tactics block
            tactics_block = groups[-1]
            # Look for theorem references within the tactics block
            tactic_theorems = re.findall(r'(?:apply|rw|rewrite|simp|exact)\s+([\w.]+)', tactics_block)
            for theorem in tactic_theorems:
                theorems.add(theorem.strip())
    
    # Process notation like `#check thm` which often indicates theorem usage
    check_pattern = re.compile(r'#check\s+([\w.]+)', re.MULTILINE)
    for match in check_pattern.finditer(file_content):
        theorems.add(match.group(1).strip())
    
    # Remove common non-theorem identifiers
    non_theorems = {'end', 'begin', 'from', 'with', 'using', 'let', 'def', 'where', 'sorry'}
    theorems = {t for t in theorems if t not in non_theorems and not any(t.endswith('.' + nt) for nt in non_theorems)}
    
    return theorems

def extract_namespace_info(file_content):
    """Extract namespace declarations and open statements"""
    namespaces = []
    opens = []
    
    # Extract namespace declarations
    namespace_pattern = re.compile(r'^\s*namespace\s+([^\n]+)', re.MULTILINE)
    for match in namespace_pattern.finditer(file_content):
        namespaces.append(match.group(1).strip())
    
    # Extract open statements
    open_pattern = re.compile(r'^\s*open\s+([^\n]+)', re.MULTILINE)
    for match in open_pattern.finditer(file_content):
        open_statement = match.group(1).strip()
        # Handle multiple modules in a single open statement
        for module in open_statement.split(','):
            opens.append(module.strip())
    
    return {"namespaces": namespaces, "opens": opens}

def is_mathlib_reference(theorem, imports, opens):
    """Check if a theorem reference belongs to mathlib"""
    
    # Direct check for mathlib references
    if theorem.startswith("mathlib.") or theorem.startswith("Mathlib."):
        return True
        
    # Check if the theorem has a namespace prefix that matches a mathlib import
    for imp in imports:
        if imp.startswith("mathlib") or imp.startswith("Mathlib"):
            # If the theorem starts with any part of the import path
            parts = imp.split('.')
            for i in range(1, len(parts) + 1):
                prefix = '.'.join(parts[:i])
                if theorem.startswith(prefix) or theorem.lower().startswith(prefix.lower()):
                    return True
    
    # Check if any opened namespaces are from mathlib
    for open_ns in opens:
        if open_ns.startswith("mathlib") or open_ns.startswith("Mathlib"):
            # This is a bit more speculative - if mathlib namespace is opened,
            # we consider identifiers that don't have a namespace prefix as potentially from mathlib
            if '.' not in theorem:
                return True
    
    # Check if the theorem uses common mathlib namespaces
    common_mathlib_namespaces = [
        "Nat.", "Int.", "Rat.", "Real.", "Complex.",
        "Set.", "Finset.", "List.", "Vector.", "Option.", "Sum.",
        "Matrix.", "Topology.", "Metric.", "Order.",
        "Algebra.", "Group.", "Ring.", "Field.", "Module.", "Linear.",
        "Category.", "Logic.", "Tactic.", "Data.", "Lean.", "Array.",
        "AddGroup.", "AddCommGroup.", "AddMonoid.", "Monoid.", "SemiGroup.",
        "HasCoe.", "HasLift.", "Pi.", "Function.", "Cardinal.", "Ordinal.",
        "Eq.", "Quot.", "Subgroup.", "Subring.", "PropSet."
    ]
    
    for namespace in common_mathlib_namespaces:
        if theorem.startswith(namespace) or theorem.lower().startswith(namespace.lower()):
            return True
            
    return False

def analyze_lean_file(file_path):
    """Analyze a Lean file and extract mathlib theorem references"""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Extract imports and namespace information
        imports = extract_imports(content)
        namespace_info = extract_namespace_info(content)
        
        # Extract potential theorem uses
        theorems = extract_theorem_uses(content)
        
        # Filter for mathlib theorems
        mathlib_theorems = set()
        for theorem in theorems:
            if is_mathlib_reference(theorem, imports, namespace_info["opens"]):
                mathlib_theorems.add(theorem)
        
        # Group theorems by potential library/module
        grouped_theorems = defaultdict(list)
        for theorem in mathlib_theorems:
            # Split by first dot to group by namespace
            if '.' in theorem:
                namespace, name = theorem.split('.', 1)
                grouped_theorems[namespace].append(theorem)
            else:
                grouped_theorems["ungrouped"].append(theorem)
        
        return {
            "imports": imports,
            "namespaces": namespace_info["namespaces"],
            "opens": namespace_info["opens"],
            "mathlib_theorems": sorted(list(mathlib_theorems)),
            "grouped_theorems": {k: sorted(v) for k, v in grouped_theorems.items()}
        }
        
    except Exception as e:
        print(f"Error analyzing file {file_path}: {str(e)}")
        return {
            "imports": [],
            "namespaces": [],
            "opens": [],
            "mathlib_theorems": [],
            "grouped_theorems": {},
            "error": str(e)
        }

def print_results(results):
    """Print the analysis results in a human-readable format"""
    print("\n=== Lean Environment ===")
    print("Imports:")
    for imp in results["imports"]:
        print(f"  {imp}")
    
    print("\nNamespaces:")
    for ns in results["namespaces"]:
        print(f"  {ns}")
    
    print("\nOpened Namespaces:")
    for op in results["opens"]:
        print(f"  {op}")
    
    print("\n=== Mathlib Theorems By Namespace ===")
    for namespace, theorems in results["grouped_theorems"].items():
        print(f"\n{namespace}:")
        for theorem in theorems:
            print(f"  {theorem}")
    
    print(f"\nTotal mathlib theorems detected: {len(results['mathlib_theorems'])}")

def main():
    parser = argparse.ArgumentParser(description='Analyze Lean file for mathlib theorem usage')
    parser.add_argument('file_path', help='Path to the Lean file to analyze')
    parser.add_argument('--output', '-o', help='Output file for results (JSON format)')
    parser.add_argument('--verbose', '-v', action='store_true', help='Enable verbose output')
    
    args = parser.parse_args()
    
    if not os.path.exists(args.file_path):
        print(f"Error: File '{args.file_path}' does not exist.")
        return 1
    
    # Analyze the file
    results = analyze_lean_file(args.file_path)
    
    # Print results
    if args.verbose or not args.output:
        print_results(results)
    
    # Output to JSON file if requested
    if args.output:
        import json
        with open(args.output, 'w', encoding='utf-8') as f:
            json.dump(results, f, indent=2)
        print(f"Results saved to {args.output}")
    
    return 0

if __name__ == "__main__":
    sys.exit(main()) 