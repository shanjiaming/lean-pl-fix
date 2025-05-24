import re
from typing import Optional, List, Tuple


def extract_theorem_name(theorem_text: str) -> Optional[str]:
    """
    Extract theorem name from Lean theorem text.
    
    Args:
        theorem_text: Lean theorem text
        
    Returns:
        Theorem name or None if not found
    """
    # Pattern to match theorem name
    pattern = r'theorem\s+([a-zA-Z_][a-zA-Z0-9_]*)'
    match = re.search(pattern, theorem_text)
    return match.group(1) if match else None


def extract_theorem_statement(theorem_text: str) -> Optional[str]:
    """
    Extract theorem statement (type) from Lean theorem text.
    
    Args:
        theorem_text: Lean theorem text
        
    Returns:
        Theorem statement or None if not found
    """
    # Pattern to match theorem statement between : and :=
    pattern = r'theorem\s+[^:]*:\s*(.*?)\s*:='
    match = re.search(pattern, theorem_text, re.DOTALL)
    if match:
        return match.group(1).strip()
    return None


def validate_lean_syntax(code: str) -> bool:
    """
    Basic validation of Lean syntax.
    
    Args:
        code: Lean code to validate
        
    Returns:
        True if basic syntax appears valid
    """
    # Basic checks for common syntax errors
    
    # Check for balanced parentheses
    paren_count = code.count('(') - code.count(')')
    if paren_count != 0:
        return False
    
    # Check for balanced braces
    brace_count = code.count('{') - code.count('}')
    if brace_count != 0:
        return False
    
    # Check for balanced brackets
    bracket_count = code.count('[') - code.count(']')
    if bracket_count != 0:
        return False
    
    return True


def format_lean_code(code: str, indent_size: int = 2) -> str:
    """
    Basic formatting of Lean code.
    
    Args:
        code: Lean code to format
        indent_size: Number of spaces for indentation
        
    Returns:
        Formatted code
    """
    lines = code.split('\n')
    formatted_lines = []
    indent_level = 0
    
    for line in lines:
        stripped = line.strip()
        if not stripped:
            formatted_lines.append('')
            continue
        
        # Decrease indent for closing braces/keywords
        if stripped.startswith('}') or stripped.startswith('end'):
            indent_level = max(0, indent_level - 1)
        
        # Add indentation
        formatted_line = ' ' * (indent_level * indent_size) + stripped
        formatted_lines.append(formatted_line)
        
        # Increase indent for opening braces/keywords
        if stripped.endswith('{') or stripped.startswith('begin'):
            indent_level += 1
    
    return '\n'.join(formatted_lines)


def parse_lean_error(error_text: str) -> Optional[dict]:
    """
    Parse Lean error message to extract useful information.
    
    Args:
        error_text: Lean error message
        
    Returns:
        Dictionary with error information or None
    """
    # Pattern to match Lean error format
    pattern = r'(\d+):(\d+):\s*(error|warning):\s*(.*)'
    match = re.search(pattern, error_text)
    
    if match:
        return {
            'line': int(match.group(1)),
            'column': int(match.group(2)),
            'type': match.group(3),
            'message': match.group(4).strip()
        }
    
    return None 