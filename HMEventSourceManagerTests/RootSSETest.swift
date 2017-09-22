//
//  RootSSETest.swift
//  HMEventSourceManagerTests
//
//  Created by Hai Pham on 21/9/17.
//  Copyright © 2017 Holmusk. All rights reserved.
//

import HMRequestFramework
import ReachabilitySwift
import RxSwift
import RxTest
import SwiftUtilities
import XCTest
@testable import HMEventSourceManager

public class RootSSETest: XCTestCase {
    public typealias Request = HMSSEManager.Request
    public typealias Event = HMSSEManager.Event
    public typealias Result = HMSSEManager.Result
    public var scheduler: TestScheduler!
    public var disposeBag: DisposeBag!
    public var userDefaults: UserDefaults!
    public var timeout: TimeInterval!
    
    public let suiteName = "com.holmusk.HMEventSourceManager"
     
    override public func setUp() {
        super.setUp()
        scheduler = TestScheduler(initialClock: 0)
        disposeBag = DisposeBag()
        userDefaults = UserDefaults(suiteName: suiteName)
        timeout = 10
    }
    
    override public func tearDown() {
        super.tearDown()
        userDefaults.removeSuite(named: suiteName)
    }
    
    public func newSSEManager() -> HMMockEventSourceManager {
        let sseManager = HMSSEManager.builder()
            .with(networkChecker: Reachability())
            .with(userDefaults: userDefaults)
            .build()
        
        return HMMockEventSourceManager(sseManager)
    }
}