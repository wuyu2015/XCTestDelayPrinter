# XCTestDelayPrinter

A lightweight Swift package for XCTest that solves 2 problems:

1. Outputs logs after all tests complete, preventing scattered logs during execution.
2. Prints logs only when running a single test case, with no output when running all tests (⌘+U).

## Installation

Add `XCTestDelayPrinter` to your Swift package dependencies.

```swift
.package(url: "https://github.com/wuyu2015/XCTestDelayPrinter", from: "1.0.0")
```

## Usage

Use `pr` within XCTestCase subclasses:

```swift
func testExample() {
    pr("This will be printed after all tests.")
}

func testImmediatePrint() {
    pr("This prints immediately", force: true)
}
```

## License

MIT License

---

# XCTestDelayPrinter （中文）

一个轻量级的 XCTest 工具包，解决了两个问题：

1. 在所有测试完成后输出日志，避免了测试过程中日志分散的问题。
2. 仅在运行单个测试用例时输出日志，使用 ⌘+U 运行所有测试时不会输出。

## 安装

将 `XCTestDelayPrinter` 添加到 Swift 包依赖中。

```swift
.package(url: "https://github.com/wuyu2015/XCTestDelayPrinter", from: "1.0.0")
```

## 使用

在 XCTestCase 子类中使用 `pr`：

```swift
func testExample() {
    pr("所有测试完成后打印")
}

func testImmediatePrint() {
    pr("立即打印", force: true)
}
```

## 许可证

MIT License
