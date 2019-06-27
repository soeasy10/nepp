//
//  ViewController.swift
//  FrameExtraction
//
//  Created by Parker Lusk on 3/31/18.
//  Copyright © 2018 Wanderlusk. All rights reserved.
//

import UIKit
import Firebase

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

    // Timer
    var mTimer : Timer?
    var sec : Int = 0

    @IBAction func capture(_ sender: Any) {
        if let timer = mTimer {
            //timer 객체가 nil 이 아닌경우에는 invalid 상태에만 시작한다
            if !timer.isValid {
                /** 1초마다 timerCallback함수를 호출하는 타이머 */
                mTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
            }
        }else{
            //timer 객체가 nil 인 경우에 객체를 생성하고 타이머를 시작한다
            /** 1초마다 timerCallback함수를 호출하는 타이머 */
            mTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
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

    var storageRef:StorageReference?

    func uiImageToPNG(_ image:UIImage, _ user:String, _ index:String) { // 나중에 인자로 유저 아이디 받기
        guard let png = UIImagePNGRepresentation(image) else { // NSData
            return
        }

        storageRef = Storage.storage().reference()

        let uploadTask = storageRef!.child(user + "/userImage" + index + ".png").putData(png, metadata: nil) { (metadata, error) in
            guard let metadata = metadata else {
                // Uh-oh, an error occurred!
                return
            }
            // Metadata contains file metadata such as size, content-type.
            let size = metadata.size
            // You can also access to download URL after upload.
            self.storageRef!.child(user + "/userImage" + index + ".png").downloadURL { (url, error) in
                guard let downloadURL = url else {
                    // Uh-oh, an error occurred!
                    return
                }
            }
        }
    }

    @objc func timerCallback(){
        if sec > 9 { // 10초 동안 20 프레임을 가져온다.
            if let timer = mTimer {
                if(timer.isValid){
                    timer.invalidate()
                    dataCenter.captureSessionState = false
                    // 다음 뷰로 이동하는 작업

                    // Firebase Storage에 업로드하는 작업
                    for i in 0...9 {
                        uiImageToPNG(dataCenter.imageData[i], "Changsung", String(i))
                    }
                }
            }
        }

        if let image = imageView.image {
            oneImage = image
        }
        dataCenter.imageData.append(oneImage)
        print(dataCenter.imageData)

        sec += 1
    }
}

