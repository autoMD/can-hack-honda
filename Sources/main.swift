import Commander
import PathKit

func parse(linesIn file: Path) {
    do {
        try file.read().enumerateLines { (line, bool) in
            do {
                let frame = try HondaCanFrame(parse: line)
                print(frame)
            } catch ParseError.idNotFound {
                print("Couldn't find a CAN id in: \(line)")
            } catch ParseError.invalidHex(let hex) {
                print("Invalid hex: \(hex)")
            } catch {
                
            }
        }
    } catch {
        print("Error reading file: \(file)")
    }
}

let main = command(VariadicArgument("files", description: "Files to process")) { (files: [String]) in
    for file in files {
        let path = Path(file)
        
        guard path.isFile else {
            if (path.isDirectory) {
                print("Error: \(path) is a directory, not a file")
            } else {
                print("Error: \(path) is not a file")
            }
            break
        }
        parse(linesIn: path)
    }
}

main.run()
