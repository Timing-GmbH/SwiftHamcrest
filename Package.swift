// swift-tools-version:6.0

import CompilerPluginSupport
import PackageDescription

let package = Package(
    name: "Hamcrest",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13)],
    products: [
        .library(name: "Hamcrest", targets: ["Hamcrest"]),
        .library(name: "HamcrestSwiftTesting", targets: ["HamcrestSwiftTesting"])
    ],
    dependencies: [
        // The wide range lets consumers resolve to swift-syntax 603+, which has prebuilt binaries
        // on Swift 6.3 toolchains (avoiding slow source builds), while staying compatible with
        // consumers still pinned to 600.
        .package(url: "https://github.com/swiftlang/swift-syntax.git", "600.0.0-latest"..<"604.0.0")
    ],
    targets: [
        .target(
            name: "Hamcrest",
            dependencies: [],
            path: "Hamcrest"),

        .testTarget(
            name: "HamcrestTests",
            dependencies: [
                "Hamcrest"
            ],
            path: "HamcrestTests"),

        .macro(
            name: "HamcrestSwiftTestingMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ],
            path: "SwiftTesting",
            sources: [
                "Source/Macros"
            ]
        ),

        .target(
            name: "HamcrestSwiftTesting",
            // No swift-syntax product dependencies here: a non-macro target depending on swift-syntax
            // disables SwiftPM's prebuilt swift-syntax for the entire package graph of every consumer.
            dependencies: [
                "HamcrestSwiftTestingMacros"
            ],
            path: "SwiftTesting",
            sources: [
                "Source/Main"
            ]
        ),

        .testTarget(
            name: "HamcrestSwiftTestingTests",
            dependencies: [
                "Hamcrest",
                "HamcrestSwiftTesting",
                "HamcrestSwiftTestingMacros",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax")
            ],
            path: "SwiftTesting",
            sources: [
                "Source/Test"
            ]
        )
    ]
)
