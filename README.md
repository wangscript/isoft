# isoft
ext、spring4、hibernate4构建企业开发平台
采用ext4,spring4,hibernate4,gradle打造一套企业开发平台，省去了您自己构建一套完美框架的麻烦。
1、首页
双击首页的快捷项目图标按钮可打开相应的功能，首页快捷项目图标按钮可删除，也可从导航菜单通过拖曳添加

 
2、系统菜单

 
3、组织机构管理

 
4、用户管理

 
待实现功能：
1、权限管理
2、全文检索
 
另外想向看到本文的兄弟们请教一个问题，如何利用spring框架里集成的velocity，解析字符串或本地文件。
下载地址：
https://github.com/wangzhengquan/isoft
 
 
安装gradle (gradle是与maven一样的东东)
在根目录isoft下，修改如下代码片段
 repositories {
     
       mavenCentral()
    
    }
命令行下cd到根目录isoft，执行gradle eclipse命令可下载相关依赖包
