from lean_interact import TempRequireProject, LeanREPLConfig, LeanServer, Command
import re

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
        return self.tactic.tactic.strip().startswith("have")
    
    def get_other_tactics(self):
        """Get tactics that are part of this node but are not subhaves"""
        # This would require the original list of all tactics and checking which ones
        # are contained within this node's range but are not in subhaves
        # For now, we'll just return a placeholder
        return []
    
    def parse_have_structure(self):
        """Parse the structure of a have statement into components."""
        if not self.is_have():
            return None
            
        tactic_text = self.tactic.tactic
        has_by = "by" in tactic_text # Simplified by check, assumes it implies a full have structure for our purposes

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
        type_str = tactic_text[start_pos:type_end].strip()
        # if type_str.startswith(":"):
            # type_str = type_str[1:].strip()
        # Debug info
        has_by = "by" in tactic_text # Simplified check for has_by
        print(f"name: {name}, type_str: {type_str}, is_implicit_name: {is_implicit_name}, has_by: {has_by}")
        return {
            "name": name,
            "type": type_str,
            "is_implicit_name": is_implicit_name,
            "has_by": has_by,
            "full_text": tactic_text # Keep original text for reference if needed
        }
    
    def get_have_name(self):
        """Extract the name of the have statement, defaulting to 'this' if anonymous."""
        if not self.is_have():
            return None
            
        structure = self.parse_have_structure()
        return structure.get("name") if structure else None # Will be 'this' if anonymous and parsed
    
    def get_simplified_representation(self):
        """
        Get a simplified representation of this tactic, e.g., 'have name : type := by sorry'
        Uses 'this' for anonymous haves.
        """
        if not self.is_have():
            return self.tactic.tactic
            
        structure = self.parse_have_structure()
        if not structure or not structure.get("has_by"): # Only simplify if it's a 'have ... by ...'
            return self.tactic.tactic

        name_to_use = structure["name"] # This will be 'this' if originally anonymous
        type_str = structure.get("type", "_") # Get parsed type, or default
        if type_str.startswith(":"):
            type_str = type_str[1:].strip()
        
        # Ensure the simplified form correctly represents an anonymous have if applicable
        # The name_to_use will be 'this', which is what we want for the placeholder.
        return f"have {name_to_use} : {type_str} := by sorry"
    
    def extract_dependencies_from_goals(self):
        """
        Extract dependencies from the goals of this tactic
        
        Returns:
            list: A list of dependency strings in the format "name : type"
        """
        if not self.goals:
            return []
        
        dependencies = []
        goal_lines = self.goals.split('\n')
        
        # The last line is usually the goal (starts with ⊢)
        # Everything before that are dependencies
        for line in goal_lines:
            line = line.strip()
            if line and not line.startswith('⊢'):
                # This is a dependency
                dependencies.append(line)
        
        return dependencies
    
    def create_self_contained_proof(self, body_override: str | None = None):
        """
        Create a self-contained version of this proof by incorporating
        all external dependencies from its goals.
        Optionally, an existing body (from ':=' onwards) can be provided via body_override.
        
        Returns:
            tuple: (self_contained_proof, original_tactic_text)
        """
        original_tactic_text = self.tactic.tactic

        if not self.is_have():
            return original_tactic_text, original_tactic_text
        
        structure = self.parse_have_structure()
        if not structure or not structure.get("has_by", False):
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
        goal_type = structure.get("type") # P from 'have name : P :='

        new_signature_part = ""
        dependency_params = [f"({dep})" for dep in dependencies]
        combined_params = " ".join(dependency_params)
        new_signature_part = f"have {name} {combined_params} {goal_type} "
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
                        for j in range(1, len(child_lines)):
                            if i + j >= len(framework_lines) or framework_lines[i + j].strip() != child_lines[j].strip():
                                is_match = False
                                break
                        if is_match:
                            start_idx = i
                            break
                
                # Replace the child tactic with the simplified version
                # Preserve the indentation of the first line
                first_line_indent = len(framework_lines[start_idx]) - len(framework_lines[start_idx].lstrip())
                simplified_lines = simplified.split('\n')
                # Replace the first line
                framework_lines[start_idx] = ' ' * first_line_indent + simplified_lines[0]
                # Remove the remaining lines of the child tactic
                del framework_lines[start_idx + 1:start_idx + len(child_lines)]
                # Add any remaining lines from the simplified version (if any)
                for i, line in enumerate(simplified_lines[1:], 1):
                    if start_idx + i < len(framework_lines):
                        framework_lines.insert(start_idx + i, ' ' * first_line_indent + line)
                    else:
                        framework_lines.append(' ' * first_line_indent + line)
                
                # Reconstruct the framework
                framework = '\n'.join(framework_lines)
                
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
    print(f"Fixing complete proof for: {root_node.get_have_name() or 'root example'}")

    # Step 1: Extract the initial framework with 'sorry' placeholders for children,
    # and a map of child names to their original tactic strings.
    # framework_with_sorry_children is like "have R_orig_sig := by own_code; have h_orig_sig := by sorry; ..."
    framework_with_sorry_children, child_proofs_map_name_to_original_text = extract_proof_framework_from_tree(root_node)
    print(f"Extracted framework with sorry children for {root_node.get_have_name()}:\n{framework_with_sorry_children}")

    # Step 2: Construct a self-contained version of the root_node's framework.
    self_contained_framework_for_root = ""
    if not root_node.is_have() or \
       not (root_node.parse_have_structure() and root_node.parse_have_structure().get("has_by", False)):
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
    
    print(f"Constructed self-contained framework for root {root_node.get_have_name()}:\n{self_contained_framework_for_root}")

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
    
    print(f"Fixed self-contained root framework for {root_node.get_have_name()} (reverted to have):\n{fixed_version_of_self_contained_root_framework}")

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
            print(f"Recursively fixing child: {name} of parent {root_node.get_have_name()}")
            # The result of recursive call is already in final form (original sig, fixed body)
            fixed_grandchild_proof_with_original_sig = fix_complete_proof(child_node, fix_single_proof_func)
            fixed_child_proofs_final_form[name] = fixed_grandchild_proof_with_original_sig
        else: # Leaf case: child has no subproofs
            print(f"Fixing leaf child: {name} of parent {root_node.get_have_name()}")
            fixed_child_proofs_final_form[name] = _fix_leaf_tactic(child_node, original_child_tactic_string, fix_single_proof_func)
        print(f"Fixed child '{name}' for parent '{root_node.get_have_name()}':\n{fixed_child_proofs_final_form[name]}")

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
    print(f"Final framework for reconstruction (root {root_node.get_have_name()} original sig, fixed body, sorry children):\n{final_framework_for_reconstruction}")
    
    # Step 6: Reconstruct the complete proof using the final framework and fixed children.
    # All parts now have original signatures and fixed bodies.
    reconstructed_proof = reconstruct_proof(final_framework_for_reconstruction, fixed_child_proofs_final_form)
    print(f"Reconstructed proof for {root_node.get_have_name()}:\n{reconstructed_proof}")
    
    return reconstructed_proof


