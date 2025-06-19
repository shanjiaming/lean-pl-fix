from lean_interact import LocalProject, TempRequireProject, LeanREPLConfig, LeanServer, AutoLeanServer, Command
import re
from typing import Dict, Optional
from unified_problem_manager import Problem, problem_manager
import concurrent.futures
import timeout_decorator

localprojectdir = "../matheye/benchmarks/"

# def throw_head(input_str: str) -> str:
#     """
#     remove line that starts with import, set_option, open
#     """
#     return '\n'.join([line for line in input_str.split('\n') if not line.startswith("import") and not line.startswith("set_option") and not line.startswith("open")])

def convert_theorem_to_example_cmd(input_str: str) -> str:
    """
    Converts a string containing a Lean theorem into a command string
    by replacing the first 'theorem' with 'example := by have'
    and indenting the subsequent lines of the original theorem.
    """
    lines = input_str.split('\n')
    output_lines = []
    theorem_found = False
    indent_prefix = "  " # Two spaces for indentation

    for i, line in enumerate(lines):
        if not theorem_found:
            theorem_keyword_index = line.find("theorem")
            if theorem_keyword_index != -1:
                theorem_found = True
                # Part of the line before "theorem"
                before_theorem = line[:theorem_keyword_index]
                # Part of the line from "theorem" onwards
                after_theorem_keyword = line[theorem_keyword_index + len("theorem"):]

                output_lines.append(f"{before_theorem}example := by")
                # Add the rest of the original theorem line as the first part of the 'have', indented
                output_lines.append(f"{indent_prefix}have{after_theorem_keyword}")
            else:
                output_lines.append(line) # Line before theorem definition
        else:
            # Lines after the theorem line started, or subsequent lines of a multi-line theorem definition
            output_lines.append(f"{indent_prefix}{line}")
            
    return '\n'.join(output_lines)

def convert_have_to_theorem(proof_string: str) -> str:
    """Converts a 'have' statement string to a 'theorem' statement string."""
    # Check if the string actually starts with "have " or "have " (with potential leading whitespace)
    stripped_string = proof_string.lstrip()
    if stripped_string.startswith("have "):
        # Find the index of "have" in the original string to preserve leading whitespace
        have_keyword_start_index = proof_string.find("have ")
        # Replace the first occurrence of "have" with "theorem"
        return proof_string[:have_keyword_start_index] + "theorem" + proof_string[have_keyword_start_index + len("have"):]
    elif stripped_string.startswith("have:") or stripped_string.startswith("have") and ":=" in stripped_string: # handles anonymous have
        have_keyword_start_index = proof_string.find("have")
        return proof_string[:have_keyword_start_index] + "theorem" + proof_string[have_keyword_start_index + len("have"):]
    assert False, f"Could not convert have to theorem: {proof_string}"

def convert_theorem_to_have(proof_string: str) -> str:
    """Converts a 'theorem' statement string back to a 'have' statement string."""
    stripped_string = proof_string.lstrip()
    if stripped_string.startswith("theorem "):
        theorem_keyword_start_index = proof_string.find("theorem ")
        return proof_string[:theorem_keyword_start_index] + "have" + proof_string[theorem_keyword_start_index + len("theorem"):]
    # Check for theorem without a name, e.g. "theorem : type := by ..."
    elif stripped_string.startswith("theorem:") or stripped_string.startswith("theorem") and ":=" in stripped_string:
        theorem_keyword_start_index = proof_string.find("theorem")
        return proof_string[:theorem_keyword_start_index] + "have" + proof_string[theorem_keyword_start_index + len("theorem"):]
    return proof_string # Return original if not a clear 'theorem' statement

