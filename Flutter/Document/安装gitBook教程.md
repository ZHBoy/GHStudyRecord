# 安装gitBook教程


1. npm i -g gitbook gitbook-cli

如果报错
	
	You need to install "gitbook-cli" to have access to the gitbook command anywhere on your system.
	If you've installed this package globally, you need to uninstall it.
	>> Run "npm uninstall -g gitbook" then "npm install -g gitbook-cli"


那么先执行'npm uninstall -g gitbook'再执行 'npm install -g gitbook-cli'

2.本地进入到本项目根目录，运行

```
gitbook install
```
3运行

```
gitbook serve 
```