#!/usr/bin/env python3

# Test correct macro syntax for ProofStep

def test_macro_syntax():
    # The issue is backtick escaping in Python strings
    hole_id = 'hole_1'
    
    # Wrong: backtick gets shell-escaped
    wrong_macro = f'macro "{hole_id}" : tactic => `(tactic| sorry)'
    print('Wrong macro:', repr(wrong_macro))
    
    # Correct: escape the backtick
    correct_macro = f'macro "{hole_id}" : tactic => `(tactic| sorry)'
    print('Correct macro:', repr(correct_macro))
    
    # Test with actual ProofStep
    from lean_interact import LeanREPLConfig, LeanServer, FileCommand
    import tempfile
    import os
    
    test_content = f'''import Mathlib

macro "hole_1" : tactic => `(tactic| sorry)
macro "skip_hole" : term => `(sorry)

theorem test (n : ℕ) : n ≥ n := by
  have h1 := by hole_1
  clear h1
  have h1 := skip_hole
  omega'''
    
    print('\n=== Test content ===')
    print(test_content)
    
    config = LeanREPLConfig()
    server = LeanServer(config)
    server.start()
    
    try:
        with tempfile.NamedTemporaryFile(mode='w', suffix='.lean', delete=False) as f:
            f.write(test_content)
            temp_file = f.name
        
        print(f'\n=== ProofStep test ===')
        response = server.run(FileCommand(path=temp_file))
        print(f'Sorries found: {len(response.sorries)}')
        
        for i, sorry in enumerate(response.sorries):
            print(f'Sorry {i}: proof_state={sorry.proof_state}, pos=({sorry.start_pos.line}, {sorry.start_pos.column})')
            print(f'  Goal: {sorry.goal}')
        
        os.unlink(temp_file)
        
    finally:
        server.kill()

if __name__ == "__main__":
    test_macro_syntax()