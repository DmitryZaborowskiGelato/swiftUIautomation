//
//  ScriptEditorGlue.swift
//  Script Editor.app 2.11
//  SwiftAutomation.framework 0.1.0
//  `aeglue 'Script Editor.app'`
//


import Foundation
import AppleEvents
import SwiftAutomation


/******************************************************************************/
// Create an untargeted AppData instance for use in App, Con, Its roots,
// and in Application initializers to create targeted AppData instances.

private let _specifierFormatter = SwiftAutomation.SpecifierFormatter(
        applicationClassName: "ScriptEditor",
        classNamePrefix: "SED",
        typeNames: [
                0x616c6973: "alias", // "alis"
                0x2a2a2a2a: "anything", // "****"
                0x63617070: "application", // "capp"
                0x62756e64: "applicationBundleID", // "bund"
                0x7369676e: "applicationSignature", // "sign"
                0x6170726c: "applicationURL", // "aprl"
                0x61707220: "April", // "apr "
                0x61736b20: "ask", // "ask "
                0x61747473: "attachment", // "atts"
                0x63617472: "attributeRun", // "catr"
                0x61756720: "August", // "aug "
                0x62657374: "best", // "best"
                0x626d726b: "bookmarkData", // "bmrk"
                0x626f6f6c: "boolean", // "bool"
                0x71647274: "boundingRectangle", // "qdrt"
                0x70626e64: "bounds", // "pbnd"
                0x63617365: "case_", // "case"
                0x63686120: "character", // "cha "
                0x70726e67: "characterRange", // "prng"
                0x70636c73: "class_", // "pcls"
                0x68636c62: "closeable", // "hclb"
                0x6c77636c: "collating", // "lwcl"
                0x636f6c72: "color", // "colr"
                0x636c7274: "colorTable", // "clrt"
                0x656e756d: "constant", // "enum"
                0x70636e74: "contents", // "pcnt"
                0x6c776370: "copies", // "lwcp"
                0x74646173: "dashStyle", // "tdas"
                0x74647461: "data", // "tdta"
                0x6c647420: "date", // "ldt "
                0x64656320: "December", // "dec "
                0x6465636d: "decimalStruct", // "decm"
                0x64736372: "description_", // "dscr"
                0x6c776474: "detailed", // "lwdt"
                0x64696163: "diacriticals", // "diac"
                0x646f6375: "document", // "docu"
                0x636f6d70: "doubleInteger", // "comp"
                0x656e6373: "encodedString", // "encs"
                0x6c776c70: "endingPage", // "lwlp"
                0x45505320: "EPSPicture", // "EPS "
                0x6c776568: "errorHandling", // "lweh"
                0x6576746c: "eventLog", // "evtl"
                0x65787061: "expansion", // "expa"
                0x6661786e: "faxNumber", // "faxn"
                0x66656220: "February", // "feb "
                0x6174666e: "fileName", // "atfn"
                0x66737266: "fileRef", // "fsrf"
                0x6675726c: "fileURL", // "furl"
                0x66697864: "fixed", // "fixd"
                0x66706e74: "fixedPoint", // "fpnt"
                0x66726374: "fixedRectangle", // "frct"
                0x6973666c: "floating", // "isfl"
                0x666f6e74: "font", // "font"
                0x66726920: "Friday", // "fri "
                0x70697366: "frontmost", // "pisf"
                0x47494666: "GIFPicture", // "GIFf"
                0x63677478: "graphicText", // "cgtx"
                0x68797068: "hyphens", // "hyph"
                0x49442020: "id", // "ID  "
                0x70696478: "index", // "pidx"
                0x63696e73: "insertionPoint", // "cins"
                0x6c6f6e67: "integer", // "long"
                0x69747874: "internationalText", // "itxt"
                0x696e746c: "internationalWritingCode", // "intl"
                0x636f626a: "item", // "cobj"
                0x6a616e20: "January", // "jan "
                0x4a504547: "JPEGPicture", // "JPEG"
                0x6a756c20: "July", // "jul "
                0x6a756e20: "June", // "jun "
                0x6b706964: "kernelProcessID", // "kpid"
                0x6c616e67: "language", // "lang"
                0x6c64626c: "largeReal", // "ldbl"
                0x6c697374: "list", // "list"
                0x696e736c: "locationReference", // "insl"
                0x6c667864: "longFixed", // "lfxd"
                0x6c667074: "longFixedPoint", // "lfpt"
                0x6c667263: "longFixedRectangle", // "lfrc"
                0x6c706e74: "longPoint", // "lpnt"
                0x6c726374: "longRectangle", // "lrct"
                0x6d616368: "machine", // "mach"
                0x6d4c6f63: "machineLocation", // "mLoc"
                0x706f7274: "machPort", // "port"
                0x6d617220: "March", // "mar "
                0x6d617920: "May", // "may "
                0x69736d6e: "miniaturizable", // "ismn"
                0x706d6e64: "miniaturized", // "pmnd"
                0x706d6f64: "modal", // "pmod"
                0x696d6f64: "modified", // "imod"
                0x6d6f6e20: "Monday", // "mon "
                0x706e616d: "name", // "pnam"
                0x6e6f2020: "no", // "no  "
                0x6e6f7620: "November", // "nov "
                0x6e756c6c: "null", // "null"
                0x6e756d65: "numericStrings", // "nume"
                0x6f637420: "October", // "oct "
                0x6c776c61: "pagesAcross", // "lwla"
                0x6c776c64: "pagesDown", // "lwld"
                0x63706172: "paragraph", // "cpar"
                0x70707468: "path", // "ppth"
                0x50494354: "PICTPicture", // "PICT"
                0x74706d6d: "pixelMapRecord", // "tpmm"
                0x51447074: "point", // "QDpt"
                0x70736574: "printSettings", // "pset"
                0x70736e20: "processSerialNumber", // "psn "
                0x70414c4c: "properties", // "pALL"
                0x70726f70: "property_", // "prop"
                0x70756e63: "punctuation", // "punc"
                0x646f7562: "real", // "doub"
                0x7265636f: "record", // "reco"
                0x6f626a20: "reference", // "obj "
                0x6c777174: "requestedPrintTime", // "lwqt"
                0x7072737a: "resizable", // "prsz"
                0x74723136: "RGB16Color", // "tr16"
                0x74723936: "RGB96Color", // "tr96"
                0x63524742: "RGBColor", // "cRGB"
                0x74726f74: "rotation", // "trot"
                0x73617420: "Saturday", // "sat "
                0x73637074: "script", // "scpt"
                0x73656c65: "selection", // "sele"
                0x7473656c: "selectionObject", // "tsel"
                0x73657020: "September", // "sep "
                0x73686f72: "shortInteger", // "shor"
                0x7074737a: "size", // "ptsz"
                0x73696e67: "smallReal", // "sing"
                0x6c777374: "standard", // "lwst"
                0x6c776670: "startingPage", // "lwfp"
                0x54455854: "string", // "TEXT"
                0x7374796c: "styledClipboardText", // "styl"
                0x53545854: "styledText", // "STXT"
                0x73756e20: "Sunday", // "sun "
                0x7370636d: "supportsCompiling", // "spcm"
                0x73707263: "supportsRecording", // "sprc"
                0x74727072: "targetPrinter", // "trpr"
                0x63747874: "text", // "ctxt"
                0x74737479: "textStyleInfo", // "tsty"
                0x74687520: "Thursday", // "thu "
                0x54494646: "TIFFPicture", // "TIFF"
                0x70746974: "titled", // "ptit"
                0x74756520: "Tuesday", // "tue "
                0x74797065: "typeClass", // "type"
                0x75747874: "UnicodeText", // "utxt"
                0x75636f6d: "unsignedDoubleInteger", // "ucom"
                0x6d61676e: "unsignedInteger", // "magn"
                0x75736872: "unsignedShortInteger", // "ushr"
                0x75743136: "UTF16Text", // "ut16"
                0x75746638: "UTF8Text", // "utf8"
                0x76657273: "version", // "vers"
                0x70766973: "visible", // "pvis"
                0x77656420: "Wednesday", // "wed "
                0x77686974: "whitespace", // "whit"
                0x6377696e: "window", // "cwin"
                0x63776f72: "word", // "cwor"
                0x70736374: "writingCode", // "psct"
                0x79657320: "yes", // "yes "
                0x69737a6d: "zoomable", // "iszm"
                0x707a756d: "zoomed", // "pzum"
        ],
        propertyNames: [
                0x70626e64: "bounds", // "pbnd"
                0x70726e67: "characterRange", // "prng"
                0x70636c73: "class_", // "pcls"
                0x68636c62: "closeable", // "hclb"
                0x6c77636c: "collating", // "lwcl"
                0x636f6c72: "color", // "colr"
                0x70636e74: "contents", // "pcnt"
                0x6c776370: "copies", // "lwcp"
                0x64736372: "description_", // "dscr"
                0x646f6375: "document", // "docu"
                0x6c776c70: "endingPage", // "lwlp"
                0x6c776568: "errorHandling", // "lweh"
                0x6576746c: "eventLog", // "evtl"
                0x6661786e: "faxNumber", // "faxn"
                0x6174666e: "fileName", // "atfn"
                0x6973666c: "floating", // "isfl"
                0x666f6e74: "font", // "font"
                0x70697366: "frontmost", // "pisf"
                0x49442020: "id", // "ID  "
                0x70696478: "index", // "pidx"
                0x6c616e67: "language", // "lang"
                0x69736d6e: "miniaturizable", // "ismn"
                0x706d6e64: "miniaturized", // "pmnd"
                0x706d6f64: "modal", // "pmod"
                0x696d6f64: "modified", // "imod"
                0x706e616d: "name", // "pnam"
                0x6c776c61: "pagesAcross", // "lwla"
                0x6c776c64: "pagesDown", // "lwld"
                0x70707468: "path", // "ppth"
                0x70414c4c: "properties", // "pALL"
                0x6c777174: "requestedPrintTime", // "lwqt"
                0x7072737a: "resizable", // "prsz"
                0x73656c65: "selection", // "sele"
                0x7074737a: "size", // "ptsz"
                0x6c776670: "startingPage", // "lwfp"
                0x7370636d: "supportsCompiling", // "spcm"
                0x73707263: "supportsRecording", // "sprc"
                0x74727072: "targetPrinter", // "trpr"
                0x63747874: "text", // "ctxt"
                0x70746974: "titled", // "ptit"
                0x76657273: "version", // "vers"
                0x70766973: "visible", // "pvis"
                0x69737a6d: "zoomable", // "iszm"
                0x707a756d: "zoomed", // "pzum"
        ],
        elementsNames: [
                0x63617070: ("application", "applications"), // "capp"
                0x61747473: ("attachment", "attachments"), // "atts"
                0x63617472: ("attributeRun", "attributeRuns"), // "catr"
                0x63686120: ("character", "characters"), // "cha "
                0x70636c73: ("class_", "class_"), // "pcls"
                0x636f6c72: ("color", "colors"), // "colr"
                0x646f6375: ("document", "documents"), // "docu"
                0x63696e73: ("insertionPoint", "insertionPoints"), // "cins"
                0x636f626a: ("item", "items"), // "cobj"
                0x6c616e67: ("language", "languages"), // "lang"
                0x63706172: ("paragraph", "paragraphs"), // "cpar"
                0x70736574: ("printSettings", "printSettings"), // "pset"
                0x7473656c: ("selectionObject", "selectionObjects"), // "tsel"
                0x63747874: ("text", "text"), // "ctxt"
                0x6377696e: ("window", "windows"), // "cwin"
                0x63776f72: ("word", "words"), // "cwor"
        ])

