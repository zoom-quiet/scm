import os
#import functools

from invoke import task

__ver = "24.7.27"
__name = "t2t2md"
__author = "Zoom.Quiet"
__email = "zoomquiet+t2t@gmail.com"

@task
def version(c):
    print(f"""{__name} v.{__ver} 
        by {__author}<{__email}>
    USAGE:
    $ inv t2m path/2/pyblosoxm/nodes/
        """)


@task
def t2m(c, srcpath):
    ls_t2t = _walk_dir(c,srcpath)
    print(f"diged: {len(ls_t2t)} files")
    #print(ls_t2t[-1])
    ##_t2t2md(c, ls_t2t[-1])
    for t2t in ls_t2t:
        _t2t2md(c, t2t)

def _t2t2md(c, t2t):
    '''将 t2t 文件转换为 md 文件
    
    :param t2t: 要转换的.t2t文件的绝对路径
    :return: None 打印转换结果文件绝对路径
    '''
    #print(f"t2t2md: {t2t}")
    _t2t = f"{t2t[0]}/{t2t[1]}"
    _md = f"{t2t[0]}/{t2t[1].replace('.t2t','.md')}"
    _cmd = f"pandoc -f t2t -t markdown {_t2t} -o {_md}"
    #print(f"cmd: \n\t{_cmd}")
    c.run(_cmd)
    print(f"transformed:\n ..{"/".join(_md.split('/')[-3:])}")
    
    return None

def _walk_dir(c, srcpath):
    """
    遍历指定目录及其子目录，找到所有.t2t文件，并返回它们的绝对路径列表。
    
    :param srcpath: 要遍历的目录路径
    :return: 包含所有.t2t文件绝对路径的列表
    """
    t2t_files = []  # 初始化一个空列表，用于存储.t2t文件的绝对路径
    # 使用os.walk()遍历目录
    for root, dirs, files in os.walk(srcpath):
        # 遍历当前目录中的所有文件
        for file in files:
            # 检查文件扩展名是否为.t2t
            if file.endswith('.t2t'):
                # 获取文件的绝对路径并添加到列表中
                #t2t_files.append(os.path.abspath(os.path.join(root, file)))
                t2t_files.append((os.path.abspath(root), 
                                file,
                                ))
    return t2t_files  # 返回.t2t文件的绝对路径列表


