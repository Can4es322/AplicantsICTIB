import SwiftUI

class PhoneFormatter: Formatter {
    override func string(for obj: Any?) -> String? {
        if let string = obj as? String {
            return formattedAddress(mac: string)
        }
        return nil
    }

    override func getObjectValue(
        _ obj: AutoreleasingUnsafeMutablePointer<AnyObject?>?,
        for string: String, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
        obj?.pointee = string as AnyObject?
        return true
    }

    func formattedAddress(mac: String?) -> String? {

        guard let number = mac?.filter("0123456789.".contains) else { return nil }

        let mask = "+# (###) ###-##-##"
        var result = ""
        var index = number.startIndex
        for character in mask where index < number.endIndex {
            if character == "#" {
                result.append(number[index])
                index = number.index(after: index)
            } else {
                result.append(character)
            }
        }
        return result
    }
}

class BirthdayFormatter: Formatter {
    override func string(for obj: Any?) -> String? {
        if let string = obj as? String {
            return formattedAddress(mac: string)
        }
        return nil
    }

    override func getObjectValue(
        _ obj: AutoreleasingUnsafeMutablePointer<AnyObject?>?,
        for string: String, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
        obj?.pointee = string as AnyObject?
        return true
    }

    func formattedAddress(mac: String?) -> String? {

        guard let number = mac?.filter("0123456789".contains) else { return nil }

        let mask = "####-##-##"
        var result = ""
        var index = number.startIndex
        for character in mask where index < number.endIndex {
            if character == "#" {
                result.append(number[index])
                index = number.index(after: index)
            } else {
                result.append(character)
            }
        }
        return result
    }
}
