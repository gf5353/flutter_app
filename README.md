# flutter练习项目

A new Flutter application.

[![image](https://gitee.com/daodao/repository/raw/master/apk/flutter_app/qr.png)](https://gitee.com/daodao/repository/raw/master/apk/flutter_app/app-release.apk
)

## 常见问题

### 1.flutter pub get慢  
一直处在

```
Running "flutter packages get" in project_name...
```
具体操作

Linux 或 Mac

```
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
```
Windows
新增两个环境变量即可

```
PUB_HOSTED_URL ===== https://pub.flutter-io.cn
FLUTTER_STORAGE_BASE_URL ===== https://storage.flutter-io.cn
```
执行一下 flutter doctor命令

http://jimbray.xyz/post/using-flutter-in-china/
