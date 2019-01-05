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

    print(board.toString)

    currentPlayer = getNextPlayer(players)

    while(isRunning) {
      printPlayerTurn
      var currentMove = readMove()

      while (!currentMove.isValid(board)) {
        println(Console.RED + "Field is already set by '" + board.fields(currentMove.x)(currentMove.y) + "'" + Console.RESET)
        currentMove = readMove()
      }

      update(currentMove)
      print(board.toString)
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
    var x : Int = -1
    var y : Int = -1

    print("Enter X coord: ")
    x = scala.io.StdIn.readInt() - 1

    while (!(0 to 2 contains x)) {
      println(Console.RED + "Your requested X coord value is out of bounds!" + Console.RESET)
      print("Enter X coord: ")
      x = scala.io.StdIn.readInt() - 1
    }

    print("Enter Y coord: ")
    y = scala.io.StdIn.readInt() - 1

    while (!(0 to 2 contains y)) {
      println(Console.RED + "Your requested Y coord value is out of bounds!" + Console.RESET)
      print("Enter Y coord: ")
      y = scala.io.StdIn.readInt() - 1
    }
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

  override def toString(): String = {
    var board = 
      "  X → 1  2  3\n" + 
      "Y  \n" + 
      "↓\n" + 
      "\n"

    for(i <- 0 until 3) {
      board += ((i+1) + "    ")
      for(j <- 0 until 3) {
        board += (" " + fields(j)(i) + " ")
      }
      board += "\n\n"
    }
    board
  }

}

var game = new Game()
game.start()
