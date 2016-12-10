import PackageDescription

let package = Package(
    name: "can-hack-honda",
    dependencies: [
        .Package(url: "https://github.com/kylef/Commander.git", majorVersion: 0, minor: 6)
    ]
)
