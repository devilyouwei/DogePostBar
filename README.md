# Doge贴吧

## Introduction

This is a project I developed in my university, so actually it is just the student works. It is an example of a forum website developed with Java. It is funny and totally opensourced.

## QuickStart

### 软件需求

1. Eclipse Neo For Javaee 版本
2. Tomcat 8.0 以上
3. mysql 5.1 server以上
4. java 1.8 jdk 以上
 
### 步骤
 
1. 正确安装完以上所有需求软件 
2. 将war包导入eclipse
3. 打开java source/src controller下的MyDB.java文件
4. 修改以下代码为自己的数据库连接信息

    ```java
       private static final String database="bookmark";
       private static final String user="root";	//数据库账号
	   private static final String password="root"; //数据库密码
    ```

5. 导入数据文件至mysql，数据库文件在db目录下 
6. 需要使用kindeditor和amazeui插件以及框架的请把lib下的两个目录都复制到tomcat目录下的webapps中，也就是网站根目录
7. 在eclipse下先测试运行程序，注意必须调用tomcat8以上服务器
8. 再次导出war包，放到tomcat的webapps目录下
9. 关闭elicpse和他的测试服务
10. 启动tomcat，war包将被自动解压
11. 注意：如需直接访问网站，请把刚刚解压的war包的目录下的文件都复制到ROOT下面，而且要删除ROOT目录下原来的文件
12. 访问htttp://localhost:8080即可
13. 前端外引类库，amazui和kindeditor可能需要单独放到网站根目录，例如宝塔Java项目管理器中打开项目目录，将assets和kindeditor单独作为两个文件夹上传
  
### 框架
  
+ amazeui
+ structs2
+ kindeditor

### 注意事项

**整个项目所有的文件均采用UTF-8编码，包括数据库和代码文件，请特别注意将字符集和配置文件配置为utf-8，尤其是mysql数据库**
