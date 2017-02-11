//
//  UIView+ImageRendering.swift
//  FoldingAnimation
//
//  Created by Javi on 9/10/15.
//  Copyright © 2015 FuzeIdea. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    func flipImageVertically() -> UIImage {
        let image:UIImage = UIImage(cgImage: self.cgImage!, scale: 1.0, orientation: UIImageOrientation.downMirrored)
        return image
    }
    
    func cropUsingRect(_ rect:CGRect) -> UIImage {
    
        let fixedImage = fixOrientation()
        let fixedRect = CGRect(x: rect.origin.x * self.scale, y: rect.origin.y * self.scale, width: rect.width * self.scale, height: rect.height * self.scale)
        
        let cropedImage:CGImage = (fixedImage.cgImage)!.cropping(to: fixedRect)!;
        
        let resultingImage = UIImage(cgImage: cropedImage)

        return resultingImage
        
    }

    func resizeImage(newWidth: CGFloat) -> UIImage {
        
        let scale = newWidth / self.size.width
        let newHeight = self.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        self.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    
    func resizeImageToSize(_ size:CGSize) -> UIImage {
        let hasAlpha = false
        let scale: CGFloat = 0.0 // Automatically use scale factor of main screen
        
        UIGraphicsBeginImageContextWithOptions(size, !hasAlpha, scale)
        self.draw(in: CGRect(origin: CGPoint.zero, size: size))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return scaledImage!
    }
    
    func fixOrientation() -> UIImage {
        
        if self.imageOrientation == UIImageOrientation.up {
            return self
        }
        
        var transform = CGAffineTransform.identity
        
        switch self.imageOrientation {
        case .down, .downMirrored:
            transform = transform.translatedBy(x: self.size.width, y: self.size.height)
            transform = transform.rotated(by: CGFloat(M_PI));
            
        case .left, .leftMirrored:
            transform = transform.translatedBy(x: self.size.width, y: 0);
            transform = transform.rotated(by: CGFloat(M_PI_2));
            
        case .right, .rightMirrored:
            transform = transform.translatedBy(x: 0, y: self.size.height);
            transform = transform.rotated(by: CGFloat(-M_PI_2));
            
        case .up, .upMirrored:
            break
        }
        
        
        switch self.imageOrientation {
            
        case .upMirrored, .downMirrored:
            transform = transform.translatedBy(x: self.size.width, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
            
        case .leftMirrored, .rightMirrored:
            transform = transform.translatedBy(x: self.size.height, y: 0)
            transform = transform.scaledBy(x: -1, y: 1);
            
        default:
            break;
        }
        
        
        
        // Now we draw the underlying CGImage into a new context, applying the transform
        // calculated above.
        let ctx = CGContext(
            data: nil,
            width: Int(self.size.width),
            height: Int(self.size.height),
            bitsPerComponent: ((self.cgImage)?.bitsPerComponent)!,
            bytesPerRow: 0,
            space: ((self.cgImage)?.colorSpace!)!,
            bitmapInfo: UInt32(((self.cgImage)?.bitmapInfo.rawValue)!)
        )
        
        ctx?.concatenate(transform);
        
        switch self.imageOrientation {
            
        case .left, .leftMirrored, .right, .rightMirrored:
            // Grr...
            ctx?.draw(self.cgImage!, in: CGRect(x: 0, y: 0, width: self.size.height,height: self.size.width));
            
        default:
            ctx?.draw(self.cgImage!, in: CGRect(x: 0, y: 0, width: self.size.width,height: self.size.height));
            break;
        }
        
        // And now we just create a new UIImage from the drawing context
        let cgimg = ctx?.makeImage()
        
        let img = UIImage(cgImage: cgimg!)
        
        //CGContextRelease(ctx);
        //CGImageRelease(cgimg);
        
        return img;
        
    }
}


extension UIView {
    
    func renderImageFromView() -> UIImage {

        UIGraphicsBeginImageContext(self.frame.size)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
    
    func renderImageFromViewWithCropRect(_ rect:CGRect) -> UIImage {
        let currentImage = self.renderImageFromView()
        let cropedImage:CGImage =
        (currentImage.cgImage)!.cropping(to: rect)!;
        
        return UIImage(cgImage: cropedImage)
    }
    

    func setAnchorPoint(_ anchorPoint: CGPoint) {
        var newPoint = CGPoint(x: self.bounds.size.width * anchorPoint.x, y: self.bounds.size.height * anchorPoint.y)
        var oldPoint = CGPoint(x: self.bounds.size.width * self.layer.anchorPoint.x, y: self.bounds.size.height * self.layer.anchorPoint.y)
        
        newPoint = newPoint.applying(self.transform)
        oldPoint = oldPoint.applying(self.transform)
        
        var position : CGPoint = self.layer.position
        
        position.x -= oldPoint.x
        position.x += newPoint.x;
        
        position.y -= oldPoint.y;
        position.y += newPoint.y;
        
        self.layer.position = position;
        self.layer.anchorPoint = anchorPoint;
    }
    
    enum AnchorPointBorders {
        case bottomBorder
        case leftBorder
        case rightBorder
        case topBorder
    }
    
    func setAnchorPoint(_ selectedBorder: AnchorPointBorders) {
        switch selectedBorder {
        case .bottomBorder:
            self.setAnchorPoint(CGPoint(x: 0.5, y: 1))
//            self.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
//            self.layer.position = CGPoint(x: self.frame.origin.x+self.frame.size.width/2, y: self.layer.position.y+self.frame.size.height/2)
            break
        case .leftBorder:
            print("code not implemented!!!")
            abort()
            break
        case .rightBorder:
            print("code not implemented!!!")
            abort()
            break
        case .topBorder:
            self.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
            self.layer.position = CGPoint(x: self.frame.origin.x+self.frame.size.width/2, y: self.layer.position.y)
            break
        }
    }
    
}
