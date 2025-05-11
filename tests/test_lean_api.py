import pytest
from lean_api import error_list_net_reduced

def test_error_removed():
    orig = [
        {'line': 1, 'column': 0, 'end_line': 1, 'end_column': 10, 'message': 'error A'},
        {'line': 2, 'column': 0, 'end_line': 2, 'end_column': 10, 'message': 'error B'},
        {'line': 3, 'column': 0, 'end_line': 3, 'end_column': 10, 'message': 'error C'},
    ]
    new = [
        {'line': 1, 'column': 0, 'end_line': 1, 'end_column': 10, 'message': 'error A'},
        {'line': 2, 'column': 0, 'end_line': 2, 'end_column': 10, 'message': 'error B'},
    ]
    assert error_list_net_reduced(orig, new)

def test_new_error_added():
    orig = [
        {'line': 1, 'column': 0, 'end_line': 1, 'end_column': 10, 'message': 'error A'},
        {'line': 2, 'column': 0, 'end_line': 2, 'end_column': 10, 'message': 'error B'},
    ]
    new = [
        {'line': 1, 'column': 0, 'end_line': 1, 'end_column': 10, 'message': 'error A'},
        {'line': 2, 'column': 0, 'end_line': 2, 'end_column': 10, 'message': 'error B'},
        {'line': 4, 'column': 0, 'end_line': 4, 'end_column': 10, 'message': 'error D'},
    ]
    assert not error_list_net_reduced(orig, new)

def test_no_change():
    orig = [
        {'line': 1, 'column': 0, 'end_line': 1, 'end_column': 10, 'message': 'error A'},
        {'line': 2, 'column': 0, 'end_line': 2, 'end_column': 10, 'message': 'error B'},
    ]
    new = orig.copy()
    assert not error_list_net_reduced(orig, new)

def test_multiple_errors_removed():
    orig = [
        {'line': 1, 'column': 0, 'end_line': 1, 'end_column': 10, 'message': 'error A'},
        {'line': 2, 'column': 0, 'end_line': 2, 'end_column': 10, 'message': 'error B'},
        {'line': 3, 'column': 0, 'end_line': 3, 'end_column': 10, 'message': 'error C'},
    ]
    new = [
        {'line': 1, 'column': 0, 'end_line': 1, 'end_column': 10, 'message': 'error A'},
    ]
    assert error_list_net_reduced(orig, new) 