# Define an enhanced class to wrap tactics with additional attributes
class TacticNode:
    def __init__(self, tactic):
        self.tactic = tactic
        self.subhaves = []
        self.by_block_goals = None # Added for storing goals specific to 'by' block context
        self.parent = None # Added parent attribute
        self._parsed_structure_cache = None # Cache for parse_have_structure
    
    @property
    def start_pos(self):
        return self.tactic.start_pos
    
    @property
    def end_pos(self):
        return self.tactic.end_pos
    
    @property
    def goals(self):
        return self.tactic.goals
    
    def is_have(self):
        """Check if this tactic is a 'have' statement"""
        tactic_text = self.tactic.tactic
        has_by = re.search(r':=\s+by\b', tactic_text) is not None
        
        return tactic_text.strip().startswith("have") and has_by
    
    def get_other_tactics(self):
        """Get tactics that are part of this node but are not subhaves"""
        # This would require the original list of all tactics and checking which ones
        # are contained within this node's range but are not in subhaves
        # For now, we'll just return a placeholder
        return []
    
    def parse_have_structure(self):
        """Public accessor for the parsed structure, uses caching."""
        if not self.is_have(): # Parsing only makes sense for 'have' statements
            return None
        if self._parsed_structure_cache is None:
            self._parsed_structure_cache = self._compute_parsed_structure()
        return self._parsed_structure_cache

    def _compute_parsed_structure(self):
        """Parse the structure of a have statement into components."""
        tactic_text = self.tactic.tactic

        name = "this" # Default to 'this' for anonymous haves
        is_implicit_name = True
        
        # Try to find an explicit name: have NAME ...
        # Name should be between have and the next whitespace or colon
        head = tactic_text.split(":=")[0]
        explicit_name_match = re.search(r'have\s+([^\s\(:]+)', head)
        if explicit_name_match:
            name = explicit_name_match.group(1)
            is_implicit_name = False
        # Try to extract the type string: ... : TYPE :=
        # Format: have [name] [conditions] : TYPE :=
        # type_str should contain both: [conditions] : [goal]


        type_str = "_" # Default placeholder type
        
        # Step 1: Find the starting position after "have" and name if present
        have_pos = tactic_text.find("have")
        start_pos = have_pos + len("have")
        name_pos = -1
        
        # Skip spaces after "have"
        while start_pos < len(tactic_text) and tactic_text[start_pos].isspace():
            start_pos += 1
            
        # Find name position (if not implicit)
        if not is_implicit_name:
            name_pos = start_pos
            start_pos = start_pos + len(name)
            # Skip spaces after name
            while start_pos < len(tactic_text) and tactic_text[start_pos].isspace():
                start_pos += 1
        
        # Step 2: Find the := that ends the type
        pos = start_pos
        paren_level = 0
        type_end = -1
        
        while pos < len(tactic_text) - 1:  # -1 because we check pos+1 for :=
            # Handle parentheses to track nesting level
            if tactic_text[pos] == '(':
                paren_level += 1
            elif tactic_text[pos] == ')':
                paren_level -= 1
            
            # Find the := at the top level
            if paren_level == 0 and tactic_text[pos:pos+2] == ':=':
                type_end = pos
                break
            
            pos += 1
        
        # Extract the complete type string if we found the end marker
        full_type_str = tactic_text[start_pos:type_end].strip()

        hypotheses_part = ""
        goal_part = ""
        paren_level = 0
        last_colon_idx = -1

        # Iterate from right to left to find the last colon at paren_level 0
        # This colon separates hypotheses from the final goal assertion of THIS have statement.
        for i in range(len(full_type_str) - 1, -1, -1):
            char = full_type_str[i]
            if char == ')':
                paren_level += 1
            elif char == '(':
                paren_level -= 1
            elif char == ':' and paren_level == 0:
                last_colon_idx = i
                break
        
        if last_colon_idx != -1:
            hypotheses_part = full_type_str[:last_colon_idx].strip()
            goal_part = full_type_str[last_colon_idx+1:].strip()
        else:
            # No colon found at the main level, so the whole string is the goal.
            hypotheses_part = ""
            goal_part = full_type_str
        
        return {
            "name": name,
            "type": full_type_str, # Original full type string (e.g., "hyps : goal" or "goal")
            "hypotheses_str": hypotheses_part, # Just the hypotheses part (e.g., "(x:N) (h:x>0)")
            "goal_type_str": goal_part,     # Just the goal part (e.g., "x = x")
            "is_implicit_name": is_implicit_name,
            "full_text": tactic_text, 
            # "by_block_goals": self.by_block_goals
        }
    
    def get_have_name(self):
        """Extract the name of the have statement, defaulting to 'this' if anonymous."""
        structure = self.parse_have_structure() # This will now use the cached version
        return structure.get("name") if structure else None # Will be 'this' if anonymous and parsed
    
    def get_simplified_representation(self):
        """
        Get a simplified representation of this tactic, e.g., 'have name : type := by sorry'
        Uses 'this' for anonymous haves.
        """
        structure = self.parse_have_structure()
        if not structure:
            return self.tactic.tactic

        name_to_use = structure["name"] # This will be 'this' if originally anonymous
        type_str = structure.get("type", "_") # Get parsed type, or default
        
        return f"have {name_to_use} {type_str} := by sorry"
    
    def extract_dependencies_from_goals(self):
        """
        Collects context strings for creating a self-contained proof. This includes:
        1. Definitions from preceding siblings of the current node (and its ancestors in turn) 
           in the format "name full_type_string" (e.g., "h1 (x:N) : x > 0").
        2. Hypotheses from an ancestor 'have' statement (e.g., "(x y : ℕ) (h : x > y)").
        The parent/ancestor 'have' statements themselves are not collected as completed proofs, only their hypotheses.
        The order of strings returned is from the outermost/earliest defined to innermost/latest.
        """
        dependencies = []
        # seen_signatures tracks the exact strings added to dependencies to avoid duplicates.
        seen_signatures = set() 

        node_iterator = self
        while node_iterator.parent:
            parent = node_iterator.parent

            # 1. Collect DEFINITIONS from preceding siblings of `node_iterator`
            # These are children of `parent` that appear before `node_iterator`.
            if parent.subhaves: 
                try:
                    child_index = parent.subhaves.index(node_iterator)
                    for i in range(child_index):
                        sibling = parent.subhaves[i]
                        if sibling.is_have():
                            structure = sibling.parse_have_structure() # Uses caching
                            if structure:
                                # This is a completed proof, use its name and full type string.
                                # structure['type'] is the full_type_str (e.g. "hyps : goal" or "goal")
                                dep_text = f"{structure['name']} {structure['type']}" 
                                if dep_text not in seen_signatures:
                                    dependencies.append(f"({dep_text})")
                                    seen_signatures.add(dep_text)
                except ValueError:
                    # node_iterator not in parent.subhaves, should not happen in a well-formed tree.
                    pass

            # 2. Collect HYPOTHESES from the `parent` (ancestor of original `self`)
            # These are contextual assumptions from the enclosing 'have' block.
            if parent.is_have():
                parent_structure = parent.parse_have_structure() # Uses caching
                if parent_structure:
                    hyp_str = parent_structure['hypotheses_str']
                    if hyp_str and hyp_str not in seen_signatures: # Add if non-empty and unique
                        dependencies.append(hyp_str)
                        seen_signatures.add(hyp_str)
            
            node_iterator = parent # Move up the tree for the next iteration

        dependencies.reverse()
        return dependencies
    
    # def create_self_contained_proof(self, body_override: str | None = None):
    #     """
    #     Create a self-contained version of this proof by incorporating
    #     all external dependencies from its goals and context.
    #     Optionally, an existing body (from ':=' onwards) can be provided via body_override.
        
    #     Returns:
    #         tuple: (self_contained_proof, original_tactic_text)
    #     """
    #     original_tactic_text = self.tactic.tactic

    #     parsed_self = self.parse_have_structure()
    #     if not parsed_self: # Should not happen if self.is_have() was true.
    #         return original_tactic_text, original_tactic_text
        
    #     actual_body_to_use = ""
    #     if body_override is not None:
    #         actual_body_to_use = body_override
    #     else:
    #         colon_equals_pos = original_tactic_text.find(':=')
    #         if colon_equals_pos != -1:
    #             actual_body_to_use = original_tactic_text[colon_equals_pos:]
    #         else:
    #             return original_tactic_text, original_tactic_text 

    #     name = parsed_self['name']
    #     current_hypotheses_str = parsed_self['hypotheses_str']
    #     current_goal_type_str = parsed_self['goal_type_str']

    #     # Get ordered list of context strings (completed sibling proofs & ancestor hypotheses)
    #     collected_context_strings = self.extract_dependencies_from_goals()

    #     # Assemble all parameter-like parts
    #     # Order: context from ancestors/siblings, then current node's own hypotheses
    #     param_parts = []
    #     param_parts.extend(collected_context_strings)
    #     if current_hypotheses_str: # Add current node's own hypotheses if they exist
    #         param_parts.append(current_hypotheses_str)
        
    #     # Join all parts that form the signature before the final colon
    #     # Filter out empty or whitespace-only strings to prevent multiple spaces
    #     params_string = ' '.join(filter(str.strip, param_parts))

    #     new_signature_part = f"have {name}"
    #     if params_string: # Add params_string only if it's not empty
    #         new_signature_part += f" {params_string}"
    #     new_signature_part += f" : {current_goal_type_str}"
        
    #     new_signature_part = new_signature_part.replace("_shadow_", "✝")
        
    #     self_contained_tactic = f"{new_signature_part}{actual_body_to_use}"
    #     return self_contained_tactic, original_tactic_text



    def create_self_contained_proof(self, body_override: str | None = None):
        """
        Create a self-contained version of this proof by incorporating
        all external dependencies from its goals.
        Optionally, an existing body (from ':=' onwards) can be provided via body_override.
        
        Returns:
            tuple: (self_contained_proof, original_tactic_text)
        """
        original_tactic_text = self.tactic.tactic

        structure = self.parse_have_structure()
        if not structure:
            return original_tactic_text, original_tactic_text
        
        actual_body_to_use = ""
        if body_override is not None:
            # Assuming body_override is already in the format ":= by ..." as returned by get_body()
            actual_body_to_use = body_override
        else:
            colon_equals_pos = original_tactic_text.find(':=')
            if colon_equals_pos != -1:
                actual_body_to_use = original_tactic_text[colon_equals_pos:]
            else:
                # This implies original tactic is not a valid 'have ... := by ...' structure
                return original_tactic_text, original_tactic_text 

        dependencies = self.extract_dependencies_from_goals()
    
        name = structure["name"]
        # goal_type = structure.get("by_block_goals") # P from 'have name : P :='
        goal_type = self.by_block_goals # P from 'have name : P :='
        assert goal_type is not None
        # Parse goal_type into signature format
        goal = goal_type.split("⊢")[1].strip()
        goal_type = goal_type.split("⊢")[0].strip()
        # lines = goal_type.strip().split('\n')
        # dependencies = []
        
        # for line in lines:
        #     line = line.strip()
        #     dependencies.append(f"({line})")
        
        # The instruction is to split goal_type (which contains hypotheses as a string)
        # into a list called `dependencies`. Each element of this list should be a string
        # that starts with the pattern "non-whitespace characters :".

        # Initialize a new list for the dependencies.
        # This will overwrite the `dependencies` list populated by `self.extract_dependencies_from_goals()`
        # earlier in the method.
        new_dependencies_list = []
        if goal_type:  # Ensure goal_type string (hypotheses part) is not empty
            lines = goal_type.split('\n')
            current_h = ""
            for line in lines:
                if re.match(r'^(?! )[^\(\)\n:]+ :', line):
                    if current_h:
                        new_dependencies_list.append(f"({current_h})")
                    current_h = line
                else:
                    current_h += line
            if current_h:
                new_dependencies_list.append(f"({current_h})")
        
        dependencies = new_dependencies_list


        # Combine dependencies and goal into signature format
        goal_type = f"{' '.join(dependencies)} : {goal}"

        

        new_signature_part = ""
        new_signature_part = f"have {name} {goal_type} "
        new_signature_part = new_signature_part.replace("_shadow_", "✝")
        
        self_contained_tactic = f"{new_signature_part}{actual_body_to_use}"
        return self_contained_tactic, original_tactic_text


