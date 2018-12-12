//
//  WhatsNewViewController+HapticFeedback.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 28.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - HapticFeedback

public extension WhatsNewViewController {
    
    /// The HapticFeedback Enumeration
    enum HapticFeedback: Equatable, Hashable {
        /// ImpactFeedback with FeedbackStyle
        case impact(ImpactFeedbackStyle)
        /// SelectionFeedback
        case selection
        /// NotificationFeedback with FeedbackType
        case notification(NotificationFeedbackType)
        
        /// Execute HapticFeedback
        func execute() {
            // Verify iOS 10 or greater is available
            guard #available(iOSApplicationExtension 10.0, *) else {
                // HapticFeedback isn't available under iOS 10
                return
            }
            // Switch on self
            switch self {
            case .impact(let style):
                // UIFeedbackGenerator
                let feedbackGenerator = UIImpactFeedbackGenerator(style: style.rawStyle)
                feedbackGenerator.impactOccurred()
            case .selection:
                // UISelectionFeedbackGenerator
                let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
                selectionFeedbackGenerator.selectionChanged()
            case .notification(let type):
                // UINotificationFeedbackGenerator
                let notificationFeedbackGenerator = UINotificationFeedbackGenerator()
                notificationFeedbackGenerator.notificationOccurred(type.rawType)
            }
        }
        
    }
    
}

// MARK: - ImpactFeedbackStyle

public extension WhatsNewViewController.HapticFeedback {
    
    /// The ImpactFeedbackStyle
    enum ImpactFeedbackStyle: String, Codable, Equatable, Hashable, CaseIterable {
        /// Light
        case light
        /// Medium
        case medium
        /// Heavy
        case heavy
    }
    
}

// MARK: - ImpactFeedbackStyle+RawStyle

@available(iOSApplicationExtension 10.0, *)
public extension WhatsNewViewController.HapticFeedback.ImpactFeedbackStyle {
    
    /// The raw style as UIImpactFeedbackGenerator.FeedbackStyle
    var rawStyle: UIImpactFeedbackGenerator.FeedbackStyle {
        switch self {
        case .light:
            return .light
        case .medium:
            return .medium
        case .heavy:
            return .heavy
        }
    }
    
}

// MARK: - NotificationFeedbackType

public extension WhatsNewViewController.HapticFeedback {
    
    /// The NotificationFeedbackType
    enum NotificationFeedbackType: String, Codable, Equatable, Hashable, CaseIterable {
        /// Success
        case success
        /// Warning
        case warning
        /// Error
        case error
    }
    
}

// MARK: - NotificationFeedbackType+RawType

@available(iOSApplicationExtension 10.0, *)
public extension WhatsNewViewController.HapticFeedback.NotificationFeedbackType {
    
    /// The raw type as UINotificationFeedbackGenerator.FeedbackType
    var rawType: UINotificationFeedbackGenerator.FeedbackType {
        switch self {
        case .success:
            return .success
        case .warning:
            return .warning
        case .error:
            return .error
        }
    }
    
}
