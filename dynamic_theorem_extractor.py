#!/usr/bin/env python3
"""
Dynamic Theorem Extractor

Uses lean_interact to dynamically query theorems from Lean environment,
replacing static file parsing with accurate runtime queries.
Based on the #find_in_ns command approach.
"""

from typing import List, Dict
from lean_interact import Command, LeanServer, LeanREPLConfig, TempRequireProject


class DynamicTheoremExtractor:
    """
    Dynamic theorem extractor that queries Lean environment directly
    instead of parsing static files.
    """
    
    def __init__(self, repl_path: str = "/Users/sjm/coding/projects/Newton/repl"):
        """Initialize the extractor with lean_interact configuration."""
        self.config = LeanREPLConfig(
            local_repl_path=repl_path,
            lean_version="v4.21.0-rc3",
            project=TempRequireProject("mathlib")
        )
        self.server = None
        self._setup_commands = None
    
    def _get_server(self) -> LeanServer:
        """Get or create Lean server instance."""
        if self.server is None:
            self.server = LeanServer(self.config)
        return self.server
    
    def _setup_theorem_finder(self):
        """Setup the #find_in_module command in Lean environment."""
        setup_code = '''import Lean
import Mathlib
open Lean Elab Command Term

/--
`#find_in_module My.Module.Name`
Finds all theorems defined in the specified module (file).
-/
syntax (name := findInModule) "#find_in_module" ident : command

@[command_elab findInModule]
def elabFindInModule : CommandElab := fun stx => do
  runTermElabM fun _ => do
    let moduleName := stx[1].getId
    let env ← getEnv
    let some modIdx := env.getModuleIdx? moduleName
      | logError m!"Module `{moduleName}` not found. Make sure it's imported."
        return

    let thms := env.constants.toList.filter fun (declName, cinfo) =>
      let isTheorem := match cinfo with | .thmInfo _ => true | _ => false
      -- Check if the theorem's module index matches the one we found
      isTheorem && env.getModuleIdxFor? declName == some modIdx

    if thms.isEmpty then
      logInfo m!"[find_in_module] No theorems found in module `{moduleName}`."
    else
      logInfo m!"--- Theorems in module `{moduleName}` ---"
      for (name, info) in thms do
        logInfo m!"{name} : {info.type}"
'''
        
        server = self._get_server()
        response = server.run(Command(cmd=setup_code))
        
        # Check for errors in setup
        errors = [msg for msg in response.messages if msg.severity == 'error']
        if errors:
            raise RuntimeError(f"Failed to setup theorem finder: {[e.data for e in errors]}")
    
    def find_theorems_in_modules(self, module_names: List[str]) -> List[Dict[str, str]]:
        """
        Find all theorems defined in multiple modules (files) in a single query.
        
        Args:
            module_names: List of module names to search (e.g., ["Mathlib.Algebra.Order.Group.Unbundled.Abs", "Mathlib.Data.Real.Basic"])
            
        Returns:
            List of dicts with 'name' and 'type' keys
        """
        server = self._get_server()
        
        # Create multiple #find_in_module queries in one go
        module_queries = '\n'.join([f"#find_in_module {module}" for module in module_names])
        
        # Create the complete Lean code with setup and multiple queries
        complete_code = f'''import Lean
import Mathlib
open Lean Elab Command Term

/--
`#find_in_module My.Module.Name`
Finds all theorems defined in the specified module (file).
-/
syntax (name := findInModule) "#find_in_module" ident : command

@[command_elab findInModule]
def elabFindInModule : CommandElab := fun stx => do
  runTermElabM fun _ => do
    let moduleName := stx[1].getId
    let env ← getEnv
    let some modIdx := env.getModuleIdx? moduleName
      | logError m!"Module `{{moduleName}}` not found. Make sure it's imported."
        return

    let thms := env.constants.toList.filter fun (declName, cinfo) =>
      let isTheorem := match cinfo with | .thmInfo _ => true | _ => false
      -- Check if the theorem's module index matches the one we found
      isTheorem && env.getModuleIdxFor? declName == some modIdx

    if thms.isEmpty then
      logInfo m!"[find_in_module] No theorems found in module `{{moduleName}}`."
    else
      logInfo m!"--- Theorems in module `{{moduleName}}` ---"
      for (name, info) in thms do
        logInfo m!"{{name}} : {{info.type}}"

{module_queries}
'''
        
        response = server.run(Command(cmd=complete_code))
        
        # Extract theorem information from response messages
        theorems = []
        for msg in response.messages:
            if msg.severity == 'info' and ' : ' in msg.data:
                # Skip the header message
                if not msg.data.startswith('[find_in_module]') and not msg.data.startswith('--- Theorems in module'):
                    # Parse "theorem_name : theorem_type"
                    parts = msg.data.split(' : ', 1)
                    if len(parts) == 2:
                        theorems.append({
                            'name': parts[0].strip(),
                            'type': parts[1].strip()
                        })
        
        return theorems
    
    
    
    def extract_related_theorems(self, identifier_to_module_map: Dict[str, str]) -> List[str]:
        """
        Extract related theorems using dynamic queries instead of static file parsing.
        
        Args:
            identifier_to_module_map: Map from identifiers to their modules
            
        Returns:
            List of theorem names
        """
        all_theorems = set()
        identifiers = list(identifier_to_module_map.keys())
        
        print(f"🔍 Extracting theorems dynamically for identifiers: {identifiers}")
        
        # Strategy 1: Use modules from identifier_to_module_map (batch query)
        modules_from_map = list(set(identifier_to_module_map.values()))
        print(f"   📋 Searching {len(modules_from_map)} modules in batch: {modules_from_map}")
        
        try:
            theorems = self.find_theorems_in_modules(modules_from_map)
            theorem_names = [t['name'] for t in theorems]
            all_theorems.update(theorem_names)
            print(f"   ✅ Found {len(theorem_names)} theorems from {len(modules_from_map)} modules")
            # Show first few theorems for debugging
            if len(theorem_names) <= 10:
                print(f"      Examples: {theorem_names}")
            else:
                print(f"      Examples: {theorem_names[:10]}...")
        except Exception as e:
            print(f"   ⚠️  Error searching modules: {e}")
            import traceback
            traceback.print_exc()
        
        result = list(all_theorems)
        print(f"   🎉 Total unique theorems found: {len(result)}")
        
        return result
    
    def close(self):
        """Close the Lean server connection."""
        if self.server:
            # lean_interact doesn't have explicit close method, 
            # but we can reset the reference
            self.server = None


