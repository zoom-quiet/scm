# -*- coding: UTF-8 -*-

# 姓氏的笔画数
# 需要注意的是康熙字典为准。例如“艹”在康熙字典中通“艸”部，为六画，
# 所以所有“艹”部的字部首就算六画，因此“薛”在这里要算十九画。
# “周”从“口”部，在康熙字典影印版 http://www.kangxizidian.com/index2.php 第 181 页
# 共八画
SURNAME_STROKE_NUM = 8
# 名字用字最多允许多少画
MAX_STROKE_NUM = 30

def get_wu_ge(n1, n2, s1):
    """
    获得姓名五格，详情请参考：http://www.hkluck.com/kn/b05-02.php
    
    @type n1: int
    @param n1: 名字第一个字的笔画数
    @type n2: int
    @param n2: 名字第二个字的笔画数
    @type s1: int
    @param s1: 姓氏第一个字的笔画数
    @rtype: int, int, int, int, int
    @return: 姓名五格数值
    """
    tian_ge = s1+1
    ren_ge = s1+n1
    di_ge = n1 + n2
    wai_ge = s1 + n1 + n2 + 1 - ren_ge
    zong_ge = s1 + n1 + n2
    return tian_ge, ren_ge, di_ge, wai_ge, zong_ge

def get_wu_xing(n):
    """
    获得某个格的五行，详情请参考：http://www.hkluck.com/kn/b05-02.php
    
    @type n: int
    @param n: 某个格的数值
    @rtype: str
    @return: 对应的五行
    """
    wuxing = ['shui', 'mu', 'mu', 'huo', 'huo', 'tu', 'tu', 'jin', 'jin', 'shui']
    return wuxing[n % 10]

def get_san_cai(tian, ren, di):
    """
    获得三才组合，详情请参考：http://www.hkluck.com/kn/b05-02.php
    
    @type tian: int
    @param tian: 天格的数值
    @type ren: int
    @param ren: 人格的数值
    @type di: int
    @param di: 地格的数值
    @rtype: str, str, str
    @return: 对应的三才
    """
    return get_wu_xing(tian), get_wu_xing(ren), get_wu_xing(di)

# “吉"以上的五格数值
GOOD_WUGEs = set([1, 3, 5, 6, 7, 11, 13, 15, 16, 21, 23, 24, 29, 31, 32, 33, 35, 37, 41, 45, 47, 48, 52, 57, 61, 63, 65, 67, 68, 81])
# “吉”以上的三才组合，偷懒只列出以“水”开始的部分，因为天格决定了这里只需要水开始的三才
GOOD_SANCAIs = [('shui', 'mu', 'mu'),('shui','mu','tu'),('shui','jin','tu')]

def find():
    """
    根据姓名五格三才学说找出适宜的笔画数组合。
    
    只适用于单姓，名字为两个字的情况。
    """
    for n1 in range(1,MAX_STROKE_NUM):
        for n2 in range(1,MAX_STROKE_NUM):
            a,b,c,d,e = get_wu_ge(n1, n2, SURNAME_STROKE_NUM)
            if set([b,c,d,e]).issubset(GOOD_WUGEs):
                sc = get_san_cai(a,b,c)
                if sc in GOOD_SANCAIs:
                    print n1, n2, ' - Wu GE:', a, b, c, d, e, ' - San Cai:', sc

if __name__ == "__main__":
    find()