private let _glueClasses = SwiftAutomation.GlueClasses(
                                                insertionSpecifierType: SEDInsertion.self,
                                                objectSpecifierType: SEDItem.self,
                                                multiObjectSpecifierType: SEDItems.self,
                                                rootSpecifierType: SEDRoot.self,
                                                applicationType: ScriptEditor.self,
                                                symbolType: SEDSymbol.self,
                                                formatter: _specifierFormatter)

private let _untargetedAppData = SwiftAutomation.AppData(glueClasses: _glueClasses)


/******************************************************************************/
// Symbol subclass defines static type/enum/property constants based on Script Editor.app terminology

public class SEDSymbol: SwiftAutomation.Symbol {

    override public var typeAliasName: String {return "SED"}

    public override class func symbol(code: OSType, type: OSType = AppleEvents.typeType, descriptor: ScalarDescriptor? = nil) -> SEDSymbol {
        switch (code) {
        case 0x616c6973: return self.alias // "alis"
        case 0x2a2a2a2a: return self.anything // "****"
        case 0x63617070: return self.application // "capp"
        case 0x62756e64: return self.applicationBundleID // "bund"
        case 0x7369676e: return self.applicationSignature // "sign"
        case 0x6170726c: return self.applicationURL // "aprl"
        case 0x61707220: return self.April // "apr "
        case 0x61736b20: return self.ask // "ask "
        case 0x61747473: return self.attachment // "atts"
        case 0x63617472: return self.attributeRun // "catr"
        case 0x61756720: return self.August // "aug "
        case 0x62657374: return self.best // "best"
        case 0x626d726b: return self.bookmarkData // "bmrk"
        case 0x626f6f6c: return self.boolean // "bool"
        case 0x71647274: return self.boundingRectangle // "qdrt"
        case 0x70626e64: return self.bounds // "pbnd"
        case 0x63617365: return self.case_ // "case"
        case 0x63686120: return self.character // "cha "
        case 0x70726e67: return self.characterRange // "prng"
        case 0x70636c73: return self.class_ // "pcls"
        case 0x68636c62: return self.closeable // "hclb"
        case 0x6c77636c: return self.collating // "lwcl"
        case 0x636f6c72: return self.color // "colr"
        case 0x636c7274: return self.colorTable // "clrt"
        case 0x656e756d: return self.constant // "enum"
        case 0x70636e74: return self.contents // "pcnt"
        case 0x6c776370: return self.copies // "lwcp"
        case 0x74646173: return self.dashStyle // "tdas"
        case 0x74647461: return self.data // "tdta"
        case 0x6c647420: return self.date // "ldt "
        case 0x64656320: return self.December // "dec "
        case 0x6465636d: return self.decimalStruct // "decm"
        case 0x64736372: return self.description_ // "dscr"
        case 0x6c776474: return self.detailed // "lwdt"
        case 0x64696163: return self.diacriticals // "diac"
        case 0x646f6375: return self.document // "docu"
        case 0x636f6d70: return self.doubleInteger // "comp"
        case 0x656e6373: return self.encodedString // "encs"
        case 0x6c776c70: return self.endingPage // "lwlp"
        case 0x45505320: return self.EPSPicture // "EPS "
        case 0x6c776568: return self.errorHandling // "lweh"
        case 0x6576746c: return self.eventLog // "evtl"
        case 0x65787061: return self.expansion // "expa"
        case 0x6661786e: return self.faxNumber // "faxn"
        case 0x66656220: return self.February // "feb "
        case 0x6174666e: return self.fileName // "atfn"
        case 0x66737266: return self.fileRef // "fsrf"
        case 0x6675726c: return self.fileURL // "furl"
        case 0x66697864: return self.fixed // "fixd"
        case 0x66706e74: return self.fixedPoint // "fpnt"
        case 0x66726374: return self.fixedRectangle // "frct"
        case 0x6973666c: return self.floating // "isfl"
        case 0x666f6e74: return self.font // "font"
        case 0x66726920: return self.Friday // "fri "
        case 0x70697366: return self.frontmost // "pisf"
        case 0x47494666: return self.GIFPicture // "GIFf"
        case 0x63677478: return self.graphicText // "cgtx"
        case 0x68797068: return self.hyphens // "hyph"
        case 0x49442020: return self.id // "ID  "
        case 0x70696478: return self.index // "pidx"
        case 0x63696e73: return self.insertionPoint // "cins"
        case 0x6c6f6e67: return self.integer // "long"
        case 0x69747874: return self.internationalText // "itxt"
        case 0x696e746c: return self.internationalWritingCode // "intl"
        case 0x636f626a: return self.item // "cobj"
        case 0x6a616e20: return self.January // "jan "
        case 0x4a504547: return self.JPEGPicture // "JPEG"
        case 0x6a756c20: return self.July // "jul "
        case 0x6a756e20: return self.June // "jun "
        case 0x6b706964: return self.kernelProcessID // "kpid"
        case 0x6c616e67: return self.language // "lang"
        case 0x6c64626c: return self.largeReal // "ldbl"
        case 0x6c697374: return self.list // "list"
        case 0x696e736c: return self.locationReference // "insl"
        case 0x6c667864: return self.longFixed // "lfxd"
        case 0x6c667074: return self.longFixedPoint // "lfpt"
        case 0x6c667263: return self.longFixedRectangle // "lfrc"
        case 0x6c706e74: return self.longPoint // "lpnt"
        case 0x6c726374: return self.longRectangle // "lrct"
        case 0x6d616368: return self.machine // "mach"
        case 0x6d4c6f63: return self.machineLocation // "mLoc"
        case 0x706f7274: return self.machPort // "port"
        case 0x6d617220: return self.March // "mar "
        case 0x6d617920: return self.May // "may "
        case 0x69736d6e: return self.miniaturizable // "ismn"
        case 0x706d6e64: return self.miniaturized // "pmnd"
        case 0x706d6f64: return self.modal // "pmod"
        case 0x696d6f64: return self.modified // "imod"
        case 0x6d6f6e20: return self.Monday // "mon "
        case 0x706e616d: return self.name // "pnam"
        case 0x6e6f2020: return self.no // "no  "
        case 0x6e6f7620: return self.November // "nov "
        case 0x6e756c6c: return self.null // "null"
        case 0x6e756d65: return self.numericStrings // "nume"
        case 0x6f637420: return self.October // "oct "
        case 0x6c776c61: return self.pagesAcross // "lwla"
        case 0x6c776c64: return self.pagesDown // "lwld"
        case 0x63706172: return self.paragraph // "cpar"
        case 0x70707468: return self.path // "ppth"
        case 0x50494354: return self.PICTPicture // "PICT"
        case 0x74706d6d: return self.pixelMapRecord // "tpmm"
        case 0x51447074: return self.point // "QDpt"
        case 0x70736574: return self.printSettings // "pset"
        case 0x70736e20: return self.processSerialNumber // "psn "
        case 0x70414c4c: return self.properties // "pALL"
        case 0x70726f70: return self.property_ // "prop"
        case 0x70756e63: return self.punctuation // "punc"
        case 0x646f7562: return self.real // "doub"
        case 0x7265636f: return self.record // "reco"
        case 0x6f626a20: return self.reference // "obj "
        case 0x6c777174: return self.requestedPrintTime // "lwqt"
        case 0x7072737a: return self.resizable // "prsz"
        case 0x74723136: return self.RGB16Color // "tr16"
        case 0x74723936: return self.RGB96Color // "tr96"
        case 0x63524742: return self.RGBColor // "cRGB"
        case 0x74726f74: return self.rotation // "trot"
        case 0x73617420: return self.Saturday // "sat "
        case 0x73637074: return self.script // "scpt"
        case 0x73656c65: return self.selection // "sele"
        case 0x7473656c: return self.selectionObject // "tsel"
        case 0x73657020: return self.September // "sep "
        case 0x73686f72: return self.shortInteger // "shor"
        case 0x7074737a: return self.size // "ptsz"
        case 0x73696e67: return self.smallReal // "sing"
        case 0x6c777374: return self.standard // "lwst"
        case 0x6c776670: return self.startingPage // "lwfp"
        case 0x54455854: return self.string // "TEXT"
        case 0x7374796c: return self.styledClipboardText // "styl"
        case 0x53545854: return self.styledText // "STXT"
        case 0x73756e20: return self.Sunday // "sun "
        case 0x7370636d: return self.supportsCompiling // "spcm"
        case 0x73707263: return self.supportsRecording // "sprc"
        case 0x74727072: return self.targetPrinter // "trpr"
        case 0x63747874: return self.text // "ctxt"
        case 0x74737479: return self.textStyleInfo // "tsty"
        case 0x74687520: return self.Thursday // "thu "
        case 0x54494646: return self.TIFFPicture // "TIFF"
        case 0x70746974: return self.titled // "ptit"
        case 0x74756520: return self.Tuesday // "tue "
        case 0x74797065: return self.typeClass // "type"
        case 0x75747874: return self.UnicodeText // "utxt"
        case 0x75636f6d: return self.unsignedDoubleInteger // "ucom"
        case 0x6d61676e: return self.unsignedInteger // "magn"
        case 0x75736872: return self.unsignedShortInteger // "ushr"
        case 0x75743136: return self.UTF16Text // "ut16"
        case 0x75746638: return self.UTF8Text // "utf8"
        case 0x76657273: return self.version // "vers"
        case 0x70766973: return self.visible // "pvis"
        case 0x77656420: return self.Wednesday // "wed "
        case 0x77686974: return self.whitespace // "whit"
        case 0x6377696e: return self.window // "cwin"
        case 0x63776f72: return self.word // "cwor"
        case 0x70736374: return self.writingCode // "psct"
        case 0x79657320: return self.yes // "yes "
        case 0x69737a6d: return self.zoomable // "iszm"
        case 0x707a756d: return self.zoomed // "pzum"
        default: return super.symbol(code: code, type: type, descriptor: descriptor) as! SEDSymbol
        }
    }

