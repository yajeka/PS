//
//  PSTests.swift
//  PSTests
//
//  Created by Andrey Koyro on 19/03/2016.
//  Copyright © 2016 hackathon. All rights reserved.
//

import XCTest
import Parse

class PSTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        Parse.setApplicationId("lARUxNeUrMj0KQxltNnBwzhpkhrpUpEXuUTfr1Ca", clientKey: "kmrT8qwZxJzKLJewJBzVH2MM85nHFCO0AyY5lBIv");
        
        let gameScore = PFObject(className: "GameScore");
        
        gameScore["score"] = 1337;
        do {
            try gameScore.save()
        } catch {
            print("error")
        }
        
        let query = PFQuery(className: "GameScore");
        
        do {
            let values = try query.findObjects();
            print(values);
            let task = PFObject.deleteAllInBackground(values);
            task.waitUntilFinished()
        } catch {
            print("error")
        }
        
//        gameScore.saveInBackgroundWithBlock({ (result: Bool , error: NSError? ) -> Void in
//            print(result;
//        })

        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
