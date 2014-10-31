//
//  ScriptController.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-30-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

/** This class plays scripts synced to the CADisplayLink. */
class ScriptController: NSObject {
	
	/** Display link used to synchronize the scripts. Theoretcially can be stopped once the scripts end. */
	var displayLink: CADisplayLink?
	
	// It may be overkill to have queues for new scripts / currently playing scripts..who knows.
	// It might also be worth doing some locking on mutating this array.
	private var enqueuedScripts = [EntityScript]()
	
	private class var internalInstance: ScriptController {
		struct Singleton {
			static let instance = ScriptController()
		}

		return Singleton.instance
	}

	
	
	func heartbeat(displayLink: CADisplayLink) {
		// Really basic for now: just one script at a time (yeah this will probably break once scripts have more than one action in them...
		if let firstScript = self.enqueuedScripts.last {
			// See note in -enqueueScript for why this is happening at the *end* of the array.
			self.enqueuedScripts.removeLast()
			
			firstScript.play()
		}
		
		// Now all the entity views should update.....
	}
	
	
	class func enqueueScript(script: EntityScript) {
		let instance = self.internalInstance
		if instance.displayLink == nil {
			instance.displayLink = CADisplayLink(target: instance, selector: "heartbeat:")
			instance.displayLink?.addToRunLoop(NSRunLoop.currentRunLoop(), forMode: NSRunLoopCommonModes)
		}
		// Inserting into the front of the queue, and we're removing from the back of the queue (Array seems to have better API for doing these operations than the reverse.)
		instance.enqueuedScripts.insert(script, atIndex: 0)
	}
	
}