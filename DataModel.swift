//
//  ARView.swift
//  ARTEST02
//
//  Created by Natchanon Thepyasuwan on 16/12/2562 BE.
//  Copyright © 2562 Natchanon Thepyasuwan. All rights reserved.
//

import Combine
import RealityKit
import SpriteKit
import ARKit

final class Datamodel: ObservableObject {
    static var shared = Datamodel()
    
    @Published var arView: ARView!
    //@Published var skView: SKView!
    @Published var enableAR = false
    @Published var loadScene = 0
    @Published var buttonPressed = 0
    @Published var check = 0
    init() {
        
        arView = ARView(frame: .zero)
        //skView = SKView(frame: .zero)
        enum location {
            case maesue
        }
        
        let currentLocation = location.maesue
        
        switch currentLocation {
        case .maesue:
            Experience.loadBaffaloSceneAsync { result in
                switch result {
                case .success(let anchor):
                    self.arView.scene.anchors.append(anchor)
                    self.loadScene += 1
                    print(" loadScene : " + String(self.loadScene))
                    anchor.actions.isBaffaloDone.onAction = { BaffaloModel in
                        self.buttonPressed += 1
                        print(" button : " + String(self.buttonPressed))
                        if self.buttonPressed == self.loadScene {
                            self.check = 1
                            print(" Complete !!!!!")
                        }
                        else { print(" Not Complete Yet ****") }
                    }
                case .failure(let error):
                    print("Baffalo fail load:\(error.localizedDescription)")
                }
            }
            Experience.loadCowSceneAsync { result in
                switch result {
                case .success(let anchor):
                    self.arView.scene.anchors.append(anchor)
                    self.loadScene += 1
                    print(" loadScene : " + String(self.loadScene))
                    anchor.actions.isCowDone.onAction = { CowModel in
                        self.buttonPressed += 1
                        print(" button : " + String(self.buttonPressed))
                        if self.buttonPressed == self.loadScene {
                            self.check = 1
                            print(" Complete !!!!!")
                        }
                        else { print(" Not Complete Yet ****") }
                    }
                case .failure(let error):
                    print(" Cow fail load:\(error.localizedDescription)")
                }
            }
            Experience.loadElephantSceneAsync { result in
                switch result {
                case .success(let anchor):
                    self.arView.scene.anchors.append(anchor)
                    self.loadScene += 1
                    print(" loadScene : " + String(self.loadScene))
                    anchor.actions.isElephantDone.onAction = { ElephantModel in
                        self.buttonPressed += 1
                        print(" button : " + String(self.buttonPressed))
                        if self.buttonPressed == self.loadScene {
                            self.check = 1
                            print(" Complete !!!!!")
                        }
                        else { print(" Not Complete Yet ****") }
                    }
                case .failure(let error):
                    print(" Cow fail load:\(error.localizedDescription)")
                }
            }
            Experience.loadSoundMaesueSceneAsync { result in
                switch result {
                case .success(let anchor):
                    self.arView.scene.anchors.append(anchor)
                    self.loadScene += 2
                    print(" loadScene : " + String(self.loadScene))
                    anchor.actions.isMaeSueSound1Done.onAction = { MaeSueSound1 in
                        self.buttonPressed += 1
                        print(" button : " + String(self.buttonPressed))
                        if self.buttonPressed == self.loadScene {
                            self.check = 1
                            print(" Complete !!!!!")
                        }
                        else { print(" Not Complete Yet ****") }
                    }
                    anchor.actions.isMaeSueSound2Done.onAction = { MaeSueSound2 in
                        self.buttonPressed += 1
                        print(" button : " + String(self.buttonPressed))
                        if self.buttonPressed == self.loadScene {
                            self.check = 1
                            print(" Complete !!!!!")
                        }
                        else { print(" Not Complete Yet ****") }
                    }
                case .failure(let error):
                    print(" Cow fail load:\(error.localizedDescription)")
                }
            }
            Experience.loadRecliningBuddhaSoundSceneAsync { result in
                switch result {
                case .success(let anchor):
                    self.arView.scene.anchors.append(anchor)
                    self.loadScene += 1
                    print(" loadScene : " + String(self.loadScene))
                    anchor.actions.isBuddhaDone.onAction = { BuddhaSound in
                        self.buttonPressed += 1
                        print(" button : " + String(self.buttonPressed))
                        if self.buttonPressed == self.loadScene {
                            self.check = 1
                            print(" Complete !!!!!")
                        }
                        else { print(" Not Complete Yet ****") }
                    }
                case .failure(let error):
                    print(" Cow fail load:\(error.localizedDescription)")
                }
            }
            Experience.loadThreeKingdomSceneAsync { result in
                switch result {
                case .success(let anchor):
                    self.arView.scene.anchors.append(anchor)
                    self.loadScene += 1
                    print(" loadScene : " + String(self.loadScene))
                    anchor.actions.is3KingDone.onAction = { ThreeKingdomScene in
                        self.buttonPressed += 1
                        print(" button : " + String(self.buttonPressed))
                        if self.buttonPressed == self.loadScene {
                            self.check = 1
                            print(" Complete !!!!!")
                        }
                        else { print(" Not Complete Yet ****") }
                    }
                case .failure(let error):
                    print(" Cow fail load:\(error.localizedDescription)")
                }
            }
        }
    }
    
}