    // Types/properties
    public static let alias = SEDSymbol(name: "alias", code: 0x616c6973, type: AppleEvents.typeType) // "alis"
    public static let anything = SEDSymbol(name: "anything", code: 0x2a2a2a2a, type: AppleEvents.typeType) // "****"
    public static let application = SEDSymbol(name: "application", code: 0x63617070, type: AppleEvents.typeType) // "capp"
    public static let applicationBundleID = SEDSymbol(name: "applicationBundleID", code: 0x62756e64, type: AppleEvents.typeType) // "bund"
    public static let applicationSignature = SEDSymbol(name: "applicationSignature", code: 0x7369676e, type: AppleEvents.typeType) // "sign"
    public static let applicationURL = SEDSymbol(name: "applicationURL", code: 0x6170726c, type: AppleEvents.typeType) // "aprl"
    public static let April = SEDSymbol(name: "April", code: 0x61707220, type: AppleEvents.typeType) // "apr "
    public static let attachment = SEDSymbol(name: "attachment", code: 0x61747473, type: AppleEvents.typeType) // "atts"
    public static let attributeRun = SEDSymbol(name: "attributeRun", code: 0x63617472, type: AppleEvents.typeType) // "catr"
    public static let August = SEDSymbol(name: "August", code: 0x61756720, type: AppleEvents.typeType) // "aug "
    public static let best = SEDSymbol(name: "best", code: 0x62657374, type: AppleEvents.typeType) // "best"
    public static let bookmarkData = SEDSymbol(name: "bookmarkData", code: 0x626d726b, type: AppleEvents.typeType) // "bmrk"
    public static let boolean = SEDSymbol(name: "boolean", code: 0x626f6f6c, type: AppleEvents.typeType) // "bool"
    public static let boundingRectangle = SEDSymbol(name: "boundingRectangle", code: 0x71647274, type: AppleEvents.typeType) // "qdrt"
    public static let bounds = SEDSymbol(name: "bounds", code: 0x70626e64, type: AppleEvents.typeType) // "pbnd"
    public static let character = SEDSymbol(name: "character", code: 0x63686120, type: AppleEvents.typeType) // "cha "
    public static let characterRange = SEDSymbol(name: "characterRange", code: 0x70726e67, type: AppleEvents.typeType) // "prng"
    public static let class_ = SEDSymbol(name: "class_", code: 0x70636c73, type: AppleEvents.typeType) // "pcls"
    public static let closeable = SEDSymbol(name: "closeable", code: 0x68636c62, type: AppleEvents.typeType) // "hclb"
    public static let collating = SEDSymbol(name: "collating", code: 0x6c77636c, type: AppleEvents.typeType) // "lwcl"
    public static let color = SEDSymbol(name: "color", code: 0x636f6c72, type: AppleEvents.typeType) // "colr"
    public static let colorTable = SEDSymbol(name: "colorTable", code: 0x636c7274, type: AppleEvents.typeType) // "clrt"
    public static let constant = SEDSymbol(name: "constant", code: 0x656e756d, type: AppleEvents.typeType) // "enum"
    public static let contents = SEDSymbol(name: "contents", code: 0x70636e74, type: AppleEvents.typeType) // "pcnt"
    public static let copies = SEDSymbol(name: "copies", code: 0x6c776370, type: AppleEvents.typeType) // "lwcp"
    public static let dashStyle = SEDSymbol(name: "dashStyle", code: 0x74646173, type: AppleEvents.typeType) // "tdas"
    public static let data = SEDSymbol(name: "data", code: 0x74647461, type: AppleEvents.typeType) // "tdta"
    public static let date = SEDSymbol(name: "date", code: 0x6c647420, type: AppleEvents.typeType) // "ldt "
    public static let December = SEDSymbol(name: "December", code: 0x64656320, type: AppleEvents.typeType) // "dec "
    public static let decimalStruct = SEDSymbol(name: "decimalStruct", code: 0x6465636d, type: AppleEvents.typeType) // "decm"
    public static let description_ = SEDSymbol(name: "description_", code: 0x64736372, type: AppleEvents.typeType) // "dscr"
    public static let document = SEDSymbol(name: "document", code: 0x646f6375, type: AppleEvents.typeType) // "docu"
    public static let doubleInteger = SEDSymbol(name: "doubleInteger", code: 0x636f6d70, type: AppleEvents.typeType) // "comp"
    public static let encodedString = SEDSymbol(name: "encodedString", code: 0x656e6373, type: AppleEvents.typeType) // "encs"
    public static let endingPage = SEDSymbol(name: "endingPage", code: 0x6c776c70, type: AppleEvents.typeType) // "lwlp"
    public static let EPSPicture = SEDSymbol(name: "EPSPicture", code: 0x45505320, type: AppleEvents.typeType) // "EPS "
    public static let errorHandling = SEDSymbol(name: "errorHandling", code: 0x6c776568, type: AppleEvents.typeType) // "lweh"
    public static let eventLog = SEDSymbol(name: "eventLog", code: 0x6576746c, type: AppleEvents.typeType) // "evtl"
    public static let faxNumber = SEDSymbol(name: "faxNumber", code: 0x6661786e, type: AppleEvents.typeType) // "faxn"
    public static let February = SEDSymbol(name: "February", code: 0x66656220, type: AppleEvents.typeType) // "feb "
    public static let fileName = SEDSymbol(name: "fileName", code: 0x6174666e, type: AppleEvents.typeType) // "atfn"
    public static let fileRef = SEDSymbol(name: "fileRef", code: 0x66737266, type: AppleEvents.typeType) // "fsrf"
    public static let fileURL = SEDSymbol(name: "fileURL", code: 0x6675726c, type: AppleEvents.typeType) // "furl"
    public static let fixed = SEDSymbol(name: "fixed", code: 0x66697864, type: AppleEvents.typeType) // "fixd"
    public static let fixedPoint = SEDSymbol(name: "fixedPoint", code: 0x66706e74, type: AppleEvents.typeType) // "fpnt"
    public static let fixedRectangle = SEDSymbol(name: "fixedRectangle", code: 0x66726374, type: AppleEvents.typeType) // "frct"
    public static let floating = SEDSymbol(name: "floating", code: 0x6973666c, type: AppleEvents.typeType) // "isfl"
    public static let font = SEDSymbol(name: "font", code: 0x666f6e74, type: AppleEvents.typeType) // "font"
    public static let Friday = SEDSymbol(name: "Friday", code: 0x66726920, type: AppleEvents.typeType) // "fri "
    public static let frontmost = SEDSymbol(name: "frontmost", code: 0x70697366, type: AppleEvents.typeType) // "pisf"
    public static let GIFPicture = SEDSymbol(name: "GIFPicture", code: 0x47494666, type: AppleEvents.typeType) // "GIFf"
    public static let graphicText = SEDSymbol(name: "graphicText", code: 0x63677478, type: AppleEvents.typeType) // "cgtx"
    public static let id = SEDSymbol(name: "id", code: 0x49442020, type: AppleEvents.typeType) // "ID  "
    public static let index = SEDSymbol(name: "index", code: 0x70696478, type: AppleEvents.typeType) // "pidx"
    public static let insertionPoint = SEDSymbol(name: "insertionPoint", code: 0x63696e73, type: AppleEvents.typeType) // "cins"
    public static let integer = SEDSymbol(name: "integer", code: 0x6c6f6e67, type: AppleEvents.typeType) // "long"
    public static let internationalText = SEDSymbol(name: "internationalText", code: 0x69747874, type: AppleEvents.typeType) // "itxt"
    public static let internationalWritingCode = SEDSymbol(name: "internationalWritingCode", code: 0x696e746c, type: AppleEvents.typeType) // "intl"
    public static let item = SEDSymbol(name: "item", code: 0x636f626a, type: AppleEvents.typeType) // "cobj"
    public static let January = SEDSymbol(name: "January", code: 0x6a616e20, type: AppleEvents.typeType) // "jan "
    public static let JPEGPicture = SEDSymbol(name: "JPEGPicture", code: 0x4a504547, type: AppleEvents.typeType) // "JPEG"
    public static let July = SEDSymbol(name: "July", code: 0x6a756c20, type: AppleEvents.typeType) // "jul "
    public static let June = SEDSymbol(name: "June", code: 0x6a756e20, type: AppleEvents.typeType) // "jun "
    public static let kernelProcessID = SEDSymbol(name: "kernelProcessID", code: 0x6b706964, type: AppleEvents.typeType) // "kpid"
    public static let language = SEDSymbol(name: "language", code: 0x6c616e67, type: AppleEvents.typeType) // "lang"
    public static let largeReal = SEDSymbol(name: "largeReal", code: 0x6c64626c, type: AppleEvents.typeType) // "ldbl"
    public static let list = SEDSymbol(name: "list", code: 0x6c697374, type: AppleEvents.typeType) // "list"
    public static let locationReference = SEDSymbol(name: "locationReference", code: 0x696e736c, type: AppleEvents.typeType) // "insl"
    public static let longFixed = SEDSymbol(name: "longFixed", code: 0x6c667864, type: AppleEvents.typeType) // "lfxd"
    public static let longFixedPoint = SEDSymbol(name: "longFixedPoint", code: 0x6c667074, type: AppleEvents.typeType) // "lfpt"
    public static let longFixedRectangle = SEDSymbol(name: "longFixedRectangle", code: 0x6c667263, type: AppleEvents.typeType) // "lfrc"
    public static let longPoint = SEDSymbol(name: "longPoint", code: 0x6c706e74, type: AppleEvents.typeType) // "lpnt"
    public static let longRectangle = SEDSymbol(name: "longRectangle", code: 0x6c726374, type: AppleEvents.typeType) // "lrct"
    public static let machine = SEDSymbol(name: "machine", code: 0x6d616368, type: AppleEvents.typeType) // "mach"
    public static let machineLocation = SEDSymbol(name: "machineLocation", code: 0x6d4c6f63, type: AppleEvents.typeType) // "mLoc"
    public static let machPort = SEDSymbol(name: "machPort", code: 0x706f7274, type: AppleEvents.typeType) // "port"
    public static let March = SEDSymbol(name: "March", code: 0x6d617220, type: AppleEvents.typeType) // "mar "
    public static let May = SEDSymbol(name: "May", code: 0x6d617920, type: AppleEvents.typeType) // "may "
    public static let miniaturizable = SEDSymbol(name: "miniaturizable", code: 0x69736d6e, type: AppleEvents.typeType) // "ismn"
    public static let miniaturized = SEDSymbol(name: "miniaturized", code: 0x706d6e64, type: AppleEvents.typeType) // "pmnd"
    public static let modal = SEDSymbol(name: "modal", code: 0x706d6f64, type: AppleEvents.typeType) // "pmod"
    public static let modified = SEDSymbol(name: "modified", code: 0x696d6f64, type: AppleEvents.typeType) // "imod"
    public static let Monday = SEDSymbol(name: "Monday", code: 0x6d6f6e20, type: AppleEvents.typeType) // "mon "
    public static let name = SEDSymbol(name: "name", code: 0x706e616d, type: AppleEvents.typeType) // "pnam"
    public static let November = SEDSymbol(name: "November", code: 0x6e6f7620, type: AppleEvents.typeType) // "nov "
    public static let null = SEDSymbol(name: "null", code: 0x6e756c6c, type: AppleEvents.typeType) // "null"
    public static let October = SEDSymbol(name: "October", code: 0x6f637420, type: AppleEvents.typeType) // "oct "
    public static let pagesAcross = SEDSymbol(name: "pagesAcross", code: 0x6c776c61, type: AppleEvents.typeType) // "lwla"
    public static let pagesDown = SEDSymbol(name: "pagesDown", code: 0x6c776c64, type: AppleEvents.typeType) // "lwld"
    public static let paragraph = SEDSymbol(name: "paragraph", code: 0x63706172, type: AppleEvents.typeType) // "cpar"
    public static let path = SEDSymbol(name: "path", code: 0x70707468, type: AppleEvents.typeType) // "ppth"
    public static let PICTPicture = SEDSymbol(name: "PICTPicture", code: 0x50494354, type: AppleEvents.typeType) // "PICT"
    public static let pixelMapRecord = SEDSymbol(name: "pixelMapRecord", code: 0x74706d6d, type: AppleEvents.typeType) // "tpmm"
    public static let point = SEDSymbol(name: "point", code: 0x51447074, type: AppleEvents.typeType) // "QDpt"
    public static let printSettings = SEDSymbol(name: "printSettings", code: 0x70736574, type: AppleEvents.typeType) // "pset"
    public static let processSerialNumber = SEDSymbol(name: "processSerialNumber", code: 0x70736e20, type: AppleEvents.typeType) // "psn "
    public static let properties = SEDSymbol(name: "properties", code: 0x70414c4c, type: AppleEvents.typeType) // "pALL"
    public static let property_ = SEDSymbol(name: "property_", code: 0x70726f70, type: AppleEvents.typeType) // "prop"
    public static let real = SEDSymbol(name: "real", code: 0x646f7562, type: AppleEvents.typeType) // "doub"
    public static let record = SEDSymbol(name: "record", code: 0x7265636f, type: AppleEvents.typeType) // "reco"
    public static let reference = SEDSymbol(name: "reference", code: 0x6f626a20, type: AppleEvents.typeType) // "obj "
    public static let requestedPrintTime = SEDSymbol(name: "requestedPrintTime", code: 0x6c777174, type: AppleEvents.typeType) // "lwqt"
    public static let resizable = SEDSymbol(name: "resizable", code: 0x7072737a, type: AppleEvents.typeType) // "prsz"
    public static let RGB16Color = SEDSymbol(name: "RGB16Color", code: 0x74723136, type: AppleEvents.typeType) // "tr16"
    public static let RGB96Color = SEDSymbol(name: "RGB96Color", code: 0x74723936, type: AppleEvents.typeType) // "tr96"
    public static let RGBColor = SEDSymbol(name: "RGBColor", code: 0x63524742, type: AppleEvents.typeType) // "cRGB"
    public static let rotation = SEDSymbol(name: "rotation", code: 0x74726f74, type: AppleEvents.typeType) // "trot"
    public static let Saturday = SEDSymbol(name: "Saturday", code: 0x73617420, type: AppleEvents.typeType) // "sat "
    public static let script = SEDSymbol(name: "script", code: 0x73637074, type: AppleEvents.typeType) // "scpt"
    public static let selection = SEDSymbol(name: "selection", code: 0x73656c65, type: AppleEvents.typeType) // "sele"
    public static let selectionObject = SEDSymbol(name: "selectionObject", code: 0x7473656c, type: AppleEvents.typeType) // "tsel"
    public static let September = SEDSymbol(name: "September", code: 0x73657020, type: AppleEvents.typeType) // "sep "
    public static let shortInteger = SEDSymbol(name: "shortInteger", code: 0x73686f72, type: AppleEvents.typeType) // "shor"
    public static let size = SEDSymbol(name: "size", code: 0x7074737a, type: AppleEvents.typeType) // "ptsz"
    public static let smallReal = SEDSymbol(name: "smallReal", code: 0x73696e67, type: AppleEvents.typeType) // "sing"
    public static let startingPage = SEDSymbol(name: "startingPage", code: 0x6c776670, type: AppleEvents.typeType) // "lwfp"
    public static let string = SEDSymbol(name: "string", code: 0x54455854, type: AppleEvents.typeType) // "TEXT"
    public static let styledClipboardText = SEDSymbol(name: "styledClipboardText", code: 0x7374796c, type: AppleEvents.typeType) // "styl"
    public static let styledText = SEDSymbol(name: "styledText", code: 0x53545854, type: AppleEvents.typeType) // "STXT"
    public static let Sunday = SEDSymbol(name: "Sunday", code: 0x73756e20, type: AppleEvents.typeType) // "sun "
    public static let supportsCompiling = SEDSymbol(name: "supportsCompiling", code: 0x7370636d, type: AppleEvents.typeType) // "spcm"
    public static let supportsRecording = SEDSymbol(name: "supportsRecording", code: 0x73707263, type: AppleEvents.typeType) // "sprc"
    public static let targetPrinter = SEDSymbol(name: "targetPrinter", code: 0x74727072, type: AppleEvents.typeType) // "trpr"
    public static let text = SEDSymbol(name: "text", code: 0x63747874, type: AppleEvents.typeType) // "ctxt"
    public static let textStyleInfo = SEDSymbol(name: "textStyleInfo", code: 0x74737479, type: AppleEvents.typeType) // "tsty"
    public static let Thursday = SEDSymbol(name: "Thursday", code: 0x74687520, type: AppleEvents.typeType) // "thu "
    public static let TIFFPicture = SEDSymbol(name: "TIFFPicture", code: 0x54494646, type: AppleEvents.typeType) // "TIFF"
    public static let titled = SEDSymbol(name: "titled", code: 0x70746974, type: AppleEvents.typeType) // "ptit"
    public static let Tuesday = SEDSymbol(name: "Tuesday", code: 0x74756520, type: AppleEvents.typeType) // "tue "
    public static let typeClass = SEDSymbol(name: "typeClass", code: 0x74797065, type: AppleEvents.typeType) // "type"
    public static let UnicodeText = SEDSymbol(name: "UnicodeText", code: 0x75747874, type: AppleEvents.typeType) // "utxt"
    public static let unsignedDoubleInteger = SEDSymbol(name: "unsignedDoubleInteger", code: 0x75636f6d, type: AppleEvents.typeType) // "ucom"
    public static let unsignedInteger = SEDSymbol(name: "unsignedInteger", code: 0x6d61676e, type: AppleEvents.typeType) // "magn"
    public static let unsignedShortInteger = SEDSymbol(name: "unsignedShortInteger", code: 0x75736872, type: AppleEvents.typeType) // "ushr"
    public static let UTF16Text = SEDSymbol(name: "UTF16Text", code: 0x75743136, type: AppleEvents.typeType) // "ut16"
    public static let UTF8Text = SEDSymbol(name: "UTF8Text", code: 0x75746638, type: AppleEvents.typeType) // "utf8"
    public static let version = SEDSymbol(name: "version", code: 0x76657273, type: AppleEvents.typeType) // "vers"
    public static let visible = SEDSymbol(name: "visible", code: 0x70766973, type: AppleEvents.typeType) // "pvis"
    public static let Wednesday = SEDSymbol(name: "Wednesday", code: 0x77656420, type: AppleEvents.typeType) // "wed "
    public static let window = SEDSymbol(name: "window", code: 0x6377696e, type: AppleEvents.typeType) // "cwin"
    public static let word = SEDSymbol(name: "word", code: 0x63776f72, type: AppleEvents.typeType) // "cwor"
    public static let writingCode = SEDSymbol(name: "writingCode", code: 0x70736374, type: AppleEvents.typeType) // "psct"
    public static let zoomable = SEDSymbol(name: "zoomable", code: 0x69737a6d, type: AppleEvents.typeType) // "iszm"
    public static let zoomed = SEDSymbol(name: "zoomed", code: 0x707a756d, type: AppleEvents.typeType) // "pzum"