config = LeanREPLConfig(verbose=True, project=TempRequireProject("mathlib"))

server = LeanServer(config)

header = """import Mathlib
import Aesop
set_option maxHeartbeats 0
open BigOperators Real Nat Topology Rat
"""

header_env = server.run(Command(cmd=header)).env

def run_with_header_env(input_content: str, **kwargs):
    # cut from the first "theorem" to the end
    theorem_start = input_content.find("theorem")
    if theorem_start == -1:
        raise ValueError("No theorem found in input")
    input_content = input_content[theorem_start:]
    return server.run(Command(cmd=input_content, env=header_env, **kwargs))


example_input_content = """theorem ex_mathlib (x : ℝ) : x + 0 = x:= by
  have (x : ℝ) : x + 0 = x:= by
    have hh (x : ℝ) : x + 0 = x:= by simp
    simp
  have h2 : x + 0 = x:= by
    exact this x
  exact h2
"""

def solve_theorem(input_content: str, fix_single_proof_func: callable):
    cmd_str = convert_theorem_to_example_cmd(input_content)
    print("--- Generated Command String ---")
    print(cmd_str)
    print("------------------------------")

    # have security problem here because of comment.

    result = server.run(Command(cmd=cmd_str, env=header_env, all_tactics=True))

    # Create TacticNode objects for each tactic
    tactic_nodes = [TacticNode(tactic) for tactic in result.tactics]

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
        
        # Push current tactic to stack
        stack.append(node)

    # Populate by_block_goals for 'have ... by ...' nodes
    for node in tactic_nodes:
        if node.is_have():
            structure = node.parse_have_structure()
            if structure and structure.get("has_by"):
                if node.subhaves: # Check if there are any tactics inside the 'by' block
                    first_tactic_in_by_block = node.subhaves[0]
                    node.by_block_goals = first_tactic_in_by_block.tactic.goals
                else:
                    # This case means 'have ... := by' is empty or only contains something
                    # not registered as a tactic (e.g. 'sorry' if not captured by server)
                    print(f"Warning: Have statement '{node.tactic.tactic}' has a 'by' block but no sub-tactics were parsed for it. '{node.get_have_name()}'.by_block_goals will be None.")

    # Find top-level nodes (nodes that are not children of any other node)
    top_level_nodes = []
    child_nodes = set()
    for node in tactic_nodes:
        for child in node.subhaves:
            child_nodes.add(child)
    top_level_nodes = [node for node in tactic_nodes if node not in child_nodes]

    parent = top_level_nodes[0]
    fixed_proof = convert_have_to_theorem(fix_complete_proof(parent, fix_single_proof_func))
    return fixed_proof

# Example of how you might call solve_theorem now

# This is your globally defined fix_single_proof
# def fix_single_proof(proof_framework):
#     print(f"Fixing proof framework using ORIGINAL function: {proof_framework}")
#     # ... (rest of your original logic)
#     import os
#     from datetime import datetime
#     precise_timestamp = datetime.now().strftime("%Y%m%d_%H%M%S_%f")
#     folder_name = f"zzz_proof_framework"
#     os.makedirs(folder_name, exist_ok=True)
#     with open(os.path.join(folder_name, f"proof_framework_{precise_timestamp}.lean"), "w") as f:
#         f.write(proof_framework)
    
#     proof_framework = proof_framework + "\n  done"
#     print(f"{proof_framework}")
#     return proof_framework

# Make sure input_content is defined as before
# result = solve_theorem(input_content, fix_single_proof) 
# print(f"Final fixed theorem:\n{result}")