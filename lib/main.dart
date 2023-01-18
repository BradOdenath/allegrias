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
  //String? note;
  bool? isRecording;
  //int? octave;
  bool? onPitch;

  Note noat = Note.C0;

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
    //note = flutterFft.getNote;
    //octave = flutterFft.getOctave;
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
            // note = data[2] as String,
            // octave = data[5] as int,
            // tabulatureStr = Guitar.NOTE_TO_TABULATURE_STANZA_TOSTRING(note),
            if (frequency != null) {
              noat = Note.fromFrequency(frequency!),
              tablature.addNote(
                  /*
                  Note(
                    noteOctave: octave,
                    noteNote: note,
                    noteFrequency: frequency,
                  )
                  */
                  noat,
              )
            },
          }),
          flutterFft.setIsOnPitch = onPitch!,
          //flutterFft.setOctave = octave!,
          //flutterFft.setNote = note!,
          flutterFft.setFrequency = frequency!,
          print(noat.toDisplayString()),
          //print("Note: "+flutterFft.getNote+flutterFft.getOctave.toString()
          //    +"("+flutterFft.getFrequency.toString()+"): "
          //    +flutterFft.getIsOnPitch.toString()),
          //print(tablature.chordophone!.chordophone_string_tuning_notes),
          //print("Note Frequency: " + flutterFft.getFrequency.toString()),
          //print("Note: " + flutterFft.getNote.toString()
          //    + flutterFft.getOctave.toString()),
        },
        onError: (err) => print("Error: $err"),
        onDone: () => print("Is done")

    );
  }



}