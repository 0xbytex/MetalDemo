//
//  ViewController.swift
//  MetalDemo
//
//  Created by Никита Владимирович on 07.11.2021.
//

import UIKit
import MetalKit

class ViewController: UIViewController {

    @IBOutlet weak var contentView: MTKView!
    
    var renderer: Renderer!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpMetal(withView: contentView)
    }
    
    func setUpMetal(withView view: MTKView) {
        guard let defaultDevice = MTLCreateSystemDefaultDevice() else {
            print("Metal is not supported on this device.")
            return
        }
        print("Device choosed by Metal API: \(defaultDevice)")
        view.device = defaultDevice
        
        guard let safeRenderer = Renderer(mtkView: contentView) else {
            print("Renderer failed to initialize.")
            return
        }
        renderer = safeRenderer
        contentView.delegate = renderer
        
//        view.clearColor = MTLClearColor(red: 0.0, green: 0.5, blue: 1.0, alpha: 1.0)
//        view.enableSetNeedsDisplay = true
//        view.delegate = renderer
//
//        guard let renderPassDescriptor = view.currentRenderPassDescriptor else {
//            return
//        }
    }

}
