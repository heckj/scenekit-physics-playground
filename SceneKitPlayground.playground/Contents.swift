//: A SceneKit Playground

import PlaygroundSupport
//import SpriteKit
import SceneKit

// Load the SKScene from 'GameScene.sks'
let scene = SCNScene()

let sceneView = SCNView(frame: CGRect(x:0 , y:0, width: 320, height: 240))
sceneView.allowsCameraControl = true
sceneView.autoenablesDefaultLighting = true
sceneView.scene = scene
sceneView.showsStatistics = true

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
PlaygroundSupport.PlaygroundPage.current.needsIndefiniteExecution = true

var floor = SCNFloor()
floor.reflectivity = 0.4
floor.length = 100
floor.width = 100
let floorNode = SCNNode(geometry: floor)
let floorPhysicsBody = SCNPhysicsBody(type: .static, shape: SCNPhysicsShape(node: floorNode, options: nil))
floorNode.physicsBody = floorPhysicsBody
scene.rootNode.addChildNode(floorNode)


let hello = SCNText(string: "Hello World", extrusionDepth: 5.5)
hello.font = NSFont(name: "Georgia", size: 14)
hello.chamferRadius = 0.9
hello.flatness = 0.1
let helloNode = SCNNode(geometry: hello)
scene.rootNode.addChildNode(helloNode)

let textPhysicsBody = SCNPhysicsBody(type: .dynamic, shape: SCNPhysicsShape(node: helloNode, options: nil))
textPhysicsBody.mass = 3
textPhysicsBody.friction = 2
helloNode.physicsBody = textPhysicsBody
helloNode.position = SCNVector3(x: 0, y:12, z: 0)
helloNode.physicsBody?.applyForce(SCNVector3(x: 0, y: 50, z:0), asImpulse: true)




