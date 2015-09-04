//
//  ViewController.swift
//  Boogie1
//
//  Created by Arvind Subramanian on 6/14/15.
//  Copyright (c) 2015 iOS Boogie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let filePath = NSBundle.mainBundle().pathForResource("small", ofType: "txt"), contents = NSString(contentsOfFile: filePath, encoding: NSUTF8StringEncoding, error: nil) {
            findTheDuplicates(contents as String)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    function that counts
    how often each word appears in the text and prints:
    word1 count1
    word2 count2
    ...
    
    Print the above list in order sorted by word (swift will sort punctuation to
    come before letters -- that's fine). Store all the words as lowercase,
    so 'The' and 'the' count as the same word.
    */
    func findTheDuplicates(fileContents: String) {
        var lowerCaseText = fileContents.lowercaseString
        lowerCaseText = lowerCaseText.stringByReplacingOccurrencesOfString("\n", withString: " ")
        var textWords = split(lowerCaseText) {$0 == " "}
        
        var wordAndCount = [String : Int]()
        
        for word in textWords {
            if let value = wordAndCount[word] {
                wordAndCount[word] = value + 1
            } else {
                wordAndCount[word] = 1
            }
        }
        
        for (k,v) in (Array(wordAndCount).sorted {$0.1 > $1.1}) {
            println("\(k) \(v)")
        }
    }
    
}

