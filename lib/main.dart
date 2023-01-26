import 'theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fft/flutter_fft.dart';
import 'music/chordophone/chordophone.dart';
import 'music/note/note.dart';
import 'music/tablature/tablature.dart';

void main() => runApp(TabApp());

class TabApp extends StatefulWidget {
  @override
  TabAppState createState() => TabAppState();
}

class TabAppState extends State<TabApp> {
  // Flutterfft Data
  double? frequency;
  bool? isRecording;
  bool? onPitch;

  //Current note data
  Note note = Note.C0;

  // String tabulatureStr;
  Tablature tablature =
      new Tablature(
          Chordophone(
              Chordophone
                  .DEFAULT_CHORDOPHONE_STRING_TUNING
          )
      );

  FlutterFft flutterFft = new FlutterFft();

  @override
  void initState() {
    isRecording = flutterFft.getIsRecording;
    frequency = flutterFft.getFrequency;
    onPitch = flutterFft.getIsOnPitch;

    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guitar Tabber',
      theme: ThemeData.light(),
      color: Colors.blue,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  isRecording! ?
                  this.tablature.toString()
                  : 'Not Recording',
                  style: ApplicationTheme.TXTSTYLE
              )
            ],
          ),
        ),
      ),
    );
  }

  _initialize() async {
    print("Starting recorder...");

    while (!(await(flutterFft.checkPermission()))) {
		flutterFft.requestPermission();
	}

    await flutterFft.startRecorder();
    print("Recorder started.");
    setState(() => isRecording = flutterFft.getIsRecording);

    flutterFft.onRecorderStateChanged.listen(
        (data) => {
          setState(() => {
            onPitch = data[10] as bool,
            frequency = data[1] as double,
            if (frequency != null) {
              note = Note.fromFrequency(frequency!),
              tablature.addNote(note)
            },
          }),
          flutterFft.setIsOnPitch = onPitch!,
          flutterFft.setFrequency = frequency!,
          print(note.toDisplayString()),
        },
        onError: (err) => print("Error: $err"),
        onDone: () => print("Is done")

    );
  }



}