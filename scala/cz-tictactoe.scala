class Player(val name: String, val marker: Char)

class Move(val x: Int, val y: Int, val player: Player) {
  def isValid(board: Board): Boolean = board.fields(x)(y) == board.UNOCCUPIED
}

class Game() {
  var board = new Board()

  private var moves = 0
  // TODO: Replace dummy player by nice native language construct solution
  private var currentPlayer = new Player("", '-')

  def start() = {
    val player1 = getPlayerData()
    val player2 = getPlayerData()
    // FIXME: make sure both players have different `marker` values
    val players = List[Player](player1, player2)

    board.printField

    currentPlayer = getNextPlayer(players)

    while(isRunning) {
      printPlayerTurn
      var currentMove = readMove()

      while (!currentMove.isValid(board)) {
        println(Console.RED + "Field is already set by '" + board.fields(currentMove.x)(currentMove.y) + "'" + Console.RESET)
        currentMove = readMove()
      }

      update(currentMove)
      board.printField
      currentPlayer = getNextPlayer(players)
    }
  }

  private def isRunning(): Boolean = moves < 9 || hasWinner

  // TODO: Implement me
  private def hasWinner(): Boolean = false

  private def printPlayerTurn = {
    println("It's " + currentPlayer.name + "(" + currentPlayer.marker + ")'s turn.")
  }

  def readMove(): Move = {
    print("Enter X coord: ")
    val x = scala.io.StdIn.readInt() - 1
    print("Enter Y coord: ")
    val y = scala.io.StdIn.readInt() - 1

    new Move(x, y, currentPlayer)
  }

  private def update(move: Move) {
    board.fields(move.x)(move.y) = move.player.marker.toString
    moves += 1
  }

  private def getNextPlayer(players: List[Player]): Player = players.filter(_ != currentPlayer)(0)

  private def getPlayerData(): Player = {
    print("Enter player name : ")
    val playerName = scala.io.StdIn.readLine()

    val defaultMarker = playerName.toUpperCase()(0)
    print("Enter player sign (\"" + defaultMarker + "\"): ")
    var playerMarkerInput = scala.io.StdIn.readLine()
    var playerMarker = defaultMarker

    if (playerMarkerInput.length != 0) {
      playerMarker = playerMarkerInput(0)
    }

    new Player(playerName, playerMarker)
  }
}

class Board() {
  val UNOCCUPIED = "·" // Blank value to initialize board with

  var fields = Array.tabulate(3,3)( (x,y) => UNOCCUPIED )

  // FIXME: change to `override def toString(): String` and let `Game` draw it
  def printField(): Unit = {
    for(i <- 0 until 3) {
      for(j <- 0 until 3) {
        print(" " + fields(j)(i) + " ")
      }
      println
      println
    }
  }

}

var game = new Game()
game.start()
