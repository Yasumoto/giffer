//
//  main.swift
//  giffer
//
//  Created by Joseph Smith on 12/22/14.
//  Copyright (c) 2014 Joseph Smith. All rights reserved.
//

import AppKit
import CoreGraphics
import Foundation
import ImageIO

let frameDelay = NSNumber(float: 0.15)

var imageNames = [
    "/Users/jsmith/Desktop/FunGoRound/IMG_1781.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1783.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1784.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1785.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1786.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1787.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1788.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1789.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1790.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1791.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1792.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1793.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1794.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1795.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1796.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1797.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1798.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1799.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1800.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1801.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1802.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1803.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1804.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1805.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1806.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1807.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1808.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1809.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1810.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1811.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1812.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1813.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1814.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1815.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1816.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1817.JPG",
    "/Users/jsmith/Desktop/FunGoRound/IMG_1824.JPG",
]
    
var images = [CGImage]()

for name in imageNames {
    let image = NSImage(byReferencingFile: name)
    if (image != nil) {
        let source = CGImageSourceCreateWithData(image!.TIFFRepresentation, nil)
        let maskRef = CGImageSourceCreateImageAtIndex(source, UInt(0), nil)
        images.append(maskRef)
    }
}

// Setup the destination
let destinationPath = NSURL(fileURLWithPath: "/Users/jsmith/Desktop/FunGoRound.gif")
let destination : CGImageDestination = CGImageDestinationCreateWithURL(destinationPath, kUTTypeGIF, UInt(images.count), Dictionary<String, String>())


// set frame delay
let frameProperties : [String : [String: NSNumber] ] = [ kCGImagePropertyGIFDictionary: [ kCGImagePropertyGIFDelayTime : frameDelay] ]

// set gif color properties
let gifProperties : [String :[String : AnyObject]] = [kCGImagePropertyGIFDictionary : [ kCGImagePropertyColorModel : kCGImagePropertyColorModelRGB, kCGImagePropertyGIFHasGlobalColorMap : true ]]

for image in images {
    CGImageDestinationAddImage(destination, image, frameProperties);
}

// save the GIF
CGImageDestinationSetProperties(destination, gifProperties);
CGImageDestinationFinalize(destination);