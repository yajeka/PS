//
//  UIViewController+UIAlert.swift
//  PS
//
//  Created by Yauheni Yarotski on 20.03.16.
//  Copyright © 2016 hackathon. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    // MARK: - Alerts
    
    public func showAlert(title title: String? = nil, message: String? = nil, error: NSError? = nil, okActionHandler: ((UIAlertAction) -> Void)? = nil)
    {
        let actions = [UIAlertAction(title: ActionTitle.Ok(), style: .Default, handler: okActionHandler)]
        
        var composedMessage = message
        
        #if DEBUG
            if let error = error {
                composedMessage += "\n\nDiagnostics: \(error.localizedDescription)"
            }
        #endif
        
        presentAlert(title: title, message: composedMessage, actions: actions)
    }
    
    public func showAlertForNetworkError(error: NSError? = nil, okActionHandler:((UIAlertAction) -> Void)? = nil)
    {
        showAlert(
            title: NSLocalizedString("Network Error", comment: "Network Error title"),
            message: NSLocalizedString("There was an error connecting to the server.  Please try again later when you have an Internet connection.", comment:"Network Error message"),
            error: error,
            okActionHandler: okActionHandler
        )
    }
    
    // MARK: - Dialogs (like alert but with actions > 1)
    
    public func showDialog(title title: String? = nil, message: String? = nil, actions: [UIAlertAction]){
        presentAlert(title: title, message: message, actions: actions)
    }
    
    public func showDialogForConfirmation(
        title title: String? = nil,
        message: String? = nil,
        cancelActionHandler: ((UIAlertAction) -> Void)? = nil,
        confirmActionHandler: ((UIAlertAction) -> Void)? = nil)
    {
        let actions = [
            UIAlertAction(title: ActionTitle.Cancel(), style: .Cancel, handler: cancelActionHandler),
            UIAlertAction(title: ActionTitle.Ok(), style: .Default, handler: confirmActionHandler)
        ]
        
        presentAlert(title: title, message: message, actions: actions)
    }
    
    // MARK: - ActionSheets (for iPad automatically convertes into dialog)
    
    public func showActionSheet(title title: String? = nil, message: String? = nil, actions: [UIAlertAction])
    {
        let isIpad = UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad
        
        presentAlert(title: title, message: message, style: isIpad ? .Alert : .ActionSheet, actions: actions)
    }
    
    public func showActionSheetDestructive(
        title title: String? = nil,
        message: String? = nil,
        showTitleAndMessageOnIphone: Bool = true,
        cancelActionHandler: ((UIAlertAction) -> Void)? = nil,
        destructiveActionHandler: ((UIAlertAction) -> Void)? = nil)
    {
        let actions = [
            UIAlertAction(title: ActionTitle.Cancel(), style: .Cancel, handler: cancelActionHandler),
            UIAlertAction(title: ActionTitle.Remove(), style: .Destructive, handler: destructiveActionHandler)
        ]
        
        let isIpad = UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad
        
        let title = (!showTitleAndMessageOnIphone && !isIpad) ? nil : title
        let message = (!showTitleAndMessageOnIphone && !isIpad) ? nil : message
        
        presentAlert(title: title, message: message, style: isIpad ? .Alert : .ActionSheet, actions: actions)
    }
    
    // MARK: - Privite methods
    
    private func presentAlert(
        title title: String? = nil,
        message: String? = nil,
        style: UIAlertControllerStyle = .Alert,
        actions: [UIAlertAction])
    {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        
        if !actions.isEmpty {
            for action in actions {
                alert.addAction(action)
            }
        }
        else {//defaul action if nobody will set at least one action
            alert.addAction(UIAlertAction(title: ActionTitle.Ok(), style: .Default, handler: nil))
        }
        
        presentViewController(alert, animated: true, completion: nil)
    }
}

struct ActionTitle {
    static func Ok() -> String {
        return NSLocalizedString("OK", comment:"OK button title")
    }
    static func Cancel() -> String {
        return NSLocalizedString("Cancel", comment: "")
    }
    static func Remove() -> String {
        return NSLocalizedString("Remove", comment: "")
    }
}