load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "Root",
    srcs = glob([
        "Sources/*.swift",
    ]),
    module_name = "Root",
    visibility = ["//visibility:public"],
    deps = [
        ":Interfaces",
        "//Home",
        "//Thirdparty/RIBs",
    ],
)

swift_library(
    name = "Interfaces",
    srcs = glob([
        "Interfaces/*.swift",
    ]),
    module_name = "RootInterfaces",
    visibility = ["//visibility:public"],
    deps = [
        "//Thirdparty/RIBs",
    ],
)