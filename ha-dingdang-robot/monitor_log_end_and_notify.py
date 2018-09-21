import os
import time
import requests
# /share/project/dingdang-base.log
log_file = '/share/project/dingdang-base.log'
last_size = 0
last_time = time.time()
while True:
    size = os.path.getsize(log_file)
    print('当前大小：'+str(size)+', 上次大小：'+str(last_size))
    if size > last_size:
        last_size = size
        last_time = time.time()
    elif (last_time + 60) < time.time():
        break
    time.sleep(20)

desp = ''
with open(log_file, 'rb') as f:  # 打开文件
    off = -700
    f.seek(off, 2)
    lines = f.readlines()
    for line in lines:
        desp += line.decode('utf-8')

# 发送通知
url = 'https://sc.ftqq.com/SCU27448T1c0b1aab4a3f8ce4fa966817591325335b13ef593d2d9.send?text=主人~编译结束啦&desp=' + \
    '```\n'+desp+'\n```'
print(url)
r = requests.get(url)
print(r.text)
