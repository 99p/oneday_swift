import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // SKSpriteNodeをインスタンス化
    var myShip = SKSpriteNode()
    
    var enemyRate: CGFloat = 0.0
    var enemySize = CGSize(width: 0.0, height: 0.0)
    var timer: Timer?
    
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
        
        let tempEnemy = SKSpriteNode(imageNamed: "enemy1")
        enemyRate = (frame.width / 10) / tempEnemy.size.width
        enemySize = CGSize(width: tempEnemy.size.width * enemyRate,
                           height: tempEnemy.size.height * enemyRate)
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in self.moveEnemy()})
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    func moveEnemy() {
        let enemyNames = [ "enemy1", "enemy2", "enemy3"]
        let idx = Int.random(in: 0 ..< 3)
        let selectedEnemy = enemyNames[idx]
        let enemy = SKSpriteNode(imageNamed: selectedEnemy)
        
        enemy.scale(to: enemySize)
        let xPos = (frame.width / CGFloat.random(in: 1...5)) - frame.width / 2
        enemy.position = CGPoint(x: xPos, y: frame.height / 2)
        addChild(enemy)
        
        let move = SKAction.moveTo(y: -frame.height / 2, duration: 2.0)
        let remove = SKAction.removeFromParent()
        enemy.run(SKAction.sequence([move, remove]))
    }
            
}
