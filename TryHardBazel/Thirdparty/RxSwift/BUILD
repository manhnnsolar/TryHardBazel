load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "RxSwift",
    srcs = glob(
        [
            "Sources/RxSwift/**/*.swift",
            "Sources/Platform/**/*.swift",
        ],
        exclude = glob(["Sources/RxSwift/Platform/**/*.swift"]),
    ),
    module_name = "RxSwift",
    visibility = ["//visibility:public"],
)

swift_library(
    name = "RxRelay",
    srcs = glob(
        [
            "Sources/RxRelay/*.swift",
        ],
    ),
    module_name = "RxRelay",
    visibility = ["//visibility:public"],
    deps = [
        ":RxSwift",
    ],
)