# Helper function to get the signature part of a tactic string
def get_signature(tactic_string: str) -> str:
    """Extracts the signature (everything before ':=') from a tactic string."""
    colon_equals_pos = tactic_string.find(":=")
    if colon_equals_pos != -1:
        return tactic_string[:colon_equals_pos].strip()
    return tactic_string.strip() # Fallback if ':=' not found, though unlikely for 'have'

# Helper function to get the body part of a tactic string
def get_body(tactic_string: str) -> str:
    """Extracts the body (everything from ':=' onwards) from a tactic string."""
    colon_equals_pos = tactic_string.find(":=")
    if colon_equals_pos != -1:
        return tactic_string[colon_equals_pos:]
    return "" # Fallback if ':=' not found

# Helper function to combine an original signature with a (potentially fixed) body
def revert_to_original_signature_with_fixed_body(original_tactic_string: str, fixed_tactic_string_with_any_signature: str) -> str:
    """
    Combines the signature from the original tactic string with the body
    from a fixed tactic string.
    """
    original_signature = get_signature(original_tactic_string)
    fixed_body = get_body(fixed_tactic_string_with_any_signature)
    return f"{original_signature}{fixed_body}"


# Function to extract a proof framework and child proofs directly from the tree structure
def extract_proof_framework_from_tree(node):
    """
    Extract a proof framework and child proofs directly from the tree structure
    
    Args:
        node (TacticNode): The node containing the complete proof
        
    Returns:
        tuple: (framework, child_proofs)
            - framework: The simplified proof with child haves replaced by sorry
            - child_proofs: Dictionary mapping child names to their complete proofs
    """
    # Start with the original proof
    framework = node.tactic.tactic
    framework = re.sub(r'^(\s*)·\s*(have\b.*)', r'\1·\n\1  \2', framework, flags=re.MULTILINE)
    child_proofs = {}
    
    # Process direct child have statements
    for child in node.subhaves:
        if child.is_have():
            child_name = child.get_have_name()
            if child_name:
                # Store the original child proof
                child_proofs[child_name] = child.tactic.tactic
                
                # Create a simplified version with sorry
                simplified = child.get_simplified_representation()
                
                # Replace the original child proof with the simplified version in the framework
                # We need to handle indentation carefully
                child_tactic = child.tactic.tactic
                # Split both the framework and child tactic into lines to handle indentation
                framework_lines = framework.split('\n')
                child_lines = child_tactic.split('\n')
                
                # Find where the child tactic starts in the framework
                start_idx = -1
                for i, line in enumerate(framework_lines):
                    if line.strip() == child_lines[0].strip():
                        # Check if this is the actual start of the child tactic
                        is_match = True
                        # for j in range(1, len(child_lines)):
                        #     if i + j >= len(framework_lines) or framework_lines[i + j].strip() != child_lines[j].strip():
                        #         is_match = False
                        #         # breakpoint()
                        #         # some unknown reason cause the format of main and child to be different. Omit this check.
                        #         break
                        if is_match:
                            start_idx = i
                            break
                
                # Replace the child tactic with the simplified version
                # Preserve the indentation of the first line
                first_line_indent = len(framework_lines[start_idx]) - len(framework_lines[start_idx].lstrip())
                simplified_lines = simplified.split('\n')
                
                # Determine the end of the child block in the current framework_lines
                child_block_end_exclusive_idx = start_idx + 1
                for j in range(start_idx + 1, len(framework_lines)):
                    line_content = framework_lines[j]
                    current_line_indent = len(line_content) - len(line_content.lstrip()) if line_content.strip() else float('inf')

                    if not line_content.strip() or current_line_indent > first_line_indent:
                        child_block_end_exclusive_idx = j + 1
                    else:
                        break

                indented_simplified_lines = [' ' * first_line_indent + s_line for s_line in simplified_lines]
                linenum = len(framework_lines)
                framework_lines = (
                    framework_lines[:start_idx] +
                    indented_simplified_lines +
                    framework_lines[child_block_end_exclusive_idx:]
                )
                framework = '\n'.join(framework_lines)
                
                print(f"Reconstructed framework:\n{framework}")

    return framework, child_proofs


