class Player(val name: String, val marker: Char)

class Board(val player1: Player, val player2: Player) {
  private val N = "·" // Blank value to initialize board with

  // TODO: make sure both players have different `marker` values

  /**
   * Allows construction like so:
   *    new Board(("John", 'X'), ("Jane", 'O'))
   */
  def this(player1: (String, Char), player2: (String, Char)) {
    this(new Player(player1._1, player1._2), new Player(player2._1, player2._2))
  }

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
// var board = new Board(new Player("Batman", 'B'), new Player("Superman", 'S'))
var board = new Board(("Batman", 'B'), ("Superman", 'S'))
board.printField
board.playerAtTurn
