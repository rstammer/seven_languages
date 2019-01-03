class Player(val name: String, val marker: Char)

class Board(val player1: Player, val player2: Player) {
  private val N = "·" // Blank value to initialize board with

  var fields = Array.tabulate(3,3)( (x,y) => N )

  // Somewhat clunky way to flip the coin on who's gonna start the game?
  private var _playerAtTurn = List[Player](player1, player2)(scala.util.Random.nextInt(2))

  def playerAtTurn = println("It's " + _playerAtTurn.name + "(" + _playerAtTurn.marker + ")'s turn.")

  def printField(): Unit = {
    for(i <- 0 until 3) {
      for(j <- 0 until 3) {
        print(" " + fields(i)(j) + " ")
      }
      println
      println
    }
  }
}

println
var board = new Board(new Player("Batman", 'B'), new Player("Superman", 'S'))
board.printField
board.playerAtTurn