# Function to extract self-contained proofs directly from the tree structure
def extract_self_contained_proofs_from_tree(node):
    """
    Extract self-contained proofs for all child have statements directly from the tree structure
    
    Args:
        node (TacticNode): The node containing the complete proof
        
    Returns:
        tuple: (framework, self_contained_child_proofs, original_child_proofs)
            - framework: The simplified proof with child haves replaced by sorry
            - self_contained_child_proofs: Dictionary mapping child names to their self-contained proofs
            - original_child_proofs: Dictionary mapping child names to their original proofs
    """
    # Start with the original proof
    framework = node.tactic.tactic
    self_contained_child_proofs = {}
    original_child_proofs = {}
    
    # Process direct child have statements
    for child in node.subhaves:
        if child.is_have():
            child_name = child.get_have_name()
            if child_name:
                # Create a self-contained version of the child proof
                self_contained, original = child.create_self_contained_proof()
                self_contained_child_proofs[child_name] = self_contained
                original_child_proofs[child_name] = original
                
                # Create a simplified version with sorry
                simplified = child.get_simplified_representation()
                
                # Replace the original child proof with the simplified version in the framework
                framework = framework.replace(child.tactic.tactic, simplified)
    
    return framework, self_contained_child_proofs, original_child_proofs


# Function to reconstruct a proof by combining a parent framework with child proofs
def reconstruct_proof(parent_framework, child_proofs, original_proofs=None):
    """
    Reconstruct a complete proof by inserting child proofs into a parent framework
    
    Args:
        parent_framework (str): The parent proof with placeholders for child proofs
        child_proofs (dict): A dictionary mapping child names to their fixed proofs
        original_proofs (dict, optional): Dictionary mapping child names to their original proofs
            If provided, will use these instead of the child_proofs when restoring
        
    Returns:
        str: The reconstructed complete proof
    """
    # Split the framework into lines for easier processing
    framework_lines = parent_framework.split('\n')
    result_lines = []
    
    # Track which child proofs have been replaced already
    replaced_children = set()
    
    # First, find all the locations of child proof placeholders
    child_locations = {}
    for i, line in enumerate(framework_lines):
        line_stripped = line.strip()
        for child_name in child_proofs:
            # More precise matching: ensure this is a complete have statement with sorry
            if line_stripped.startswith(f"have {child_name}") and "by sorry" in line_stripped:
                if child_name not in child_locations:
                    child_locations[child_name] = []
                child_locations[child_name].append(i)
    
    # Process line by line
    i = 0
    while i < len(framework_lines):
        line = framework_lines[i]
        line_stripped = line.strip()
        
        # Check if this line is a child proof placeholder that needs replacement
        replaced = False
        for child_name in child_proofs:
            # Skip if we've already replaced this child
            if child_name in replaced_children:
                continue
                
            # More precise matching: ensure this is a complete have statement with sorry
            if line_stripped.startswith(f"have {child_name}") and "by sorry" in line_stripped:
                # Found a child proof placeholder
                # Extract the fixed child proof
                fixed_child = child_proofs[child_name]
                
                # Split the fixed child proof into lines
                child_lines = fixed_child.split('\n')
                
                # Calculate the indentation of the current line
                indent = len(line) - len(line.strip())
                
                # Add the fixed child proof lines with proper indentation
                for j, child_line in enumerate(child_lines):
                    if j == 0:
                        # Replace the current line with the first line of the fixed child
                        result_lines.append(' ' * indent + child_line)
                    else:
                        # Add the rest of the fixed child lines with proper indentation
                        result_lines.append(' ' * indent + child_line)
                
                # Mark this child as replaced
                replaced_children.add(child_name)
                replaced = True
                break
        
        # If no replacement was made, add the original line
        if not replaced:
            result_lines.append(line)
            
        i += 1
    
    # Join the lines back into a single string
    return '\n'.join(result_lines)


