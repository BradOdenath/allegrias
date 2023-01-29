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
  static final List<DropdownMenuItem<String>>
  dropDownTuningItems = (Chordophone.chordophoneTunings
      .map((String value) => DropdownMenuItem(
      value: value,
      child: Text(value)
  )).toList());

  String chordophoneTuning = (Chordophone.chordophoneTunings[0]);

  double? frequency;
  bool? isRecording;
  bool? onPitch;

  //Current note data
  Note? note;

  // String tabulatureStr;

  Tablature tablature =
      new Tablature(
          Chordophone.fromDefaultChordophoneTuning()
      );

  FlutterFft flutterFft = new FlutterFft();

  @override
  void initState() {
    isRecording = (flutterFft.getIsRecording);
    frequency = (flutterFft.getFrequency);
    onPitch = (flutterFft.getIsOnPitch);

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
              if (note != null) Text(
                (note!.toStringFrequency()),
                style: (ApplicationTheme.TXTSTYLE),
              ),
              Text(
                ((isRecording!)
                    ? (this.tablature.toString())
                    : ('Not Recording')),
                style: (ApplicationTheme.TXTSTYLE),
              ),
              /// TODO: Fix glitching tablature button
              ListTile(
                title: const Text('Chordophone Tuning:'),
                trailing: DropdownButton(
                  value: (chordophoneTuning),
                  onChanged: (String? newTuning) {
                    if (newTuning != null) {
                      setState(() {
                        chordophoneTuning = (newTuning);
                        tablature.chordophone!
                            .setChordophoneStringTuning = (chordophoneTuning);
                      });
                    }
                  },
                  items: (dropDownTuningItems),
                ),
              ),
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
    setState(() => isRecording = (flutterFft.getIsRecording));

    flutterFft.onRecorderStateChanged.listen(
        (data) => {
          setState(() => {
            onPitch = data[10] as bool,
            frequency = data[1] as double,
            if (frequency != null) {
              note = (Note.fromFrequency(frequency!)),
              tablature.addNote(note)
            },
          }),
          flutterFft.setIsOnPitch = (onPitch!),
          flutterFft.setFrequency = (frequency!),
        },
        onError: (err) => print("Error: $err"),
        onDone: () => print("Is done")
    );
  }



}