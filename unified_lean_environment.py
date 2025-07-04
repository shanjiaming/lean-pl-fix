from lean_interact import LocalProject, TempRequireProject, LeanREPLConfig, LeanServer, Command
from typing import Dict
import timeout_decorator


class UnifiedLeanEnvironment:
    """
    Manages Lean server and environments with header caching for better performance.
    Each unique header gets its own cached environment.
    """
    
    def __init__(self):
        self.config = LeanREPLConfig(local_repl_path = "/Users/sjm/coding/projects/Newton/repl", lean_version="v4.21.0-rc3", project=TempRequireProject("mathlib"))
        self.server = LeanServer(self.config)
        self._header_envs: Dict[str, str] = {}  # header_content -> env_id
    
    def get_or_create_header_env(self, header_content: str):
        """Get or create a cached environment for the given header"""
        if header_content in self._header_envs:
            return self._header_envs[header_content]

        @timeout_decorator.timeout(60, timeout_exception=timeout_decorator.timeout_decorator.TimeoutError)
        def run_with_timeout():
            return self.server.run(Command(cmd=header_content))

        try:
            result = run_with_timeout()
        except timeout_decorator.timeout_decorator.TimeoutError:
            self.reset()
            raise
        
        # Cache the environment before returning it
        self._header_envs[header_content] = result.env
        return result.env
    
    def run_with_header(self, header_content: str, input_content: str, **kwargs):
        """Run a command with the specified header environment"""
        # Get the environment for this header
        # breakpoint()
        env = self.get_or_create_header_env(header_content)
        
        @timeout_decorator.timeout(60, timeout_exception=timeout_decorator.timeout_decorator.TimeoutError)
        def run_with_timeout():
            return self.server.run(Command(cmd=input_content, env=env, **kwargs))

        try:
            ret = run_with_timeout()
        except timeout_decorator.timeout_decorator.TimeoutError:
            self.reset()
            raise
        
        if env > 8:
            self.reset()
        return ret
    
    def reset(self):
        del self.server
        self.server = LeanServer(self.config)
        self._header_envs.clear()


# Global unified environment instance
unified_env = UnifiedLeanEnvironment()