# Internal helper to fix a leaf tactic node
def _fix_leaf_tactic(leaf_node: TacticNode, original_tactic_text: str, fix_single_proof_func: callable) -> str:
    """Helper to fix a leaf tactic node (no sub-proofs), using a provided fixing function."""
    # Create self-contained version for fixing (uses original body)
    self_contained_leaf_framework, _ = leaf_node.create_self_contained_proof() # No body_override here
    
    # Convert to theorem view for fix_single_proof_func
    theorem_view_leaf = convert_have_to_theorem(self_contained_leaf_framework)
    
    # Fix its body (signature is still self-contained, but now starts with 'theorem')
    fixed_leaf_as_theorem = fix_single_proof_func(theorem_view_leaf)
    
    # Convert back to have view
    fixed_leaf_body_with_self_contained_sig = convert_theorem_to_have(fixed_leaf_as_theorem)
    
    # Revert to original signature with the new fixed body
    return revert_to_original_signature_with_fixed_body(
        original_tactic_text,
        fixed_leaf_body_with_self_contained_sig
    )

# Function to fix a complete proof including all subproofs
def fix_complete_proof(root_node, fix_single_proof_func: callable):
    """
    Fix a complete proof by fixing all subproofs and then the main proof,
    using a provided fix_single_proof_func.
    The final returned proof will have all original signatures but fixed bodies.
    """
    # print(f"Fixing complete proof for: {root_node.get_have_name() or 'root example'}")

    # Step 1: Extract the initial framework with 'sorry' placeholders for children,
    # and a map of child names to their original tactic strings.
    # framework_with_sorry_children is like "have R_orig_sig := by own_code; have h_orig_sig := by sorry; ..."
    framework_with_sorry_children, child_proofs_map_name_to_original_text = extract_proof_framework_from_tree(root_node)
    # print(f"Extracted framework with sorry children for {root_node.get_have_name()}:\n{framework_with_sorry_children}")

    # Step 2: Construct a self-contained version of the root_node's framework.
    self_contained_framework_for_root = ""
    if not root_node.is_have():
        # If not a 'have by' structure, its framework likely doesn't need dependency transformation.
        # Use the framework with sorry children (if it's a have) or original tactic.
        self_contained_framework_for_root = framework_with_sorry_children
        if not root_node.is_have(): # If not a 'have' at all, just use its original tactic string.
            self_contained_framework_for_root = root_node.tactic.tactic
    else:
        # It is a 'have by' structure. Create self-contained signature with existing 'sorry' body.
        body_for_root_self_contained = get_body(framework_with_sorry_children)
        generated_self_contained_root, _ = root_node.create_self_contained_proof(body_override=body_for_root_self_contained)
        self_contained_framework_for_root = generated_self_contained_root
    
    # print(f"Constructed self-contained framework for root {root_node.get_have_name()}:\n{self_contained_framework_for_root}")

    # Step 3: Fix the self-contained framework of the root_node.
    # This fixes the root_node's own lines of proof, children remain 'sorry'.
    # The signature is still self-contained.
    
    # Convert to theorem view for fix_single_proof
    theorem_view_root = convert_have_to_theorem(self_contained_framework_for_root)
    
    # e.g., "theorem R_self_cont_sig := by fixed_own_code; have h_self_cont_sig := by sorry; ...; done"
    fixed_root_as_theorem = fix_single_proof_func(theorem_view_root)
    
    # Convert back to have view
    # e.g., "have R_self_cont_sig := by fixed_own_code; have h_self_cont_sig := by sorry; ...; done"
    fixed_version_of_self_contained_root_framework = convert_theorem_to_have(fixed_root_as_theorem)
    
    # print(f"Fixed self-contained root framework for {root_node.get_have_name()} (reverted to have):\n{fixed_version_of_self_contained_root_framework}")

    # Step 4: Fix each child proof.
    # The resulting child proofs will have their original signatures but fixed bodies.
    fixed_child_proofs_final_form = {}
    for name, original_child_tactic_string in child_proofs_map_name_to_original_text.items():
        child_node = None
        for subhave in root_node.subhaves: # Find the child TacticNode
            if subhave.is_have() and subhave.get_have_name() == name:
                child_node = subhave
                break
        
        if not child_node:
            # Should not happen if extract_proof_framework_from_tree is correct
            print(f"Warning: Child node {name} not found for {root_node.get_have_name()}")
            fixed_child_proofs_final_form[name] = original_child_tactic_string # Fallback
            continue

        if child_node.subhaves: # Recursive case: child has its own subproofs
            # print(f"Recursively fixing child: {name} of parent {root_node.get_have_name()}")
            # The result of recursive call is already in final form (original sig, fixed body)
            fixed_grandchild_proof_with_original_sig = fix_complete_proof(child_node, fix_single_proof_func)
            fixed_child_proofs_final_form[name] = fixed_grandchild_proof_with_original_sig
        else: # Leaf case: child has no subproofs
            # print(f"Fixing leaf child: {name} of parent {root_node.get_have_name()}")
            fixed_child_proofs_final_form[name] = _fix_leaf_tactic(child_node, original_child_tactic_string, fix_single_proof_func)
        # print(f"Fixed child '{name}' for parent '{root_node.get_have_name()}':\n{fixed_child_proofs_final_form[name]}")

    # Step 5: Prepare the final framework for reconstruction.
    # This framework should have the root_node's *original* signature,
    # but its *fixed body* (where its own lines are fixed, and children are 'sorry').
    root_original_tactic_string = root_node.tactic.tactic
    
    # fixed_version_of_self_contained_root_framework has self-contained signature + fixed body with sorries
    # We need: original_root_signature + fixed body with sorries
    final_framework_for_reconstruction = revert_to_original_signature_with_fixed_body(
        root_original_tactic_string,
        fixed_version_of_self_contained_root_framework
    )
    # print(f"Final framework for reconstruction (root {root_node.get_have_name()} original sig, fixed body, sorry children):\n{final_framework_for_reconstruction}")
    
    # Step 6: Reconstruct the complete proof using the final framework and fixed children.
    # All parts now have original signatures and fixed bodies.
    reconstructed_proof = reconstruct_proof(final_framework_for_reconstruction, fixed_child_proofs_final_form)
    print(f"Reconstructed proof for {root_node.get_have_name()}:\n{reconstructed_proof}")
    
    return reconstructed_proof


