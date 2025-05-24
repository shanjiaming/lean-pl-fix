import logging
import time
from enum import Enum
from typing import Optional, Any
from functools import wraps


class LogLevel(Enum):
    """Log levels"""
    DEBUG = logging.DEBUG
    INFO = logging.INFO
    WARNING = logging.WARNING
    ERROR = logging.ERROR
    CRITICAL = logging.CRITICAL


def setup_logger(name: str, level: LogLevel = LogLevel.INFO, 
                log_file: Optional[str] = None) -> logging.Logger:
    """
    Setup a logger with specified configuration.
    
    Args:
        name: Logger name
        level: Log level
        log_file: Optional log file path
        
    Returns:
        Configured logger
    """
    logger = logging.getLogger(name)
    logger.setLevel(level.value)
    
    # Clear existing handlers
    logger.handlers.clear()
    
    # Create formatter
    formatter = logging.Formatter(
        '%(asctime)s - %(name)s - %(levelname)s - %(message)s'
    )
    
    # Console handler
    console_handler = logging.StreamHandler()
    console_handler.setFormatter(formatter)
    logger.addHandler(console_handler)
    
    # File handler if specified
    if log_file:
        file_handler = logging.FileHandler(log_file)
        file_handler.setFormatter(formatter)
        logger.addHandler(file_handler)
    
    return logger


def log_execution_time(logger: Optional[logging.Logger] = None):
    """
    Decorator to log execution time of functions.
    
    Args:
        logger: Logger to use (creates default if None)
    """
    if logger is None:
        logger = setup_logger('execution_timer')
    
    def decorator(func):
        @wraps(func)
        def wrapper(*args, **kwargs):
            start_time = time.time()
            try:
                result = func(*args, **kwargs)
                execution_time = time.time() - start_time
                logger.info(f"{func.__name__} executed in {execution_time:.4f} seconds")
                return result
            except Exception as e:
                execution_time = time.time() - start_time
                logger.error(f"{func.__name__} failed after {execution_time:.4f} seconds: {e}")
                raise
        return wrapper
    return decorator


def create_progress_bar(total: int, description: str = "Progress") -> Any:
    """
    Create a simple progress bar (placeholder implementation).
    
    Args:
        total: Total number of items
        description: Description for the progress bar
        
    Returns:
        Progress bar object (simplified)
    """
    class SimpleProgressBar:
        def __init__(self, total, description):
            self.total = total
            self.description = description
            self.current = 0
        
        def update(self, n=1):
            self.current += n
            percent = (self.current / self.total) * 100
            print(f"\r{self.description}: {self.current}/{self.total} ({percent:.1f}%)", end="")
            if self.current >= self.total:
                print()  # New line when complete
        
        def close(self):
            if self.current < self.total:
                print()  # Ensure new line
    
    return SimpleProgressBar(total, description) 