    // Enumerators
    public static let ask = SEDSymbol(name: "ask", code: 0x61736b20, type: AppleEvents.typeEnumerated) // "ask "
    public static let case_ = SEDSymbol(name: "case_", code: 0x63617365, type: AppleEvents.typeEnumerated) // "case"
    public static let detailed = SEDSymbol(name: "detailed", code: 0x6c776474, type: AppleEvents.typeEnumerated) // "lwdt"
    public static let diacriticals = SEDSymbol(name: "diacriticals", code: 0x64696163, type: AppleEvents.typeEnumerated) // "diac"
    public static let expansion = SEDSymbol(name: "expansion", code: 0x65787061, type: AppleEvents.typeEnumerated) // "expa"
    public static let hyphens = SEDSymbol(name: "hyphens", code: 0x68797068, type: AppleEvents.typeEnumerated) // "hyph"
    public static let no = SEDSymbol(name: "no", code: 0x6e6f2020, type: AppleEvents.typeEnumerated) // "no  "
    public static let numericStrings = SEDSymbol(name: "numericStrings", code: 0x6e756d65, type: AppleEvents.typeEnumerated) // "nume"
    public static let punctuation = SEDSymbol(name: "punctuation", code: 0x70756e63, type: AppleEvents.typeEnumerated) // "punc"
    public static let standard = SEDSymbol(name: "standard", code: 0x6c777374, type: AppleEvents.typeEnumerated) // "lwst"
    public static let whitespace = SEDSymbol(name: "whitespace", code: 0x77686974, type: AppleEvents.typeEnumerated) // "whit"
    public static let yes = SEDSymbol(name: "yes", code: 0x79657320, type: AppleEvents.typeEnumerated) // "yes "
}