def remove_lean_comments(lean_code: str) -> str:
    """
    Removes comments from a Lean code string.

    Args:
        lean_code: A string containing Lean code.

    Returns:
        A string with comments removed.
    """
    n = len(lean_code)
    result_parts = []
    i = 0
    while i < n:
        # Check for string literals first
        if lean_code[i] == '"':
            result_parts.append(lean_code[i])
            i += 1
            while i < n:
                char = lean_code[i]
                result_parts.append(char)
                if char == '\\': # Handle escape sequences
                    i += 1
                    if i < n:
                        result_parts.append(lean_code[i])
                elif char == '"': # End of string
                    i += 1
                    break
                i += 1
            continue # Continue to the next part of the main loop

        # Check for block comments: /- ... -/
        if i + 1 < n and lean_code[i:i+2] == '/-':
            # Find the end of the block comment
            end_block_comment_idx = lean_code.find('-/', i + 2)
            if end_block_comment_idx != -1:
                i = end_block_comment_idx + 2
            else:
                # Unterminated block comment, goes to end of file
                i = n
            continue

        # Check for single-line comments: -- ...
        if i + 1 < n and lean_code[i:i+2] == '--':
            # Find the end of the line
            end_line_comment_idx = lean_code.find('\n', i + 2)
            if end_line_comment_idx != -1:
                # The newline character itself is not part of the comment
                i = end_line_comment_idx
            else:
                # Comment goes to the end of the file
                i = n
            continue

        # If not a comment or string, it's code
        result_parts.append(lean_code[i])
        i += 1

    return "".join(result_parts)

