"""
Reverse String II

Given a string and an integer k, you need to reverse the first k characters for every 2k characters counting 
from the start of the string. If there are less than k characters left, reverse all of them. If there are less 
than 2k but greater than or equal to k characters, then reverse the first k characters and left the other as original.

Example:

Input: s = "abcdefg", k = 2
Output: "bacdfeg"

Restrictions:
The string consists of lower English letters only.
Length of the given string and k will in the range [1, 10000]
"""

class Solution:
    def reverseStr(self, s: str, k: int) -> str:
        # abcdefg
        # 0123456
        # 10  54    changed index
        #   23  6   no changed index
        
        # MY SOLUTION
        rev = []
        
        if len(s) <= k:
            return s[::-1]
        else:
            for i in range(0, len(s), 2*k):
                if len(s[i:i+k]) < k:
                    rev.append(s[i:i+k][::-1])
                if len(s[i:i+k]) >= k and len(s[i:i+k]) < 2*k:
                    rev.append(s[i:i+k][::-1])
                    rev.append(s[i+k:i+2*k])
        return "".join(rev)
            
        # SOLUTION by awice
        #s = list(s)
        #for i in range(0, len(s), 2*k):
        #    s[i:i+k] = reversed(s[i:i+k])
        #return "".join(s)
