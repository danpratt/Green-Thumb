//
//  ClientAnalyitics.swift
//  Green Thumb
//
//  Created by Daniel Pratt on 5/2/17.
//  Copyright © 2017 Jennifer Person. All rights reserved.
//

import Foundation
import Firebase

class ClientAnalytics {
    
    static func sendAddToCartEvent(itemAdded: String, buyItAgain: Bool? = false) {
        FIRAnalytics.logEvent(withName: kFIREventAddToCart, parameters: [kFIRParameterItemID : itemAdded as NSObject])
    }
    
    static func removeFromCart(itemRemoved: String) {
        FIRAnalytics.logEvent(withName: "remove_from_cart", parameters: [kFIRParameterItemID : itemRemoved as NSObject])
    }
    
    
    static func sendPlantViewedEvent(itemViewed: String) {
        FIRAnalytics.logEvent(withName: kFIREventViewItem, parameters: [kFIRParameterItemName: itemViewed as NSObject])
    }
    
    static func sendPurchaseItemsEvent(itemsPurchased: [String: Int]) {
        for item in itemsPurchased {
            FIRAnalytics.logEvent(withName: kFIREventEcommercePurchase, parameters: [kFIRParameterItemName: item.key as NSObject, kFIRParameterPrice: item.value as NSObject])
        }
    }
    
    static func sendPurchaseItemsAgainEvent(itemsPurchased: [String: Int]) {
        for item in itemsPurchased {
            FIRAnalytics.logEvent(withName: "event_purchase_again", parameters: ["log_item_purchased": item.key as NSObject, "log_number_item": item.value as NSObject])
        }
    }
    
    static func sendUserPropertyGardeningAbility(gardeningExperience: String) {
        FIRAnalytics.setUserPropertyString(gardeningExperience.description, forName: "gardening_experience")
    }
}