def _process_tactics_to_tree(tactics):
    """
    Helper function to process tactics into TacticNode tree structure.
    Shared logic extracted from solve_theorem functions.
    """
    # Create TacticNode objects for each tactic
    tactic_nodes = [TacticNode(tactic) for tactic in tactics]

    # Build tree structure in O(n) using a stack
    # Since tactics are printed in top-down order, we can use a stack to track parent tactics
    stack = []
    for node in tactic_nodes:
        # Pop tactics from stack that don't contain current tactic
        while stack and not (stack[-1].start_pos <= node.start_pos and stack[-1].end_pos >= node.end_pos):
            stack.pop()
        
        # If stack is not empty, current tactic is a direct child of the top of stack
        if stack:
            stack[-1].subhaves.append(node)
            node.parent = stack[-1] # Set parent for the current node
        
        # Push current tactic to stack
        stack.append(node)

    # Populate by_block_goals for 'have ... by ...' nodes
    for node in tactic_nodes:
        if node.is_have():
            structure = node.parse_have_structure()
            if structure:
                if node.subhaves: # Check if there are any tactics inside the 'by' block
                    first_tactic_in_by_block = node.subhaves[0]
                    node.by_block_goals = first_tactic_in_by_block.tactic.goals
                else:
                    # This case means 'have ... := by' is empty or only contains something
                    # not registered as a tactic (e.g. 'sorry' if not captured by server)
                    raise RuntimeError("Failed to decompose theorem: Have statement has a 'by' block but no sub-tactics were parsed for it. This indicates a major problem decomposition failure.")
    # Find top-level nodes (nodes that are not children of any other node)
    top_level_nodes = []
    child_nodes = set()
    for node in tactic_nodes:
        for child in node.subhaves:
            child_nodes.add(child)
    top_level_nodes = [node for node in tactic_nodes if node not in child_nodes]

    return top_level_nodes


