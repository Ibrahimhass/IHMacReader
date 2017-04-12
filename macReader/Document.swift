//
//  Document.swift
//  macReader
//
//  Created by Md Ibrahim Hassan on 11/04/17.
//  Copyright © 2017 Md Ibrahim Hassan. All rights reserved.
//

import Cocoa

class Document: NSDocument {

    var contents: String = ""
    
    override init() {
        super.init()
        // Add your subclass-specific initialization here.
    }

    override class func autosavesInPlace() -> Bool {
        return true
    }

    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: "Document Window Controller") as! NSWindowController
        self.addWindowController(windowController)
        
        let viewController = windowController.contentViewController as! ViewController
        viewController.contents = contents
        self.addWindowController(windowController)
    }

    override func data(ofType typeName: String) throws -> Data {
      
        let windowController = windowControllers[0]
        let viewController = windowController.contentViewController as! ViewController
        let contents = viewController.contents ?? ""
        
        if let data = contents.data(using: String.Encoding.utf8)
        {
            return data
        }
        else
        {
            let userInfo = [NSLocalizedRecoveryOptionsErrorKey: "File cannot be encoded to UTF8"]
            throw NSError(domain: "com.ibrahim.speakingTextEditor", code: 0, userInfo: userInfo)
        }
        
    }

    override func read(from data: Data, ofType typeName: String) throws {
        if let contents = String(data: data, encoding: .utf8)
        {
            self.contents = contents
        }
        else
        {
            let userInfo = [NSLocalizedRecoveryOptionsErrorKey: "File cannot be encoded to UTF8"]
            throw NSError(domain: "com.ibrahim.speakingTextEditor", code: 0, userInfo: userInfo)
        }
//        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }


}

