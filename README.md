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



2.Json解析错误 Unhandled Exception: FormatException: Unexpected character (at character 2) 

主要原因dio网络请求的时候返回的数据格式是非json格式，需要修改
```
responseType: ResponseType.plain
```



3.Webview 在ios平台下无法显示（引用原生view无法显示）

报错信息

Trying to embed a platform view but the PrerollContext does not support embedding 

解决方法：增加info.plist文件中的健值对



```
<key>io.flutter.embedded_views_preview</key>
<true/>
<key>NSAppTransportSecurity</key>
<dict>
   <key>NSAllowsArbitraryLoads</key>
   <true/>
</dict>
```