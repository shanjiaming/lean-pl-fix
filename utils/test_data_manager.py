#!/usr/bin/env python3
"""
测试数据管理器 - 管理Lean证明修复系统的测试数据配置
"""

import json
import os
import logging
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Any
from dataclasses import dataclass, field
from enum import Enum
from datetime import datetime

from core.lean_api import REPLInstance
from core.hole_fixer_interface import HoleFixerInterface, SimpleHoleFixer, DPV2HoleFixer
from data_management.unified_problem_manager import Problem


class RepairMode(Enum):
    HOLE_FILLING = "hole_filling"
    ERROR_FIXING = "error_fixing"


class SolvableStatus(Enum):
    SOLVABLE = True
    UNSOLVABLE = False
    UNKNOWN = None


@dataclass
class ProblemInfo:
    """问题信息"""
    name: str
    path: str
    original_solvable: Optional[bool] = None
    fixed_solvable: Optional[bool] = None
    description: str = ""


@dataclass
class MainProblem:
    """大题信息"""
    header_path: str
    problem_path: str
    combined_path: str
    original_solvable: Optional[bool] = None
    description: str = ""


@dataclass
class FixedProblem:
    """修复后的问题信息"""
    directory: str
    main_problem: Optional[ProblemInfo] = None
    sub_problems: List[ProblemInfo] = None
    
    def __post_init__(self):
        if self.sub_problems is None:
            self.sub_problems = []


@dataclass
class TestProblem:
    """完整的测试问题"""
    name: str
    main_problem: MainProblem
    decomposed_problems: Dict[str, Any]
    fixed_problems: Dict[str, FixedProblem]
    synthesis: Dict[str, Any]


