class Player(val name: String, val marker: Char)

// FIXME: add a `Game` class and stop handling player turns in `Board`

class Board(val player1: Player, val player2: Player) {
  private val N = "·" // Blank value to initialize board with

  private var moves = 0

  val players = List[Player](player1, player2)

  // FIXME: make sure both players have different `marker` values

  /**
   * Allows construction like so:
   *    new Board(("John", 'X'), ("Jane", 'O'))
   */
  def this(player1: (String, Char), player2: (String, Char)) {
    this(new Player(player1._1, player1._2), new Player(player2._1, player2._2))
  }

  var fields = Array.tabulate(3,3)( (x,y) => N )

  // Somewhat clunky way to flip the coin on who's gonna start the game?
  private var _playerAtTurn = players(scala.util.Random.nextInt(2))

  def playerAtTurn: Player = _playerAtTurn

  def printPlayerTurn = println("It's " + _playerAtTurn.name + "(" + _playerAtTurn.marker + ")'s turn.")

  // FIXME: change to `override def toString(): String` and let `Game` draw it
  def printField(): Unit = {
    for(i <- 0 until 3) {
      for(j <- 0 until 3) {
        print(" " + fields(i)(j) + " ")
      }
      println
      println
    }
  }

  def isRunning(): Boolean = moves < 9 || hasWinner

  // TODO: Implement me
  def hasWinner(): Boolean = false

  def readMove(): Unit = {
    print("Enter X coord: ")
    val x = scala.io.StdIn.readInt() - 1
    print("Enter Y coord: ")
    val y = scala.io.StdIn.readInt() - 1

    if (fields(x)(y) != N) {
      println(Console.RED + "Field is already set by '" + fields(x)(y) + "'" + Console.RESET)
      readMove
    } else {
      doMove(x, y)
    }
  }

  private def doMove(x: Int, y: Int) {
    fields(x)(y) = playerAtTurn.marker.toString
    moves += 1
    _playerAtTurn = getNextPlayer
  }

  private def getNextPlayer(): Player = players.filter(_ != playerAtTurn)(0)
}

println
// var board = new Board(new Player("Batman", 'B'), new Player("Superman", 'S'))
var board = new Board(("Batman", 'B'), ("Superman", 'S'))
board.printField

while(board.isRunning) {
  board.printPlayerTurn
  board.readMove
  board.printField
}