public typealias SED = SEDSymbol // allows symbols to be written as (e.g.) SED.name instead of SEDSymbol.name


/******************************************************************************/
// Specifier extensions; these add command methods and property/elements getters based on Script Editor.app terminology

public protocol SEDCommand: SwiftAutomation.SpecifierProtocol {} // provides AE dispatch methods

// Command->Any will be bound when return type can't be inferred, else Command->T

extension SEDCommand {
    @discardableResult public func activate(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "activate", event: 0x6d697363_61637476, // "miscactv"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func activate<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "activate", event: 0x6d697363_61637476, // "miscactv"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func checkSyntax(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "checkSyntax", event: 0x73656473_63686b73, // "sedschks"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func checkSyntax<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "checkSyntax", event: 0x73656473_63686b73, // "sedschks"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func close(_ directParameter: Any = SwiftAutomation.noParameter,
            saving: Any = SwiftAutomation.noParameter,
            savingIn: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "close", event: 0x636f7265_636c6f73, // "coreclos"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("saving", 0x7361766f, saving), // "savo"
                    ("savingIn", 0x6b66696c, savingIn), // "kfil"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func close<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            saving: Any = SwiftAutomation.noParameter,
            savingIn: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "close", event: 0x636f7265_636c6f73, // "coreclos"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("saving", 0x7361766f, saving), // "savo"
                    ("savingIn", 0x6b66696c, savingIn), // "kfil"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func compile(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "compile", event: 0x73656473_636d706c, // "sedscmpl"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func compile<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "compile", event: 0x73656473_636d706c, // "sedscmpl"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func count(_ directParameter: Any = SwiftAutomation.noParameter,
            each: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "count", event: 0x636f7265_636e7465, // "corecnte"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("each", 0x6b6f636c, each), // "kocl"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func count<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            each: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "count", event: 0x636f7265_636e7465, // "corecnte"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("each", 0x6b6f636c, each), // "kocl"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func delete(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "delete", event: 0x636f7265_64656c6f, // "coredelo"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func delete<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "delete", event: 0x636f7265_64656c6f, // "coredelo"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func duplicate(_ directParameter: Any = SwiftAutomation.noParameter,
            to: Any = SwiftAutomation.noParameter,
            withProperties: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "duplicate", event: 0x636f7265_636c6f6e, // "coreclon"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("to", 0x696e7368, to), // "insh"
                    ("withProperties", 0x70726474, withProperties), // "prdt"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func duplicate<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            to: Any = SwiftAutomation.noParameter,
            withProperties: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "duplicate", event: 0x636f7265_636c6f6e, // "coreclon"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("to", 0x696e7368, to), // "insh"
                    ("withProperties", 0x70726474, withProperties), // "prdt"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func exists(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "exists", event: 0x636f7265_646f6578, // "coredoex"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func exists<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "exists", event: 0x636f7265_646f6578, // "coredoex"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func get(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "get", event: 0x636f7265_67657464, // "coregetd"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func get<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "get", event: 0x636f7265_67657464, // "coregetd"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func make(_ directParameter: Any = SwiftAutomation.noParameter,
            new: Any = SwiftAutomation.noParameter,
            at: Any = SwiftAutomation.noParameter,
            withData: Any = SwiftAutomation.noParameter,
            withProperties: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "make", event: 0x636f7265_6372656c, // "corecrel"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("new", 0x6b6f636c, new), // "kocl"
                    ("at", 0x696e7368, at), // "insh"
                    ("withData", 0x64617461, withData), // "data"
                    ("withProperties", 0x70726474, withProperties), // "prdt"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func make<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            new: Any = SwiftAutomation.noParameter,
            at: Any = SwiftAutomation.noParameter,
            withData: Any = SwiftAutomation.noParameter,
            withProperties: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "make", event: 0x636f7265_6372656c, // "corecrel"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("new", 0x6b6f636c, new), // "kocl"
                    ("at", 0x696e7368, at), // "insh"
                    ("withData", 0x64617461, withData), // "data"
                    ("withProperties", 0x70726474, withProperties), // "prdt"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func move(_ directParameter: Any = SwiftAutomation.noParameter,
            to: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "move", event: 0x636f7265_6d6f7665, // "coremove"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("to", 0x696e7368, to), // "insh"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func move<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            to: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "move", event: 0x636f7265_6d6f7665, // "coremove"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("to", 0x696e7368, to), // "insh"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func open(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "open", event: 0x61657674_6f646f63, // "aevtodoc"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func open<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "open", event: 0x61657674_6f646f63, // "aevtodoc"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func openLocation(_ directParameter: Any = SwiftAutomation.noParameter,
            window: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "openLocation", event: 0x4755524c_4755524c, // "GURLGURL"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("window", 0x57494e44, window), // "WIND"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func openLocation<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            window: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "openLocation", event: 0x4755524c_4755524c, // "GURLGURL"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("window", 0x57494e44, window), // "WIND"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func print(_ directParameter: Any = SwiftAutomation.noParameter,
            printDialog: Any = SwiftAutomation.noParameter,
            withProperties: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "print", event: 0x61657674_70646f63, // "aevtpdoc"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("printDialog", 0x70646c67, printDialog), // "pdlg"
                    ("withProperties", 0x70726474, withProperties), // "prdt"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func print<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            printDialog: Any = SwiftAutomation.noParameter,
            withProperties: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "print", event: 0x61657674_70646f63, // "aevtpdoc"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("printDialog", 0x70646c67, printDialog), // "pdlg"
                    ("withProperties", 0x70726474, withProperties), // "prdt"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func quit(_ directParameter: Any = SwiftAutomation.noParameter,
            saving: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "quit", event: 0x61657674_71756974, // "aevtquit"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("saving", 0x7361766f, saving), // "savo"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func quit<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            saving: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "quit", event: 0x61657674_71756974, // "aevtquit"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("saving", 0x7361766f, saving), // "savo"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func reopen(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "reopen", event: 0x61657674_72617070, // "aevtrapp"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func reopen<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "reopen", event: 0x61657674_72617070, // "aevtrapp"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func run(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "run", event: 0x61657674_6f617070, // "aevtoapp"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func run<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "run", event: 0x61657674_6f617070, // "aevtoapp"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func save(_ directParameter: Any = SwiftAutomation.noParameter,
            as_: Any = SwiftAutomation.noParameter,
            in_: Any = SwiftAutomation.noParameter,
            runOnly: Any = SwiftAutomation.noParameter,
            startupScreen: Any = SwiftAutomation.noParameter,
            stayOpen: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "save", event: 0x636f7265_73617665, // "coresave"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("as_", 0x666c7470, as_), // "fltp"
                    ("in_", 0x6b66696c, in_), // "kfil"
                    ("runOnly", 0x726e6c79, runOnly), // "rnly"
                    ("startupScreen", 0x7373636e, startupScreen), // "sscn"
                    ("stayOpen", 0x736f706e, stayOpen), // "sopn"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func save<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            as_: Any = SwiftAutomation.noParameter,
            in_: Any = SwiftAutomation.noParameter,
            runOnly: Any = SwiftAutomation.noParameter,
            startupScreen: Any = SwiftAutomation.noParameter,
            stayOpen: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "save", event: 0x636f7265_73617665, // "coresave"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("as_", 0x666c7470, as_), // "fltp"
                    ("in_", 0x6b66696c, in_), // "kfil"
                    ("runOnly", 0x726e6c79, runOnly), // "rnly"
                    ("startupScreen", 0x7373636e, startupScreen), // "sscn"
                    ("stayOpen", 0x736f706e, stayOpen), // "sopn"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func set(_ directParameter: Any = SwiftAutomation.noParameter,
            to: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "set", event: 0x636f7265_73657464, // "coresetd"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("to", 0x64617461, to), // "data"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func set<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            to: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "set", event: 0x636f7265_73657464, // "coresetd"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("to", 0x64617461, to), // "data"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
}


public protocol SEDObject: SwiftAutomation.ObjectSpecifierExtension, SEDCommand {} // provides vars and methods for constructing specifiers

extension SEDObject {

