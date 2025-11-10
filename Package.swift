// swift-tools-version: 5.10
// iOS-Only Variant - CLI removed for iOS compatibility
import PackageDescription

let package = Package(
    name: "FluidAudio",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "FluidAudio",
            targets: ["FluidAudio"]
        ),
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "ESpeakNG",
            path: "Sources/FluidAudio/Frameworks/ESpeakNG.xcframework"
        ),
        .target(
            name: "FluidAudio",
            dependencies: [
                "ESpeakNG",
                "FastClusterWrapper",
            ],
            path: "Sources/FluidAudio",
            exclude: ["Frameworks"]
        ),
        .target(
            name: "FastClusterWrapper",
            path: "Sources/FastClusterWrapper",
            publicHeadersPath: "include"
        ),
        .testTarget(
            name: "FluidAudioTests",
            dependencies: ["FluidAudio"]
        ),
    ],
    cxxLanguageStandard: .cxx17
)
