import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isTurnO = true;
  List<String> xOrOList = ['', '', '', '', '', '', '', '', ''];
  int filledBoxes = 0;
  bool gameHasResult = false;
  int scoreX = 0;
  int scoreO = 0;
  String winnerTitel = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[900],
          appBar: AppBar(
            centerTitle: true,
            title: Text('TicTacToe'),
            elevation: 0,
            backgroundColor: Colors.grey[900],
            actions: [
              IconButton(
                  onPressed: () {
                    clearGame();
                    gameHasResult = false;
                  },
                  icon: Icon(Icons.refresh)),
            ],
          ),
          body: Column(
            children: [
              SizedBox(height: 5),
              getScoreBord(),
              getResultButton(),
              SizedBox(height: 10),
              grideBuilder(),
              getTurn(),
              SizedBox(height: 10),
            ],
          )),
    );
  }

  ////////////getScoreBord/////////////
  Widget getScoreBord() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'player O',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$scoreO',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'player X',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$scoreX',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  //////////grideBuilder///////////
  Widget grideBuilder() {
    return Expanded(
      child: GridView.builder(
        itemCount: 9,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              tabped(index);
            },
            child: Container(
              height: 100,
              width: 100,
              child: Center(
                child: Text(
                  xOrOList[index],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color:
                          xOrOList[index] == 'X' ? Colors.white : Colors.red),
                ),
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
            ),
          );
        },
      ),
    );
  }

  //////////tabped///////////
  void tabped(int index) {
    if (gameHasResult == true) {
      return;
    }

    setState(() {
      if (xOrOList[index] != '') {
        return;
      }

      if (isTurnO) {
        xOrOList[index] = 'O';
        filledBoxes = filledBoxes + 1;
      } else {
        xOrOList[index] = 'X';
        filledBoxes = filledBoxes + 1;
      }
      isTurnO = !isTurnO;
      checWinner();
    });
  }

  //////////checWinner///////////
  void checWinner() {
    if (xOrOList[0] == xOrOList[1] &&
        xOrOList[0] == xOrOList[2] &&
        xOrOList[0] != '') {
      setResult(xOrOList[0], 'Winner is ' + xOrOList[0]);
      return;
    }
    if (xOrOList[3] == xOrOList[4] &&
        xOrOList[3] == xOrOList[5] &&
        xOrOList[3] != '') {
      setResult(xOrOList[3], 'Winner is ' + xOrOList[3]);
      return;
    }
    if (xOrOList[6] == xOrOList[7] &&
        xOrOList[6] == xOrOList[8] &&
        xOrOList[6] != '') {
      setResult(xOrOList[6], 'Winner is ' + xOrOList[6]);
      return;
    }
    ////////////////////////
    if (xOrOList[0] == xOrOList[3] &&
        xOrOList[0] == xOrOList[6] &&
        xOrOList[0] != '') {
      setResult(xOrOList[0], 'Winner is ' + xOrOList[0]);
      return;
    }
    if (xOrOList[1] == xOrOList[4] &&
        xOrOList[1] == xOrOList[7] &&
        xOrOList[1] != '') {
      setResult(xOrOList[1], 'Winner is ' + xOrOList[1]);
      return;
    }
    if (xOrOList[2] == xOrOList[5] &&
        xOrOList[2] == xOrOList[8] &&
        xOrOList[2] != '') {
      setResult(xOrOList[2], 'Winner is ' + xOrOList[2]);
      return;
    }
    //////////////////
    if (xOrOList[0] == xOrOList[4] &&
        xOrOList[0] == xOrOList[8] &&
        xOrOList[0] != '') {
      setResult(xOrOList[0], 'Winner is ' + xOrOList[0]);
      ;
      return;
    }
    if (xOrOList[2] == xOrOList[4] &&
        xOrOList[2] == xOrOList[6] &&
        xOrOList[2] != '') {
      setResult(xOrOList[2], 'Winner is ' + xOrOList[2]);
      return;
    }

    if (filledBoxes == 9) {
      setResult('', ' Drow ');
    }
  }

  //////////getTurn///////////
  Widget getTurn() {
    return Text(
      isTurnO ? 'Turn O' : 'Turn X',
      style: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  //////////setResult///////////
  void setResult(String winner, String titel) {
    setState(() {
      gameHasResult = true;
      winnerTitel = titel;
      if (winner == 'X') {
        scoreX = scoreX + 1;
      } else if (winner == 'O') {
        scoreO = scoreO + 1;
      } else {
        scoreX = scoreX + 1;
        scoreO = scoreO + 1;
      }
    });
  }

  //////////clearGame///////////
  void clearGame() {
    setState(() {
      for (var i = 0; i < xOrOList.length; i++) {
        xOrOList[i] = '';
      }
    });
    filledBoxes = 0;
  }

//////////getResultButton///////////
  Widget getResultButton() {
    return Visibility(
      visible: gameHasResult,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              primary: Colors.white,
              side: BorderSide(color: Colors.white, width: 2)),
          onPressed: () {
            setState(() {
              gameHasResult = false;
              clearGame();
            });
          },
          child: Text(
            '$winnerTitel , paly again!',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          )),
    );
  }
}
