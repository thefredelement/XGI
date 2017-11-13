//
//  XCSVariable.swift
//  XGI
//
//  Created by Fred Faust on 11/12/17.
//  Copyright © 2017 Fred Faust. All rights reserved.
//

import Foundation


enum XCSVariableError: Error {
    
    case valueForVariableNotFound
    
    var localizedDescription: String {
        switch self {
        case .valueForVariableNotFound:
            return "\(NSLocalizedString("The value for \(self) is nil", comment: "Inform the caller that the value for the xcode server variable is nil in the bash env."))"
        }
    }
}

/// Variable names used by Xcode server. The value property is the value of the bash variable
enum XCSVariable {
    
    /// The SVN revision number or Git hash of the commit used used to check out the project or workspace being integrated out of the primary source code repository. Only used when not checking out a branch or a tag.
    case XCS_PRIMARY_REPO_REVISION
    /// The tag of the primary source code repository used to check out the project or workspace being integrated. Only used when checking out a tag.
    case XCS_PRIMARY_REPO_TAG
    /// The branch of the primary source code repository used to check out the project or workspace being integrated. Only used when checking out a branch.
    case XCS_PRIMARY_REPO_BRANCH
    /// The path to the source code repository for the Xcode project or workspace being integrated. For the parent directory containing the source code repositories for Xcode Server, see XCS_SOURCE_DIR.
    case XCS_PRIMARY_REPO_DIR
    /// The directory containing any thinned .ipa files exported during the integration.
    case XCS_THINNED_PRODUCTS_PATH
    /// The path to a property list file (.plist) describing thinned .ipa files exported and their corresponding variants. This property list file only exists when thinning is performed.
    case XCS_THINNED_PRODUCTS_PLIST
    /// The change in test count since the previous integration. This value can be negative.
    case XCS_TESTS_CHANGE
    /// The total number of tests performed by the integration.
    case XCS_TESTS_COUNT
    /// The change in test failure count since the previous integration. This value can be negative.
    case XCS_TEST_FAILURE_CHANGE
    /// The total number of test failures encountered during the integration.
    case XCS_TEST_FAILURE_COUNT
    /// The change in static analyzer warning count since the previous integration. This value can be negative.
    case XCS_ANALYZER_WARNING_CHANGE
    /// The total number of static analyzer warnings encountered during the integration.
    case XCS_ANALYZER_WARNING_COUNT
    /// The change in warning count since the previous integration. This value can be negative.
    case XCS_WARNING_CHANGE
    /// The total number of warnings encountered during the integration.
    case XCS_WARNING_COUNT
    /// The change in error count since the previous integration. This value can be negative.
    case XCS_ERROR_CHANGE
    /// The total number of errors encountered during the integration.
    case XCS_ERROR_COUNT
    /// The path to the .app, .ipa, or .package file, if a product was exported from an archive during the integration.
    case XCS_PRODUCT
    /// The path to the .xarchive file, if archiving occurred during the integration.
    case XCS_ARCHIVE
    /// The path to an output file produced by the xcodebuild commands run during the integration.
    case XCS_XCODEBUILD_LOG
    /// The derived data directory. Xcode Server builds in a non-standard location, so this directory is bot-specific.
    case XCS_DERIVED_DATA_DIR
    /// The top-level directory where resources, including logs and products, are stored during integration.
    case XCS_OUTPUT_DIR
    /// The top-level directory containing source code repositories for Xcode Server. For the path to a repository itself, see XCS_PRIMARY_REPO_DIR.
    case XCS_SOURCE_DIR
    /// A string indicating the result of the integration, such as succeeded, test-failures, build-errors, and canceled. This variable is intended for use in post-integration trigger scripts.
    case XCS_INTEGRATION_RESULT
    /// The number of times the integration has been run.
    case XCS_INTEGRATION_NUMBER
    /// A short version of an integration ID. Some Xcode Server API requests use this information.
    case XCS_INTEGRATION_TINY_ID
    /// The ID of the integration. Bot IDs can be used in Xcode Server API requests.
    case XCS_INTEGRATION_ID
    /// A short version of a bot ID. Some Xcode Server API requests use this information.
    case XCS_BOT_TINY_ID
    /// The ID of the bot. Bot IDs can be used in Xcode Server API requests.
    case XCS_BOT_ID
    /// The name of the bot being run.
    case XCS_BOT_NAME
    /// The value of this variable is always 1. A script can check this value to determine if it’s running in the context of Xcode Server.
    case XCS
    
    private func value(for key: String) throws -> String {
        guard let value = ProcessInfo.processInfo.environment[key] else {
            throw XCSVariableError.valueForVariableNotFound
        }
        return value
    }
    
    private var key: String {
        return "\(self)"
    }
    
    func value() throws -> String {
        return try value(for: key)
    }
    
}
