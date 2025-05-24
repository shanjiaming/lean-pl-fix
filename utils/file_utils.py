import os
import shutil
import hashlib
from pathlib import Path
from typing import List, Optional, Union


def ensure_directory(path: Union[str, Path]) -> Path:
    """
    Ensure that a directory exists, creating it if necessary.
    
    Args:
        path: Directory path to ensure
        
    Returns:
        Path object of the directory
    """
    path_obj = Path(path)
    path_obj.mkdir(parents=True, exist_ok=True)
    return path_obj


def read_file_safe(file_path: Union[str, Path], encoding: str = 'utf-8') -> Optional[str]:
    """
    Safely read a file, returning None if it doesn't exist or can't be read.
    
    Args:
        file_path: Path to the file
        encoding: File encoding
        
    Returns:
        File content or None if error
    """
    try:
        with open(file_path, 'r', encoding=encoding) as f:
            return f.read()
    except (FileNotFoundError, IOError, UnicodeDecodeError):
        return None


def write_file_safe(file_path: Union[str, Path], content: str, 
                   encoding: str = 'utf-8', backup: bool = False) -> bool:
    """
    Safely write content to a file.
    
    Args:
        file_path: Path to the file
        content: Content to write
        encoding: File encoding
        backup: Whether to create a backup if file exists
        
    Returns:
        True if successful, False otherwise
    """
    try:
        path_obj = Path(file_path)
        
        # Create backup if requested and file exists
        if backup and path_obj.exists():
            backup_file(file_path)
        
        # Ensure parent directory exists
        ensure_directory(path_obj.parent)
        
        with open(file_path, 'w', encoding=encoding) as f:
            f.write(content)
        return True
    except (IOError, UnicodeEncodeError):
        return False


def find_files_by_extension(directory: Union[str, Path], 
                           extension: str, recursive: bool = True) -> List[Path]:
    """
    Find all files with a specific extension in a directory.
    
    Args:
        directory: Directory to search
        extension: File extension (with or without dot)
        recursive: Whether to search recursively
        
    Returns:
        List of matching file paths
    """
    directory = Path(directory)
    if not directory.exists():
        return []
    
    # Ensure extension starts with dot
    if not extension.startswith('.'):
        extension = '.' + extension
    
    if recursive:
        pattern = f"**/*{extension}"
        return list(directory.glob(pattern))
    else:
        pattern = f"*{extension}"
        return list(directory.glob(pattern))


def get_file_hash(file_path: Union[str, Path], algorithm: str = 'md5') -> Optional[str]:
    """
    Get hash of a file.
    
    Args:
        file_path: Path to the file
        algorithm: Hash algorithm ('md5', 'sha1', 'sha256')
        
    Returns:
        Hash string or None if error
    """
    try:
        hash_obj = hashlib.new(algorithm)
        with open(file_path, 'rb') as f:
            for chunk in iter(lambda: f.read(4096), b""):
                hash_obj.update(chunk)
        return hash_obj.hexdigest()
    except (FileNotFoundError, IOError, ValueError):
        return None


def backup_file(file_path: Union[str, Path], backup_suffix: str = '.bak') -> Optional[Path]:
    """
    Create a backup of a file.
    
    Args:
        file_path: Path to the file to backup
        backup_suffix: Suffix for backup file
        
    Returns:
        Path to backup file or None if error
    """
    try:
        source = Path(file_path)
        if not source.exists():
            return None
        
        backup_path = source.with_suffix(source.suffix + backup_suffix)
        shutil.copy2(source, backup_path)
        return backup_path
    except (IOError, OSError):
        return None 