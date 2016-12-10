import PackageDescription

let package = Package(
    name: "can-hack-honda",
    dependencies: [
        .Package(url: "https://github.com/kylef/Commander", majorVersion: 0),
		.Package(url: "https://github.com/rjsmith1999/PathKit", majorVersion: 0)
    ]
)
