import 'package:allegrias/music/chordophone/chordophone.dart';
import 'package:flutter/material.dart';

class ChordophoneTuningDropdownButton extends StatefulWidget {
  const ChordophoneTuningDropdownButton({super.key});

  @override
  State<StatefulWidget> createState() => _ChordophoneTuningDropdownButton();
}

class _ChordophoneTuningDropdownButton
    extends State<ChordophoneTuningDropdownButton> {

  static final List<DropdownMenuItem<String>>
  dropDownTuningItems = (Chordophone.chordophoneTunings
      .map((String value) => DropdownMenuItem(
      value: value,
      child: Text(value)
  )).toList());

  String chordophoneTuning = Chordophone.chordophoneTunings[0];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      title: const Text('Tuning:'),
      trailing: DropdownButton(
        value: chordophoneTuning,
        onChanged: (String? newTuning) {
          if (newTuning != null) {
            setState(() {
              chordophoneTuning = newTuning;
            });
          }
        },
        items: dropDownTuningItems,
      ),
    );
  }

}