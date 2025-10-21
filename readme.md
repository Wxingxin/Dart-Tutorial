# 💯💯💯 安装 dart 语言环境(window)

**有两种方法可选**

> ### 方法一 Chocolatey

###### 一： 认识

1. Chocolatey 是一个 Windows 下的命令行软件管理器，可以方便开发者使用命令来安装软件。

###### 二： 安装

1. 以**管理员身份**运行 PowerShell
2. `Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))`

3.

```bash
choco install dart-sdk
```
4. 
```bash
Do you want to run the script?([Y]es/[A]ll scripts/[N]o/[P]rint): 
# 在键盘中敲 ：y
```

###### 三： 检查是否安装成功

1. 检查 choco 是否安装成功

```bash
PS C:\WINDOWS\system32> choco
Chocolatey v2.5.1
Please run 'choco --help' or 'choco <command> --help' for help menu.
```

1. 检查 dart 是否安装成功

```bash
dart --version
```

> ### 方法二

# 💯💯💯 创建dart项目环境 
```bash
# 1. 创建一个名为 quote_scraper 的新 Dart 控制台项目
dart create quote_scraper

# 2. 进入刚刚创建的项目目录
cd quote_scraper

```

# 💯💯💯 安装 dart 语言环境(mac)


💯💯💯

💯💯💯 dart cli

非常棒 👍
如果你想深入了解 **Dart CLI（命令行工具）** 的命令大全，这里我帮你整理了一份最全 + 最常用的 Dart 命令速查表，涵盖创建项目、运行、编译、包管理、分析调试等方面。

---

## 🧱 一、项目管理类命令

| 命令                               | 作用                     | 示例                              |
| -------------------------------- | ---------------------- | ------------------------------- |
| `dart create <project_name>`     | 创建一个新的 Dart 项目         | `dart create my_app`            |
| `dart create .`                  | 在当前目录创建项目              | `dart create .`                 |
| `dart create -t console my_app`  | 创建命令行（控制台）项目           | `dart create -t console my_app` |
| `dart create -t web my_web`      | 创建 Web 项目              | `dart create -t web my_web`     |
| `dart create -t package my_pkg`  | 创建一个 Dart 库包           | `dart create -t package my_pkg` |
| `dart pub get`                   | 下载依赖包（相当于 npm install） | `dart pub get`                  |
| `dart pub upgrade`               | 升级所有依赖到最新版本            | `dart pub upgrade`              |
| `dart pub outdated`              | 查看哪些依赖有新版本             | `dart pub outdated`             |
| `dart pub add <package_name>`    | 添加依赖包                  | `dart pub add http`             |
| `dart pub remove <package_name>` | 移除依赖包                  | `dart pub remove html`          |

---

## 🚀 二、运行与编译

| 命令                                      | 作用                           | 示例                                        |
| --------------------------------------- | ---------------------------- | ----------------------------------------- |
| `dart run`                              | 运行项目主文件（默认是 `bin/main.dart`） | `dart run`                                |
| `dart run <file.dart>`                  | 运行指定 Dart 文件                 | `dart run crawler/crawler.dart`           |
| `dart compile exe <file.dart>`          | 编译为本地可执行文件（如 `.exe`）         | `dart compile exe bin/main.dart`          |
| `dart compile js <file.dart>`           | 编译为 JavaScript（适用于 web）      | `dart compile js web/main.dart`           |
| `dart compile aot-snapshot <file.dart>` | 编译为 AOT 快照（提前编译）             | `dart compile aot-snapshot bin/main.dart` |
| `dart compile kernel <file.dart>`       | 编译为中间 kernel 文件              | `dart compile kernel bin/main.dart`       |

---

## 🧩 三、包与库管理（pub 工具）

| 命令                                        | 作用                      |
| ----------------------------------------- | ----------------------- |
| `dart pub cache`                          | 管理包缓存                   |
| `dart pub cache repair`                   | 修复依赖包缓存                 |
| `dart pub global activate <package>`      | 全局安装 Dart 工具包           |
| `dart pub global run <package>:<command>` | 运行全局安装的工具               |
| `dart pub publish`                        | 发布自己的 Dart 包（到 pub.dev） |
| `dart pub login`                          | 登录 pub.dev 账号           |
| `dart pub logout`                         | 登出 pub.dev              |

---

## 🔍 四、代码分析与格式化

| 命令                        | 作用                  | 示例                          |
| ------------------------- | ------------------- | --------------------------- |
| `dart analyze`            | 分析代码，查找潜在问题         | `dart analyze`              |
| `dart format .`           | 格式化当前目录下的所有 Dart 文件 | `dart format .`             |
| `dart format <file.dart>` | 格式化指定文件             | `dart format lib/main.dart` |

---

## 🧪 五、测试与调试

| 命令                              | 作用               |
| ------------------------------- | ---------------- |
| `dart test`                     | 运行测试（需安装 test 包） |
| `dart test -n <test_name>`      | 运行特定测试           |
| `dart test --coverage=coverage` | 收集测试覆盖率数据        |

---

## 🧠 六、信息与帮助命令

| 命令                   | 作用                     |
| -------------------- | ---------------------- |
| `dart --version`     | 查看 Dart 版本             |
| `dart --help`        | 查看帮助信息                 |
| `dart create --help` | 查看 create 子命令帮助        |
| `dart pub --help`    | 查看 pub 工具帮助            |
| `dart info`          | 显示 Dart SDK 信息（部分版本支持） |

---

## 🧰 七、调试与开发辅助

| 命令                             | 作用                 |
| ------------------------------ | ------------------ |
| `dart run --observe`           | 启动调试服务（VM Service） |
| `dart run --enable-vm-service` | 启用 Dart VM 调试端口    |
| `dart compile exe --debug`     | 编译为带调试信息的可执行文件     |

---

## 💡 推荐开发工作流（CLI顺序）

```bash
# 1️⃣ 创建项目
dart create -t console my_dart

# 2️⃣ 进入项目
cd my_dart

# 3️⃣ 添加依赖
dart pub add http
dart pub add html

# 4️⃣ 写代码（例如在 bin/crawler.dart）

# 5️⃣ 运行项目
dart run bin/crawler.dart

# 6️⃣ 格式化代码
dart format .

# 7️⃣ 分析代码
dart analyze
```
