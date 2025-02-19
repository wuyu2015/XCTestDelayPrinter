# XCTestDelayPrinter

A lightweight XCTest utility package that solves 2 problems:

1. Outputs logs only after all tests complete, preventing scattered logs during execution.
2. Logs are printed only when running a single test case. When running all tests with ⌘+U, no output is produced, and delayed closures are skipped.

## Installation

Add `XCTestDelayPrinter` to your Swift package dependencies.

```swift
.package(url: "https://github.com/wuyu2015/XCTestDelayPrinter", from: "1.0.1")
```

## Usage

Use `pr` for delayed logging:

```swift
import XCTestDelayPrinter

func testExample() {
    pr("This will be printed after all tests.")
}

func testImmediatePrint() {
    pr(This prints immediately.", force: true)
}
```

Use `delay` for deferred execution (closures will not execute when running tests with ⌘+U):

```swift
import XCTestDelayPrinter

func testDelayedReturnString() {
    delay {
        "Hello World!"
    }
}

func testDelayedComputation() {
    delay {
        func testDelaySleep() {
            delay {
                print("Sleep start")
                // 1
                sleep(1)
                print(1)
                // 2
                sleep(1)
                print(2)
                // 3
                sleep(1)
                print(3)
                return "Sleep end"
            }
        }
    }
}
```

## License

MIT License

---

# XCTestDelayPrinter 中文说明

一个轻量级的 XCTest 工具包，解决了 2 个问题：

1. 在所有测试完成后输出日志，避免了测试过程中日志分散的问题。
2. 仅在运行单个测试用例时输出日志，使用 ⌘+U 运行所有测试时，不会输出内容或跳过执行闭包。

## 安装

将 `XCTestDelayPrinter` 添加到 Swift 包依赖中。

```swift
.package(url: "https://github.com/wuyu2015/XCTestDelayPrinter", from: "1.0.1")
```

## 使用

使用 `pr` 延迟打印：

```swift
import XCTestDelayPrinter

func testExample() {
    pr("所有测试完成后打印")
}

func testImmediatePrint() {
    pr("立即打印", force: true)
}
```

使用 `delay` 延迟打印（使用⌘+U 运行测试时，闭包不会执行）：

```swift
import XCTestDelayPrinter

func testDelayedReturnString() {
    delay {
        "Hello World!"
    }
}

func testDelayedComputation() {
    delay {
        func testDelaySleep() {
            delay {
                print("Sleep start")
                // 1
                sleep(1)
                print(1)
                // 2
                sleep(1)
                print(2)
                // 3
                sleep(1)
                print(3)
                return "Sleep end"
            }
        }
    }
}
```

## 许可证

MIT License
