load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "RIBs",
    srcs = glob([
        "Sources/ios/RIBs/Classes/**/*.swift",
    ]),
    module_name = "RIBs",
    visibility = ["//visibility:public"],
    deps = [
        "//Thirdparty/RxSwift",
        "//Thirdparty/RxSwift:RxRelay",
    ],
)
