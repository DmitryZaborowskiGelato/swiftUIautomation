//
//  SwiftAEGlueTemplate.swift
//  SwiftAutomation
//
//


let SwiftAEGlueTemplate = [
"//",
"//  «GLUE_NAME»",
"//  «APPLICATION_NAME» «APPLICATION_VERSION»",
"//  «FRAMEWORK_NAME» «FRAMEWORK_VERSION»",
"//  `«AEGLUE_COMMAND»`",
"//",
"",
"",
"import Foundation",
"«IMPORT_SWIFTAE»",
"",
"",
"/******************************************************************************/",
"// Untargeted AppData instance used in App, Con, Its roots; also used by Application constructors to create their own targeted AppData instances",
"",
"private let gUntargetedAppData = AppData(glueInfo: GlueInfo(insertionSpecifierType: «PREFIX»Insertion.self,",
"                                                            objectSpecifierType: «PREFIX»Item.self,",
"                                                            multiObjectSpecifierType: «PREFIX»Items.self,",
"                                                            rootSpecifierType: «PREFIX»Root.self,",
"                                                            symbolType: «PREFIX»Symbol.self,",
"                                                            formatter: gSpecifierFormatter))",
"",
"",
"/******************************************************************************/",
"// Specifier formatter",
"",
"private let gSpecifierFormatter = SpecifierFormatter(applicationClassName: \"«APPLICATION_CLASS_NAME»\",",
"                                                     classNamePrefix: \"«PREFIX»\",",
"                                                     propertyNames: [«+PROPERTY_FORMATTER»",
"                                                                     «CODE»: \"«NAME»\", // «CODE_STR»«-PROPERTY_FORMATTER»",
"                                                     ],",
"                                                     elementsNames: [«+ELEMENTS_FORMATTER»",
"                                                                     «CODE»: \"«NAME»\", // «CODE_STR»«-ELEMENTS_FORMATTER»",
"                                                     ])",
"",
"",
"/******************************************************************************/",
"// Symbol subclass defines static type/enum/property constants based on «APPLICATION_NAME» terminology",
"",
"public class «PREFIX»Symbol: Symbol {",
"",
"    override public var typeAliasName: String {return \"«PREFIX»\"}",
"",
"    public override class func symbol(code: OSType, type: OSType = typeType, descriptor: NSAppleEventDescriptor? = nil) -> «PREFIX»Symbol {",
"        switch (code) {«+SYMBOL_SWITCH»",
"        case «CODE»: return self.«NAME» // «CODE_STR»«-SYMBOL_SWITCH»",
"        default: return super.symbol(code: code, type: type, descriptor: descriptor) as! «PREFIX»Symbol",
"        }",
"    }",
"",
"    // Types/properties«+TYPE_SYMBOL»",
"    public static let «NAME» = «PREFIX»Symbol(name: \"«NAME»\", code: «CODE», type: typeType) // «CODE_STR»«-TYPE_SYMBOL»",
"",
"    // Enumerators«+ENUM_SYMBOL»",
"    public static let «NAME» = «PREFIX»Symbol(name: \"«NAME»\", code: «CODE», type: typeEnumerated) // «CODE_STR»«-ENUM_SYMBOL»",
"}",
"",
"public typealias «PREFIX» = «PREFIX»Symbol // allows symbols to be written as (e.g.) «PREFIX».name instead of «PREFIX»Symbol.name",
"",
"",
"",
"/******************************************************************************/",
"// Specifier extensions; these add command methods and property/elements getters based on «APPLICATION_NAME» terminology",
"",
"public protocol «PREFIX»Command: SpecifierProtocol {} // provides AE dispatch methods",
"",
"// Command->Any will be bound when return type can't be inferred, else Command->T",
"",
"extension «PREFIX»Command {«+COMMAND»",
"    @discardableResult public func «COMMAND_NAME»(_ directParameter: Any = NoParameter,«+PARAMETER»",
"            «NAME»: Any = NoParameter,«-PARAMETER»",
"            resultType: Symbol? = nil, waitReply: Bool = true,",
"            withTimeout: TimeInterval? = nil, considering: ConsideringOptions? = nil) throws -> Any {",
"        return try self.appData.sendAppleEvent(name: \"«COMMAND_NAME»\", eventClass: «EVENT_CLASS», eventID: «EVENT_ID», // «EVENT_CLASS_STR»/«EVENT_ID_STR»",
"                parentSpecifier: (self as! Specifier), directParameter: directParameter, keywordParameters: [«+PARAMETER»",
"                    (\"«NAME»\", «CODE», «NAME»), // «CODE_STR»«-PARAMETER»",
"                ], requestedType: resultType, waitReply: waitReply, sendOptions: nil,",
"                withTimeout: withTimeout, considering: considering)",
"    }",
"    public func «COMMAND_NAME»<T>(_ directParameter: Any = NoParameter,«+PARAMETER»",
"            «NAME»: Any = NoParameter,«-PARAMETER»",
"            resultType: Symbol? = nil, waitReply: Bool = true,",
"            withTimeout: TimeInterval? = nil, considering: ConsideringOptions? = nil) throws -> T {",
"        return try self.appData.sendAppleEvent(name: \"«COMMAND_NAME»\", eventClass: «EVENT_CLASS», eventID: «EVENT_ID», // «EVENT_CLASS_STR»/«EVENT_ID_STR»",
"                parentSpecifier: (self as! Specifier), directParameter: directParameter, keywordParameters: [«+PARAMETER»",
"                    (\"«NAME»\", «CODE», «NAME»), // «CODE_STR»«-PARAMETER»",
"                ], requestedType: resultType, waitReply: waitReply, sendOptions: nil,",
"                withTimeout: withTimeout, considering: considering)",
"    }«-COMMAND»",
"}",
"",
"",
"public protocol «PREFIX»Query: ObjectSpecifierExtension, «PREFIX»Command {} // provides vars and methods for constructing specifiers",
"",
"extension «PREFIX»Query {",
"    ",
"    // Properties«+PROPERTY_SPECIFIER»",
"    public var «NAME»: «PREFIX»Item {return self.property(«CODE») as! «PREFIX»Item} // «CODE_STR»«-PROPERTY_SPECIFIER»",
"",
"    // Elements«+ELEMENTS_SPECIFIER»",
"    public var «NAME»: «PREFIX»Items {return self.elements(«CODE») as! «PREFIX»Items} // «CODE_STR»«-ELEMENTS_SPECIFIER»",
"}",
"",
"",
"/******************************************************************************/",
"// Specifier subclasses add app-specific extensions",
"",
"// beginning/end/before/after",
"public class «PREFIX»Insertion: InsertionSpecifier, «PREFIX»Command {}",
"",
"",
"// by index/name/id/previous/next",
"// first/middle/last/any",
"public class «PREFIX»Item: ObjectSpecifier, «PREFIX»Query {",
"    public typealias InsertionSpecifierType = «PREFIX»Insertion",
"    public typealias ObjectSpecifierType = «PREFIX»Item",
"    public typealias MultipleObjectSpecifierType = «PREFIX»Items",
"}",
"",
"// by range/test",
"// all",
"public class «PREFIX»Items: «PREFIX»Item, ElementsSpecifierExtension {}",
"",
"// App/Con/Its",
"public class «PREFIX»Root: RootSpecifier, «PREFIX»Query, RootSpecifierExtension {",
"    public typealias InsertionSpecifierType = «PREFIX»Insertion",
"    public typealias ObjectSpecifierType = «PREFIX»Item",
"    public typealias MultipleObjectSpecifierType = «PREFIX»Items",
"    public override class var untargetedAppData: AppData { return gUntargetedAppData }",
"}",
"",
"// application",
"public class «APPLICATION_CLASS_NAME»: «PREFIX»Root, ApplicationExtension {«+DEFAULT_INIT»",
"    public convenience init(launchOptions: LaunchOptions = DefaultLaunchOptions, relaunchMode: RelaunchMode = DefaultRelaunchMode) {",
"        self.init(rootObject: AppRootDesc, appData: type(of:self).untargetedAppData.targetedCopy(",
"                .bundleIdentifier(\"«BUNDLE_IDENTIFIER»\", true), launchOptions: launchOptions, relaunchMode: relaunchMode))",
"    }",
"«-DEFAULT_INIT»}",
"",
"// App/Con/Its root objects used to construct untargeted specifiers; these can be used to construct specifiers for use in commands, though cannot send commands themselves",
"",
"public let «PREFIX»App = gUntargetedAppData.rootObjects.app as! «PREFIX»Root",
"public let «PREFIX»Con = gUntargetedAppData.rootObjects.con as! «PREFIX»Root",
"public let «PREFIX»Its = gUntargetedAppData.rootObjects.its as! «PREFIX»Root",
"",
""
].joined(separator: "\n")


