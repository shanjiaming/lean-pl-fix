import re
from typing import List, Optional, Tuple


def clean_whitespace(text: str) -> str:
    """
    Clean excessive whitespace from text.
    
    Args:
        text: Input text
        
    Returns:
        Cleaned text
    """
    # Remove leading/trailing whitespace
    text = text.strip()
    
    # Replace multiple spaces with single space
    text = re.sub(r' +', ' ', text)
    
    # Replace multiple newlines with double newline
    text = re.sub(r'\n\s*\n\s*\n+', '\n\n', text)
    
    return text


def extract_code_blocks(text: str, language: str = None) -> List[str]:
    """
    Extract code blocks from markdown-style text.
    
    Args:
        text: Input text
        language: Specific language to extract (optional)
        
    Returns:
        List of code blocks
    """
    if language:
        pattern = rf'```{re.escape(language)}\n(.*?)\n```'
    else:
        pattern = r'```(?:\w+)?\n(.*?)\n```'
    
    matches = re.findall(pattern, text, re.DOTALL)
    return matches


def normalize_lean_code(code: str) -> str:
    """
    Normalize Lean code formatting.
    
    Args:
        code: Lean code
        
    Returns:
        Normalized code
    """
    # Remove excessive whitespace
    code = clean_whitespace(code)
    
    # Normalize indentation (convert tabs to spaces)
    code = code.expandtabs(2)
    
    # Remove trailing whitespace from lines
    lines = code.split('\n')
    lines = [line.rstrip() for line in lines]
    
    return '\n'.join(lines)


def count_lines(text: str) -> int:
    """
    Count number of lines in text.
    
    Args:
        text: Input text
        
    Returns:
        Number of lines
    """
    if not text:
        return 0
    return len(text.split('\n'))


def split_by_delimiter(text: str, delimiter: str, max_splits: int = -1) -> List[str]:
    """
    Split text by delimiter with optional limit.
    
    Args:
        text: Input text
        delimiter: Delimiter to split by
        max_splits: Maximum number of splits (-1 for unlimited)
        
    Returns:
        List of split parts
    """
    if max_splits == -1:
        return text.split(delimiter)
    else:
        return text.split(delimiter, max_splits) 