load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")
load("@build_bazel_rules_apple//apple:resources.bzl", "apple_resource_bundle")

swift_library(
    name = "Interfaces",
    srcs = glob([
        "Interfaces/**/*.swift",
    ]),
    module_name = "GameInterfaces",
    visibility = ["//visibility:public"],
    deps = [
        "//Thirdparty/RIBs",
    ],
)

swift_library(
    name = "Game",
    srcs = glob([
        "Sources/**/*.swift",
    ]),
    module_name = "Game",
    visibility = ["//visibility:public"],
    deps = [
        ":Interfaces",
        ":GameResources",
        "//Thirdparty/RIBs",
    ],
)

apple_resource_bundle(
    name = "GameResources",
    infoplists = ["Resources/Info.plist"],
    resources = [":Assets"] + glob([
        "Resources/*.xib",
    ]),
)

filegroup(
    name = "Assets",
    srcs = glob(["Resources/Assets.xcassets/**"]),
    visibility = ["//visibility:public"],
)

