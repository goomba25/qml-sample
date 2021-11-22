import 'package:flutter/material.dart';
import 'package:flutter_sample1/custombutton.dart';

class MusicPlayer extends StatefulWidget {
  final String mediaTitle = "Title";
  final String mediaArtist = "Artist";
  final String playTime = "00:12";
  final String fullTime = "02:50";
  final String connectionName = "Q9";

  const MusicPlayer({Key? key}) : super(key: key);

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: const Color(0xFF141719).withOpacity(0.6),
        padding: const EdgeInsets.fromLTRB(83, 139, 147, 53),
        child: Row(
          children: [
            /* Left Side */
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: 724,
                    height: 52,
                    child: Text(
                      widget.mediaTitle,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontFamily: "Noto Sans",
                        fontSize: 38,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 724,
                    height: 52,
                    child: Text(
                      widget.mediaArtist,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: "Noto Sans",
                        fontSize: 34,
                        color: const Color(0xFFFFFFFF).withOpacity(0.6),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(top: 138, left: 64, right: 76),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CustomButton(
                          width: 100,
                          height: 100,
                          image:
                              Image.asset('images/BtMusic/normal/shuffle.png'),
                        ),
                        CustomButton(
                          width: 100,
                          height: 100,
                          image: Image.asset(
                              'images/BtMusic/normal/SkipPrevious.png'),
                        ),
                        CustomButton(
                          width: 100,
                          height: 100,
                          image: Image.asset('images/BtMusic/normal/Stop.png'),
                        ),
                        CustomButton(
                          width: 100,
                          height: 100,
                          image:
                              Image.asset('images/BtMusic/normal/SkipNext.png'),
                        ),
                        CustomButton(
                          width: 100,
                          height: 100,
                          image: Image.asset('images/BtMusic/normal/loop.png'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 60),
                    height: 43,
                    child: const Center(
                      child: SizedBox(
                        height: 10,
                        child: LinearProgressIndicator(
                          value: 0.4,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            /* Right Side */
            Container(
              margin: const EdgeInsets.only(left: 21),
              width: 352,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 352,
                    color: const Color(0xFFFFF3E0),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 60),
                    height: 43,
                    child: Text(
                      (widget.playTime + '/' + widget.fullTime),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: "Noto Sans",
                        fontSize: 32,
                        color: const Color(0xFFFFFFFF).withOpacity(0.6),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 70),
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.asset(
                              'images/BtMusic/normal/BluetoothDevice.png'),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          width: 200,
                          height: 60,
                          decoration: BoxDecoration(
                            color: const Color(0xFF393C3D).withOpacity(0.6),
                            border: Border.all(
                              color: const Color(0xFFFFFFFF).withOpacity(0.6),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              widget.connectionName,
                              style: const TextStyle(
                                fontFamily: "Noto Sans",
                                fontSize: 32,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
