import Commander
import PathKit

// swiftlint:disable:next variable_name
func parse(linesIn file: Path, filter id: HondaCanID?) {
    do {
        try file.read().enumerateLines { (line, bool) in
            guard let frame = try? HondaCanFrame(parse: line) else {
                return
            }

            if let id = id {
                if id == frame.id {
                    print(frame)
                }
            } else {
                print(frame)
            }
        }
    } catch {
        print("Error reading file: \(file)")
    }
}

command(
    Option("id", "", description: "Id to search for"),
    VariadicArgument("files", description: "Files to process")
) { (id: String, files: [String]) in
    // Parse filter strings into HondaCanID so they can be compared later
    var searchId: HondaCanID? = nil

    if !id.isEmpty {
        if let search = try? HondaCanID(parse: id) {
            searchId = search
        } else {
            print("Error: couldn't parse filter id: \(id)")
        }
    }

    for file in files {
        let path = Path(file)

        guard path.isFile else {
            if path.isDirectory {
                print("Error: \(path) is a directory, not a file")
            } else {
                print("Error: \(path) is not a file")
            }
            break
        }

        parse(linesIn: path, filter: searchId)
    }
}.run()
