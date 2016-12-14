import Commander
import PathKit

import Can

// MARK: Functions

/// Function to turn a string into a path, and print an error message if the string does not reference a flat file
func coerceFile(_ pathString: String) -> Path? {
    let path = Path(pathString)
    
    guard path.isFile else {
        print("Error: \(path) is \(path.isDirectory ? "a directory, ":"") not a file")
        
        return nil
    }
    
    return path
}

//func parse(linesIn file: Path, filter id: HondaCanID?) {
//    do {
//        try file.read().enumerateLines { (line, bool) in
//            guard let frame = try? HondaCanFrame(parse: line) else {
//                return
//            }
//
//            if let id = id {
//                if id == frame.id {
//                    print(frame)
//                }
//            } else {
//                print(frame)
//            }
//        }
//    } catch {
//        print("Error reading file: \(file)")
//    }
//}
//

// MARK: - Main

command(
//    Option("id", "", description: "Id to search for"),
    VariadicArgument("files", description: "Files to process")
) { (inputFiles: [String]) in
//    // Parse filter strings into HondaCanID so they can be compared later
//    var searchId: HondaCanID? = nil
//
//    if !id.isEmpty {
//        if let search = try? HondaCanID(parse: id) {
//            searchId = search
//        } else {
//            print("Error: couldn't parse filter id: \(id)")
//        }
//    }

    for inputFile in inputFiles {
        guard let path = coerceFile(inputFile) else { break } // give up if not a file
        
        guard let fileContents: String = try? path.read() else { print("Error reading \(path)"); break }
    
        let dataSet = DataSet(parse: fileContents)
        
        print(dataSet)
    }
    
}.run()