    // Properties
    public var bounds: SEDItem {return self.property(0x70626e64) as! SEDItem} // "pbnd"
    public var characterRange: SEDItem {return self.property(0x70726e67) as! SEDItem} // "prng"
    public var class_: SEDItem {return self.property(0x70636c73) as! SEDItem} // "pcls"
    public var closeable: SEDItem {return self.property(0x68636c62) as! SEDItem} // "hclb"
    public var collating: SEDItem {return self.property(0x6c77636c) as! SEDItem} // "lwcl"
    public var color: SEDItem {return self.property(0x636f6c72) as! SEDItem} // "colr"
    public var contents: SEDItem {return self.property(0x70636e74) as! SEDItem} // "pcnt"
    public var copies: SEDItem {return self.property(0x6c776370) as! SEDItem} // "lwcp"
    public var description_: SEDItem {return self.property(0x64736372) as! SEDItem} // "dscr"
    public var document: SEDItem {return self.property(0x646f6375) as! SEDItem} // "docu"
    public var endingPage: SEDItem {return self.property(0x6c776c70) as! SEDItem} // "lwlp"
    public var errorHandling: SEDItem {return self.property(0x6c776568) as! SEDItem} // "lweh"
    public var eventLog: SEDItem {return self.property(0x6576746c) as! SEDItem} // "evtl"
    public var faxNumber: SEDItem {return self.property(0x6661786e) as! SEDItem} // "faxn"
    public var fileName: SEDItem {return self.property(0x6174666e) as! SEDItem} // "atfn"
    public var floating: SEDItem {return self.property(0x6973666c) as! SEDItem} // "isfl"
    public var font: SEDItem {return self.property(0x666f6e74) as! SEDItem} // "font"
    public var frontmost: SEDItem {return self.property(0x70697366) as! SEDItem} // "pisf"
    public var id: SEDItem {return self.property(0x49442020) as! SEDItem} // "ID  "
    public var index: SEDItem {return self.property(0x70696478) as! SEDItem} // "pidx"
    public var language: SEDItem {return self.property(0x6c616e67) as! SEDItem} // "lang"
    public var miniaturizable: SEDItem {return self.property(0x69736d6e) as! SEDItem} // "ismn"
    public var miniaturized: SEDItem {return self.property(0x706d6e64) as! SEDItem} // "pmnd"
    public var modal: SEDItem {return self.property(0x706d6f64) as! SEDItem} // "pmod"
    public var modified: SEDItem {return self.property(0x696d6f64) as! SEDItem} // "imod"
    public var name: SEDItem {return self.property(0x706e616d) as! SEDItem} // "pnam"
    public var pagesAcross: SEDItem {return self.property(0x6c776c61) as! SEDItem} // "lwla"
    public var pagesDown: SEDItem {return self.property(0x6c776c64) as! SEDItem} // "lwld"
    public var path: SEDItem {return self.property(0x70707468) as! SEDItem} // "ppth"
    public var properties: SEDItem {return self.property(0x70414c4c) as! SEDItem} // "pALL"
    public var requestedPrintTime: SEDItem {return self.property(0x6c777174) as! SEDItem} // "lwqt"
    public var resizable: SEDItem {return self.property(0x7072737a) as! SEDItem} // "prsz"
    public var selection: SEDItem {return self.property(0x73656c65) as! SEDItem} // "sele"
    public var size: SEDItem {return self.property(0x7074737a) as! SEDItem} // "ptsz"
    public var startingPage: SEDItem {return self.property(0x6c776670) as! SEDItem} // "lwfp"
    public var supportsCompiling: SEDItem {return self.property(0x7370636d) as! SEDItem} // "spcm"
    public var supportsRecording: SEDItem {return self.property(0x73707263) as! SEDItem} // "sprc"
    public var targetPrinter: SEDItem {return self.property(0x74727072) as! SEDItem} // "trpr"
    public var titled: SEDItem {return self.property(0x70746974) as! SEDItem} // "ptit"
    public var version: SEDItem {return self.property(0x76657273) as! SEDItem} // "vers"
    public var visible: SEDItem {return self.property(0x70766973) as! SEDItem} // "pvis"
    public var zoomable: SEDItem {return self.property(0x69737a6d) as! SEDItem} // "iszm"
    public var zoomed: SEDItem {return self.property(0x707a756d) as! SEDItem} // "pzum"

