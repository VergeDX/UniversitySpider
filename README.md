## UniversitySpider

### 简介
这个脚本可以获取开设 xx 专业的大学, 你可以按照 本科一批(一本) 和 本科二批(二本) 来获取

### 使用到的命令及软件包, 请确保你有
`bash`, `echo`, `curl`, `grep`, `egrep`, `sed`, `cat`, `uniq`, `tee`

### 使用方法
1.首先打开这个网址:[http://kaoshi.edu.sina.com.cn/college/scorelist?tab=major](http://kaoshi.edu.sina.com.cn/college/scorelist?tab=major)  
  
2.选择好 `专业大类`, `文理分科`, `考生所在地`, `院校所在地`, `录取批次`, `年份` 这些信息  
  
3.浏览网页至最下方, 点击"`尾页`"  
  
4.复制当前网页的网址, 观察网址最后的页码, 并修改脚本中的 `页码`  
(如网址最后是 `&page=170`, 则说明共有 170 页, 你就需要修改脚本中的 `for ID in {1..81}` 为 `for ID in {1..170}`)  
  
5.修改 `网址` 和 `专业信息`  
  
请看脚本中的这一行:  
`````shell
curl -s 'http://kaoshi.edu.sina.com.cn/college/scorelist?tab=major&majorid=08&wl=2&local=6&provid=&batch=12&syear=2017&page='"$ID" | grep '软件工程' -A 1 | egrep -o \'\>\(.*?\)大学 >> result
`````
将它改为:  
`````shell
curl -s '你的网址'"$ID" | grep '你的专业' -A 1 | egrep -o \'\>\(.*?\)大学 >> result
`````
在这里, 网址要删除后面的数字, 比如变成这样:  
`````
http://kaoshi.edu.sina.com.cn/college/scorelist?tab=major&majorid=08&wl=2&local=6&provid=&batch=11&syear=2017&page=
`````
  
6.运行脚本, 数据会生成在同目录下的 `result` 文件中
(执行 `chmod a+x run.sh` 后执行 `./run.sh` 即可运行脚本)

### 关于状态码
只要是 0 就没有问题, 出现其它状态码请使用 `man curl` 命令, 在最后有状态码的说明  
(当然, 请确保你有 `man` 命令)

### 本仓库中 [result](https://github.com/VergeDX/UniversitySpider/blob/master/result) 文件即为结果示例
