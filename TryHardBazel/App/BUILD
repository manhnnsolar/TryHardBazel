load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "App_Classes",
    srcs = glob([
        "*.swift"
    ]),
    data = [
    	"//Assets:Assets",
    	"Base.lproj/Main.storyboard",
    	"Base.lproj/LaunchScreen.storyboard",
    ],
    deps = [
        "//Root",
        "//Thirdparty/RIBs",
    ]
)

ios_application(
    name = "ios_app",
    bundle_id = "com.solar.TryHardBazel",
    infoplists = ["Info.plist"],
    families = ["iphone"],
    minimum_os_version = "12.0",
    provisioning_profile = "Profiles.mobileprovision",
    deps = [
        ":App_Classes",
    ]
)
