import Commander
import PathKit

func parse(linesIn file: Path) {
    do {
        try file.read().enumerateLines { (line, bool) in
            let frame = try? HondaCanFrame(parse: line)
            
            if let frame = frame {
                print(frame)
            } else {
                print("Couldn't parse frame from line: \(line)")
            }
        }
    } catch {
        print("Error reading file: \(file)")
    }
}

let main = command { (files: String) in
    let path = Path(files)
    
    if path.isDirectory {
        print("\(path) is a directory")
        print("Iterating over all files")
        
        for file in path.glob("*") {
            parse(linesIn: file)
        }
    } else if path.isFile {
        parse(linesIn: path)
    }
}

main.run()
