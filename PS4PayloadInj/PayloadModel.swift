//
//  PayloadModel.swift
//  PS4PayloadInj
//
//  Created by CrazyMind90 on 19/05/2022.
//

import Foundation

class PayloadModel : NSObject {
    
    func RunCMDWithLog(CMD : String) -> String {
        
        let task = Process()
        var args = [String]()
        args.append("-c")
        args.append(CMD)
        task.launchPath = "/bin/sh"
        task.arguments = args
        let outputPipe = Pipe()
        task.standardInput = Pipe()
        task.standardOutput = outputPipe
        task.launch()
        
        let outputData : Data = outputPipe.fileHandleForReading.readDataToEndOfFile()
        let outputString : String = String.init(data: outputData, encoding: .utf8)!
        
        return outputString
    }

}
