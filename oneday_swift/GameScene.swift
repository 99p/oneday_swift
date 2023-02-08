import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // SKSpriteNodeをインスタンス化
    var myShip = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        var sizeRate: CGFloat = 0.0
        var myShipSize = CGSize(width: 0.0, height: 0.0)
        let offsetY = frame.height / 20
        
        self.myShip = SKSpriteNode(imageNamed: "myShip")
        sizeRate = (frame.width / 5) / self.myShip.size.width
        myShipSize = CGSize(width: self.myShip.size.width * sizeRate,
                            height: self.myShip.size.height * sizeRate)
        self.myShip.scale(to: myShipSize)
        self.myShip.position =
            CGPoint(x: 0, y: (-frame.height / 2) + offsetY + myShipSize.height / 2)
        addChild(self.myShip)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
            
}