    // Elements
    public var applications: SEDItems {return self.elements(0x63617070) as! SEDItems} // "capp"
    public var attachments: SEDItems {return self.elements(0x61747473) as! SEDItems} // "atts"
    public var attributeRuns: SEDItems {return self.elements(0x63617472) as! SEDItems} // "catr"
    public var characters: SEDItems {return self.elements(0x63686120) as! SEDItems} // "cha "
    public var colors: SEDItems {return self.elements(0x636f6c72) as! SEDItems} // "colr"
    public var documents: SEDItems {return self.elements(0x646f6375) as! SEDItems} // "docu"
    public var insertionPoints: SEDItems {return self.elements(0x63696e73) as! SEDItems} // "cins"
    public var items: SEDItems {return self.elements(0x636f626a) as! SEDItems} // "cobj"
    public var languages: SEDItems {return self.elements(0x6c616e67) as! SEDItems} // "lang"
    public var paragraphs: SEDItems {return self.elements(0x63706172) as! SEDItems} // "cpar"
    public var printSettings: SEDItems {return self.elements(0x70736574) as! SEDItems} // "pset"
    public var selectionObjects: SEDItems {return self.elements(0x7473656c) as! SEDItems} // "tsel"
    public var text: SEDItems {return self.elements(0x63747874) as! SEDItems} // "ctxt"
    public var windows: SEDItems {return self.elements(0x6377696e) as! SEDItems} // "cwin"
    public var words: SEDItems {return self.elements(0x63776f72) as! SEDItems} // "cwor"
}


/******************************************************************************/
// Specifier subclasses add app-specific extensions

// beginning/end/before/after
public class SEDInsertion: SwiftAutomation.InsertionSpecifier, SEDCommand {}


// property/by-index/by-name/by-id/previous/next/first/middle/last/any
public class SEDItem: SwiftAutomation.ObjectSpecifier, SEDObject {
    public typealias InsertionSpecifierType = SEDInsertion
    public typealias ObjectSpecifierType = SEDItem
    public typealias MultipleObjectSpecifierType = SEDItems
}

// by-range/by-test/all
public class SEDItems: SEDItem, SwiftAutomation.MultipleObjectSpecifierExtension {}

// App/Con/Its
public class SEDRoot: SwiftAutomation.RootSpecifier, SEDObject, SwiftAutomation.RootSpecifierExtension {
    public typealias InsertionSpecifierType = SEDInsertion
    public typealias ObjectSpecifierType = SEDItem
    public typealias MultipleObjectSpecifierType = SEDItems
    public override class var untargetedAppData: SwiftAutomation.AppData { return _untargetedAppData }
}

// Application
public class ScriptEditor: SEDRoot, SwiftAutomation.Application {
    public convenience init(launchOptions: SwiftAutomation.LaunchOptions = SwiftAutomation.defaultLaunchOptions, relaunchMode: SwiftAutomation.RelaunchMode = SwiftAutomation.defaultRelaunchMode) {
        self.init(rootObject: SwiftAutomation.appRootDesc, appData: Swift.type(of:self).untargetedAppData.targetedCopy(
                  .bundleIdentifier("com.apple.ScriptEditor2", true), launchOptions: launchOptions, relaunchMode: relaunchMode))
    }
}

// App/Con/Its root objects used to construct untargeted specifiers; these can be used to construct specifiers for use in commands, though cannot send commands themselves

public let SEDApp = _untargetedAppData.app as! SEDRoot
public let SEDCon = _untargetedAppData.con as! SEDRoot
public let SEDIts = _untargetedAppData.its as! SEDRoot


/******************************************************************************/
// Static types

public typealias SEDRecord = [SEDSymbol:Any] // default Swift type for AERecordDescs