def solve_theorem(input_content: str, fix_single_proof_func: callable, header_content: str = None, lean_env = None):
    """
    Core theorem solving function. Can work with custom headers and environments.
    
    Args:
        input_content: The theorem content to solve
        fix_single_proof_func: Function to fix individual proof steps
        header_content: Optional custom header (uses default if None)
        lean_env: Optional Lean environment (uses default if None)
        
    Returns:
        The fixed theorem content
    """
    # Process the theorem content
    # input_content = throw_head(input_content)
    input_content = remove_lean_comments(input_content)
    cmd_str = convert_theorem_to_example_cmd(input_content)
    print("--- Generated Command String ---")
    print(cmd_str)
    print("------------------------------")
    # Choose environment and run command
    if header_content is not None and lean_env is not None:
        # Use custom header and environment
        result = lean_env.run_with_header(header_content, cmd_str, all_tactics=True)
    elif lean_env is not None:
        # Use custom environment with theorem content
        result = lean_env.run(Command(cmd=cmd_str, all_tactics=True))
    else:
        # Use default environment
        # result = server.run(Command(cmd=cmd_str, env=header_env, all_tactics=True))
        raise RuntimeError("Failed to decompose theorem: No Lean environment provided and no default environment available. This indicates a major problem decomposition failure.")

    # Process tactics into tree structure (shared logic)
    top_level_nodes = _process_tactics_to_tree(result.tactics)
    
    if not top_level_nodes:
        raise RuntimeError("No top-level tactics found in the proof")

    parent = top_level_nodes[0]
    fixed_proof = convert_have_to_theorem(fix_complete_proof(parent, fix_single_proof_func))
    return fixed_proof


def solve_theorem_unified(problem: Problem, fix_single_proof_func: callable) -> str:
    """
    Solve a theorem using the unified problem management system.
    Built on top of the core solve_theorem function.
    
    Args:
        problem: The problem object containing header and theorem information
        fix_single_proof_func: Function to fix individual proof steps
        
    Returns:
        The fixed theorem content
    """
    # Get the header and problem content
    header_content = problem_manager.get_header_content(problem)
    problem_content = problem_manager.get_problem_content(problem)
    
    clean_header = remove_lean_comments(header_content)
    
    if not clean_header.strip():
        # Fallback to basic header if cleaning removed everything
        clean_header = """import Mathlib
import Aesop
set_option maxHeartbeats 0
open BigOperators Real Nat Topology Rat"""
    
    print(f"Using clean header: {clean_header}")
    
    # Use the core solve_theorem function with custom header and environment
    return solve_theorem(problem_content, fix_single_proof_func, clean_header, unified_env)


def solve_theorem_by_id(dataset: str, problem_id: str, fix_single_proof_func: callable) -> str:
    """
    Solve a theorem by its dataset and problem ID.
    Built on top of solve_theorem_unified.
    
    Args:
        dataset: The dataset name (e.g., 'minif2f', 'putnam', 'proverbench')
        problem_id: The problem identifier
        fix_single_proof_func: Function to fix individual proof steps
        
    Returns:
        The fixed theorem content
    """
    problem = problem_manager.get_problem(dataset, problem_id)
    if not problem:
        raise ValueError(f"Problem {dataset}/{problem_id} not found")
    
    return solve_theorem_unified(problem, fix_single_proof_func)


class UnifiedLeanEnvironment:
    """
    Manages Lean server and environments with header caching for better performance.
    Each unique header gets its own cached environment.
    """
    
    def __init__(self):
        self.config = LeanREPLConfig(verbose=True, project=LocalProject(localprojectdir))
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