//
//  ViewController.swift
//  FrameExtraction
//
//  Created by Parker Lusk on 3/31/18.
//  Copyright © 2018 Wanderlusk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FrameExtractorDelegate {
    
    var frameExtractor: FrameExtractor!
    var fpsCounter = FPSCounter()
    
    let ocv = OpenCVWrapper()

    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        frameExtractor = FrameExtractor()
        frameExtractor.delegate = self
        fpsCounter.start()
        
        print(ocv.openCVVersionString())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var oneImage = UIImage()
    var count = 0

    @IBAction func capture(_ sender: Any) {
        if let image = imageView.image {
            oneImage = image
        }
        dataCenter.imageData.append(oneImage)
        print(dataCenter.imageData)
        count += 1
        if count == 5 {
            dataCenter.captureSessionState = false
        }
    }

    // 여기 안에서 변수 대입 등 복잡한 작업하면 메모리가 터진다.
    func captured(image: UIImage) {
        imageView.image = ocv.makeGray(image)
        
        // Show FPS counter
        fpsCounter.frameCompleted()
        // print(fpsCounter.fps)
        
//        self.timeLabel.text = String(format: "%.1f FPS (latency: %.5f sec)", self.fpsCounter.fps, result.latency)
    }


}

