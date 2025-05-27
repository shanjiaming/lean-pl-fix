import difflib
from typing import List
from nltk.translate.bleu_score import sentence_bleu, SmoothingFunction

def rank_by_similarity(word: str, candidates: List[str]) -> List[str]:
    """
    对candidates按与word的BLEU相似度从高到低排序，返回排序后的列表。
    """
    word_tokens = list(word)
    smoothie = SmoothingFunction().method1
    scored = [
        (sentence_bleu([word_tokens], list(cand), smoothing_function=smoothie), cand)
        for cand in candidates
    ]
    scored.sort(reverse=True)
    return [cand for score, cand in scored]

# 测试用例
def test_rank_by_similarity():
    word = "add_zero"
    candidates = ["zero_add", "add_one", "Nat.succ_pos", "add_zero_comm", "add", "zero"]
    ranked = rank_by_similarity(word, candidates)
    print("排序结果：", ranked)

if __name__ == "__main__":
    test_rank_by_similarity() 