#! /bin/bash

ID=1
for ID in {1..81}
#   请在修改这里的 页码, 改为 {1..尾页页码}

do

echo -n '正在抓取第 '"$ID"' 页的数据...'
#   显示页码

curl -s 'http://kaoshi.edu.sina.com.cn/college/scorelist?tab=major&majorid=08&wl=2&local=6&provid=&batch=12&syear=2017&page='"$ID" | grep '软件工程' -A 1 | egrep -o \'\>\(.*?\)大学 >> result
#   请更改上述 网址 和 专业名称
#   获取网页代码 | grep 找出所需专业 | egrep 筛选 >> 输出到文件(追加)
#   (请记得每次运行时删除一下 result 文件)

echo '...完成, curl 的状态码为:'"${PIPESTATUS[0]}"
#   ${PIPESTATUS[0]} 变量是 curl 命令的退出状态码

done

sed -i "s/'>//g" result
#   最后使用 sed 工具移除文件中的 '> 字符

cat result | uniq | tee result
#   输出结果, 并更新文件(合并重复结果)