def test_dynamic_extractor():
    """Test the dynamic theorem extractor."""
    print("🧪 Testing Dynamic Theorem Extractor")
    print("=" * 50)
    
    extractor = DynamicTheoremExtractor()
    
    try:
        # Test with the aime_1983_p2 identifiers
        test_identifiers = {
            "abs_of_nonneg": "Mathlib.Algebra.Order.Group.Unbundled.Abs",
            "abs_of_nonpos": "Mathlib.Algebra.Order.Group.Unbundled.Abs",
            "abs": "Mathlib.Algebra.Order.Group.Unbundled.Abs",
            "linarith": "Mathlib.Tactic.Linarith.Frontend"
        }
        
        theorems = extractor.extract_related_theorems(test_identifiers)
        
        print(f"\n📊 Results:")
        print(f"   Found {len(theorems)} related theorems")
        
        if theorems:
            print(f"\n📝 First 20 theorems:")
            for i, theorem in enumerate(theorems[:20], 1):
                print(f"   {i:2d}. {theorem}")
            
            if len(theorems) > 20:
                print(f"   ... and {len(theorems) - 20} more")
        
        return theorems
        
    except Exception as e:
        print(f"   ❌ Test failed: {e}")
        import traceback
        traceback.print_exc()
        return None
    finally:
        extractor.close()


if __name__ == "__main__":
    test_dynamic_extractor()