class TestDataManager:
    """测试数据管理器"""
    
    def __init__(self, config_path: str = "config/test_data_config.json", hole_fixer: Optional[HoleFixerInterface] = None):
        self.config_path = config_path
        self.config = {}
        self.repl = None
        
        # Set up hole fixer - default to SimpleHoleFixer if none provided
        if hole_fixer is None:
            self.hole_fixer = SimpleHoleFixer()
        else:
            self.hole_fixer = hole_fixer
            
        logging.info(f"TestDataManager: Using hole fixer: {type(self.hole_fixer).__name__}")
        
        self._load_config()
    
    def _load_config(self):
        """加载配置文件"""
        try:
            with open(self.config_path, 'r', encoding='utf-8') as f:
                self.config = json.load(f)
        except FileNotFoundError:
            logging.error(f"配置文件未找到: {self.config_path}")
            self.config = {}
        except json.JSONDecodeError as e:
            logging.error(f"配置文件JSON解析错误: {e}")
            self.config = {}
    
    def save_config(self):
        """保存配置文件"""
        try:
            # 确保目录存在
            os.makedirs(os.path.dirname(self.config_path), exist_ok=True)
            
            with open(self.config_path, 'w', encoding='utf-8') as f:
                json.dump(self.config, f, ensure_ascii=False, indent=2)
            logging.info(f"配置已保存到: {self.config_path}")
        except Exception as e:
            logging.error(f"保存配置文件失败: {e}")
    
    def get_repair_mode(self) -> RepairMode:
        """获取当前修复模式"""
        mode_str = self.config.get("config", {}).get("repair_mode", "hole_filling")
        return RepairMode(mode_str)
    
    def set_repair_mode(self, mode: RepairMode):
        """设置修复模式"""
        if "config" not in self.config:
            self.config["config"] = {}
        self.config["config"]["repair_mode"] = mode.value
    
    def get_repair_options(self) -> Dict[str, bool]:
        """获取修复选项"""
        mode = self.get_repair_mode()
        mode_config = self.config.get("config", {}).get("repair_modes", {}).get(mode.value, {})
        return {
            "skip_correct_main_problems": mode_config.get("skip_correct_main_problems", False),
            "skip_correct_sub_problems": mode_config.get("skip_correct_sub_problems", True),
            "only_fix_error_sub_problems": mode_config.get("only_fix_error_sub_problems", False)
        }
    
    def set_repair_option(self, option: str, value: bool):
        """设置修复选项"""
        mode = self.get_repair_mode()
        if "config" not in self.config:
            self.config["config"] = {}
        if "repair_modes" not in self.config["config"]:
            self.config["config"]["repair_modes"] = {}
        if mode.value not in self.config["config"]["repair_modes"]:
            self.config["config"]["repair_modes"][mode.value] = {}
        
        self.config["config"]["repair_modes"][mode.value][option] = value
    
    def list_datasets(self) -> List[str]:
        """列出所有数据集"""
        return list(self.config.get("datasets", {}).keys())
    
    def list_problems(self, dataset: str) -> List[str]:
        """列出指定数据集的所有问题"""
        dataset_config = self.config.get("datasets", {}).get(dataset, {})
        return list(dataset_config.get("problems", {}).keys())
    
    def get_problem(self, problem_id: str) -> Optional[TestProblem]:
        """获取问题信息"""
        # 解析 problem_id (格式: dataset/problem_name)
        parts = problem_id.split('/', 1)
        if len(parts) != 2:
            return None
        
        dataset, problem_name = parts
        problem_config = self.config.get("datasets", {}).get(dataset, {}).get("problems", {}).get(problem_id)
        
        if not problem_config:
            return None
        
        # 构建 MainProblem
        main_config = problem_config.get("main_problem", {})
        main_problem = MainProblem(
            header_path=main_config.get("header_path", ""),
            problem_path=main_config.get("problem_path", ""),
            combined_path=main_config.get("combined_path", ""),
            original_solvable=main_config.get("original_solvable"),
            description=main_config.get("description", "")
        )
        
        # 构建 FixedProblem
        fixed_problems = {}
        fixed_config = problem_config.get("fixed_problems", {})
        
        for fix_type, fix_data in fixed_config.items():
            main_fix = None
            if fix_data.get("main_problem"):
                main_fix_data = fix_data["main_problem"]
                main_fix = ProblemInfo(
                    name=main_fix_data.get("name", ""),
                    path=main_fix_data.get("path", ""),
                    fixed_solvable=main_fix_data.get("fixed_solvable")
                )
            
            sub_fixes = []
            for sub_fix_data in fix_data.get("sub_problems", []):
                sub_fix = ProblemInfo(
                    name=sub_fix_data.get("name", ""),
                    path=sub_fix_data.get("path", ""),
                    original_solvable=sub_fix_data.get("original_solvable"),
                    fixed_solvable=sub_fix_data.get("fixed_solvable"),
                    description=sub_fix_data.get("description", "")
                )
                sub_fixes.append(sub_fix)
            
            fixed_problems[fix_type] = FixedProblem(
                directory=fix_data.get("directory", ""),
                main_problem=main_fix,
                sub_problems=sub_fixes
            )
        
        return TestProblem(
            name=problem_config.get("name", ""),
            main_problem=main_problem,
            decomposed_problems=problem_config.get("decomposed_problems", {}),
            fixed_problems=fixed_problems,
            synthesis=problem_config.get("synthesis", {})
        )
    
    def check_lean_code(self, code: str, header_path: Optional[str] = None, problem_context: Optional[Problem] = None) -> Tuple[bool, Optional[str]]:
        """检查Lean代码是否可以编译，在HOLE_FILLING模式下实际填充holes"""
        logging.info(f"TestDataManager: Checking lean code. Header path: {header_path}, Current Repair Mode: {self.get_repair_mode().value}")
        try:
            if not self.repl:
                logging.info("TestDataManager: REPLInstance not initialized. Initializing now.")
                self.repl = REPLInstance()
                logging.info("TestDataManager: REPLInstance initialized.")
            else:
                logging.info("TestDataManager: REPLInstance already initialized.")
            
            header_content_str = ""
            if header_path and os.path.exists(header_path):
                with open(header_path, 'r', encoding='utf-8') as f:
                    header_content_str = f.read().strip()
            
            actual_code_str = code  # Content from problem.lean, decomposed_xx.lean, etc.

            # If in HOLE_FILLING mode and code contains holes, use hole fixer
            if self.get_repair_mode() == RepairMode.HOLE_FILLING and "hole" in actual_code_str:
                logging.info("TestDataManager: Detected holes in code, using hole fixer to fix them")
                
                # Create a problem context if not provided
                if problem_context is None:
                    # Create a minimal problem context for the hole fixer
                    problem_context = Problem(
                        dataset="temp_dataset",
                        problem_id="temp_problem",
                        header_path=header_path or "",
                        problem_path="",
                        decomposed_dir="",
                        hole_dir=""
                    )
                
                # Use the hole fixer to replace holes
                try:
                    fixed_code = self.hole_fixer.fix_hole(actual_code_str, problem_context)
                    logging.info(f"TestDataManager: Fixed code:\n--BEGIN FIXED CODE--\n{fixed_code}\n--END FIXED CODE--")
                    actual_code_str = fixed_code
                except Exception as e:
                    logging.error(f"TestDataManager: Error in hole fixing: {e}")
                    # Fallback to simple sorry replacement
                    actual_code_str = actual_code_str.replace("hole", "sorry")
                    logging.info("TestDataManager: Fallback to simple sorry replacement")

            # Construct the full code string for Lean
            code_parts = []
            if header_content_str:
                code_parts.append(header_content_str.strip())
            
            if actual_code_str:
                # Ensure actual_code doesn't start with imports if header was present
                if header_content_str and actual_code_str.strip().startswith("import"):
                    logging.warning(f"TestDataManager: actual_code starts with import when header is present. This might be an issue. Code: {actual_code_str[:100]}...")
                code_parts.append(actual_code_str.strip())
            
            # Join parts with double newline for safety
            full_code = "\n\n".join(filter(None, code_parts))

            logging.info(f"TestDataManager: Final full code to check:\n--BEGIN CODE--\n{full_code}\n--END CODE--")
            is_valid, result = self.repl.check(full_code)
            logging.info(f"TestDataManager: Lean check complete. Valid: {is_valid}")
            
            if is_valid:
                return True, None
            else:
                messages = result.get("messages", [])
                error_messages = [msg.get("message", "") for msg in messages if msg.get("severity") == "error"]
                # Log the errors received from Lean
                if error_messages:
                    logging.warning(f"TestDataManager: Lean reported errors: {'; '.join(error_messages)}")
                else:
                    logging.warning("TestDataManager: Lean check invalid but no error messages found in result.")
                return False, "; ".join(error_messages) if error_messages else "Unknown error or no specific error message"
                
        except Exception as e:
            logging.error(f"TestDataManager: Exception in check_lean_code: {e}", exc_info=True)
            return False, str(e)
    
    def verify_problem_status(self, problem_id: str) -> Dict[str, Any]:
        """验证问题状态"""
        problem = self.get_problem(problem_id)
        if not problem:
            return {"error": f"Problem {problem_id} not found"}
        
        results = {
            "problem_id": problem_id,
            "main_problem": {},
            "decomposed_problems": [],
            "fixed_problems": {},
            "timestamp": datetime.now().isoformat()
        }
        
        # 检查大题状态
        if os.path.exists(problem.main_problem.combined_path):
            with open(problem.main_problem.combined_path, 'r', encoding='utf-8') as f:
                main_code_full = f.read()
            
            # Remove import statements from main_code_full before passing to check_lean_code
            main_code_lines = main_code_full.splitlines()
            main_code_no_imports = "\n".join([line for line in main_code_lines if not line.strip().startswith("import ")])
            
            logging.info(f"TestDataManager: Verifying main problem. Path: {problem.main_problem.combined_path}. Code to check (imports removed):\n--BEGIN CODE--\n{main_code_no_imports}\n--END CODE--")
            is_valid, error_msg = self.check_lean_code(main_code_no_imports, problem.main_problem.header_path)
            results["main_problem"] = {
                "path": problem.main_problem.combined_path,
                "solvable": is_valid,
                "error": error_msg,
                "description": problem.main_problem.description
            }
        
        # 检查分解后的小题状态
        decomposed_dir = problem.decomposed_problems.get("directory", "")
        if os.path.exists(decomposed_dir):
            for file_info in problem.decomposed_problems.get("files", []):
                file_path = file_info.get("path", "")
                if os.path.exists(file_path):
                    with open(file_path, 'r', encoding='utf-8') as f:
                        sub_code = f.read()
                    
                    logging.info(f"TestDataManager: Verifying decomposed problem. Path: {file_path}. Code to check:\n--BEGIN CODE--\n{sub_code}\n--END CODE--")
                    is_valid, error_msg = self.check_lean_code(sub_code, problem.main_problem.header_path)
                    results["decomposed_problems"].append({
                        "name": file_info.get("name", ""),
                        "path": file_path,
                        "solvable": is_valid,
                        "error": error_msg,
                        "description": file_info.get("description", "")
                    })
        
        # 检查修复后的问题状态
        for fix_type, fixed_problem in problem.fixed_problems.items():
            fix_results = {
                "fix_type": fix_type,
                "directory": fixed_problem.directory,
                "main_problem": {},
                "sub_problems": []
            }
            
            # 检查修复后的主问题
            if fixed_problem.main_problem and os.path.exists(fixed_problem.main_problem.path):
                with open(fixed_problem.main_problem.path, 'r', encoding='utf-8') as f:
                    fixed_main_code = f.read()
                
                logging.info(f"TestDataManager: Verifying fixed main problem. Path: {fixed_problem.main_problem.path}. Code to check:\n--BEGIN CODE--\n{fixed_main_code}\n--END CODE--")
                
                # Create problem context for hole fixing
                problem_context = Problem(
                    dataset=problem_id.split('/')[0],
                    problem_id=problem_id,
                    header_path=problem.main_problem.header_path,
                    problem_path=fixed_problem.main_problem.path,
                    decomposed_dir="",
                    hole_dir=""
                )
                
                is_valid, error_msg = self.check_lean_code(fixed_main_code, problem.main_problem.header_path, problem_context)
                fix_results["main_problem"] = {
                    "name": fixed_problem.main_problem.name,
                    "path": fixed_problem.main_problem.path,
                    "solvable": is_valid,
                    "error": error_msg
                }
            
            # 检查修复后的子问题
            for sub_problem in fixed_problem.sub_problems:
                if os.path.exists(sub_problem.path):
                    with open(sub_problem.path, 'r', encoding='utf-8') as f:
                        sub_fixed_code = f.read()
                    
                    logging.info(f"TestDataManager: Verifying fixed sub problem. Path: {sub_problem.path}. Code to check:\n--BEGIN CODE--\n{sub_fixed_code}\n--END CODE--")
                    
                    # Create problem context for hole fixing
                    sub_problem_context = Problem(
                        dataset=problem_id.split('/')[0],
                        problem_id=f"{problem_id}/{sub_problem.name}",
                        header_path=problem.main_problem.header_path,
                        problem_path=sub_problem.path,
                        decomposed_dir="",
                        hole_dir=""
                    )
                    
                    is_valid, error_msg = self.check_lean_code(sub_fixed_code, problem.main_problem.header_path, sub_problem_context)
                    fix_results["sub_problems"].append({
                        "name": sub_problem.name,
                        "path": sub_problem.path,
                        "solvable": is_valid,
                        "error": error_msg,
                        "description": sub_problem.description
                    })
            
            results["fixed_problems"][fix_type] = fix_results
        
        return results
    
    def update_problem_status(self, problem_id: str, verification_results: Dict[str, Any]):
        """更新问题状态到配置文件"""
        # 解析 problem_id
        parts = problem_id.split('/', 1)
        if len(parts) != 2:
            return
        
        dataset, problem_name = parts
        
        # 确保路径存在
        if "datasets" not in self.config:
            self.config["datasets"] = {}
        if dataset not in self.config["datasets"]:
            self.config["datasets"][dataset] = {"problems": {}}
        if "problems" not in self.config["datasets"][dataset]:
            self.config["datasets"][dataset]["problems"] = {}
        if problem_id not in self.config["datasets"][dataset]["problems"]:
            return  # 问题不存在，不更新
        
        problem_config = self.config["datasets"][dataset]["problems"][problem_id]
        
        # 更新主问题状态
        if "main_problem" in verification_results:
            main_result = verification_results["main_problem"]
            if "main_problem" in problem_config:
                problem_config["main_problem"]["original_solvable"] = main_result.get("solvable")
        
        # 更新分解问题状态
        if "decomposed_problems" in verification_results:
            decomposed_results = verification_results["decomposed_problems"]
            decomposed_config = problem_config.get("decomposed_problems", {})
            files_config = decomposed_config.get("files", [])
            
            for i, result in enumerate(decomposed_results):
                if i < len(files_config):
                    files_config[i]["original_solvable"] = result.get("solvable")
        
        # 更新修复后问题状态
        if "fixed_problems" in verification_results:
            fixed_results = verification_results["fixed_problems"]
            fixed_config = problem_config.get("fixed_problems", {})
            
            for fix_type, fix_result in fixed_results.items():
                if fix_type in fixed_config:
                    # 更新主问题状态
                    if fix_result.get("main_problem") and "main_problem" in fixed_config[fix_type]:
                        main_fix_result = fix_result["main_problem"]
                        if fixed_config[fix_type]["main_problem"]:
                            fixed_config[fix_type]["main_problem"]["fixed_solvable"] = main_fix_result.get("solvable")
                    
                    # 更新子问题状态
                    sub_results = fix_result.get("sub_problems", [])
                    sub_config = fixed_config[fix_type].get("sub_problems", [])
                    
                    for i, sub_result in enumerate(sub_results):
                        if i < len(sub_config):
                            sub_config[i]["fixed_solvable"] = sub_result.get("solvable")
    
    def get_problems_to_process(self) -> List[str]:
        """根据当前配置获取需要处理的问题列表"""
        mode = self.get_repair_mode()
        options = self.get_repair_options()
        
        problems_to_process = []
        
        for dataset in self.list_datasets():
            for problem_id in self.list_problems(dataset):
                problem = self.get_problem(problem_id)
                if not problem:
                    continue
                
                should_process = True
                
                # 检查是否跳过正确的大题
                if options.get("skip_correct_main_problems", False):
                    if problem.main_problem.original_solvable is True:
                        should_process = False
                        continue
                
                # 对于错误修复模式，只处理有错误的问题
                if mode == RepairMode.ERROR_FIXING:
                    if problem.main_problem.original_solvable is not False:
                        should_process = False
                        continue
                
                if should_process:
                    problems_to_process.append(problem_id)
        
        return problems_to_process
    
    def generate_summary_report(self) -> Dict[str, Any]:
        """生成摘要报告"""
        report = {
            "timestamp": datetime.now().isoformat(),
            "config": {
                "repair_mode": self.get_repair_mode().value,
                "options": self.get_repair_options()
            },
            "datasets": {},
            "totals": {
                "datasets": 0,
                "problems": 0,
                "solvable_main_problems": 0,
                "unsolvable_main_problems": 0,
                "unknown_main_problems": 0,
                "total_sub_problems": 0,
                "fixed_problems": 0
            }
        }
        
        datasets = self.list_datasets()
        report["totals"]["datasets"] = len(datasets)
        
        for dataset_name in datasets:
            problems = self.list_problems(dataset_name)
            dataset_info = {
                "description": f"{dataset_name}数据集",
                "stats": {
                    "total_problems": len(problems),
                    "solvable_main": 0,
                    "unsolvable_main": 0,
                    "unknown_main": 0,
                    "total_sub_problems": 0,
                    "fixed_problems": 0
                },
                "problems": []
            }
            
            for problem_id in problems:
                problem = self.get_problem(problem_id)
                if problem:
                    # 统计主问题状态
                    if problem.main_problem.original_solvable is True:
                        dataset_info["stats"]["solvable_main"] += 1
                        report["totals"]["solvable_main_problems"] += 1
                    elif problem.main_problem.original_solvable is False:
                        dataset_info["stats"]["unsolvable_main"] += 1
                        report["totals"]["unsolvable_main_problems"] += 1
                    else:
                        dataset_info["stats"]["unknown_main"] += 1
                        report["totals"]["unknown_main_problems"] += 1
                    
                    # 统计子问题数量
                    decomposed_count = problem.decomposed_problems.get("count", 0)
                    dataset_info["stats"]["total_sub_problems"] += decomposed_count
                    report["totals"]["total_sub_problems"] += decomposed_count
                    
                    # 统计修复状态
                    has_hole_fix = "hole_filled" in problem.fixed_problems and problem.fixed_problems["hole_filled"].main_problem is not None
                    has_error_fix = "error_fixed" in problem.fixed_problems and problem.fixed_problems["error_fixed"].main_problem is not None
                    
                    if has_hole_fix or has_error_fix:
                        dataset_info["stats"]["fixed_problems"] += 1
                        report["totals"]["fixed_problems"] += 1
                    
                    # 添加问题详情
                    dataset_info["problems"].append({
                        "id": problem_id,
                        "name": problem.name,
                        "main_problem_solvable": problem.main_problem.original_solvable,
                        "decomposed_count": decomposed_count,
                        "has_hole_fix": has_hole_fix,
                        "has_error_fix": has_error_fix
                    })
            
            report["datasets"][dataset_name] = dataset_info
            report["totals"]["problems"] += len(problems)
        
        return report
    
    def __del__(self):
        """清理资源"""
        if self.repl:
            try:
                self.repl.end()
            except:
                pass


# 全局实例
test_data_manager = TestDataManager() 