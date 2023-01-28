import 'package:allegrias/commons.dart';
import 'package:allegrias/music/chordophone/'
    'chordophone_string/chordophone_string.dart';
import 'package:allegrias/music/note/note.dart';

class Chordophone {
  static const int DEFAULT_FINGERBOARD_LENGTH = 24;

  static const List<String> DEFAULT_CHORDOPHONE_STRING_TUNING = [
    //'D#4', 'A#3', 'F#3', 'C#3', 'G#2', 'D#2', 'A#1', 'F#1', 'C#1', 'G#0'
    'D4', 'A3', 'F3', 'C3', 'G2', 'D2'//, 'A1', 'F1', 'C1', 'G0'
    //'E4', 'B3', 'G3', 'D3', 'A2', 'E2'
  ];

  static const List<String> STANDARD_GUITAR_STRING_TUNING = [
    //'D#4', 'A#3', 'F#3', 'C#3', 'G#2', 'D#2', 'A#1', 'F#1', 'C#1', 'G#0'
    //'D4', 'A3', 'F3', 'C3', 'G2', 'D2'//, 'A1', 'F1', 'C1', 'G0'
    'E4', 'B3', 'G3', 'D3', 'A2', 'E2'
  ];

  static const List<String> STANDARD_VIOLIN_STRING_TUNING = [
    //'D#4', 'A#3', 'F#3', 'C#3', 'G#2', 'D#2', 'A#1', 'F#1', 'C#1', 'G#0'
    //'D4', 'A3', 'F3', 'C3', 'G2', 'D2'//, 'A1', 'F1', 'C1', 'G0'
    'E5', 'A4', 'D4', 'G3'
  ];

  /// TODO: Implement this to writing efficient tablature.
  static const int DEFAULT_POSITION_RANGE = 5;

  static List<Map<int, int>> fingerboardCoordinatesToPositions(
      Map<Note, Map<int, int>> fingerboardCoordinatesNoteMap) {
    List<Map<int, int>> positionGroups = [];
    fingerboardCoordinatesNoteMap
        .forEach((note, fingerboardCoordinates) {
      fingerboardCoordinates
          .forEach((chordophoneStringIndex, positionIndex) {
        if (positionGroups.length > 0) {
          for (var positionGroup in positionGroups) {
            if (!positionGroup.containsKey(chordophoneStringIndex)) {
              if (indexInRangeOfPositions(
                  positionGroup,
                  positionIndex
              )!) {
                positionGroup
                    .addAll({chordophoneStringIndex: positionIndex});
              } else {
                positionGroups
                    .add({chordophoneStringIndex: positionIndex});
              }
            } else {
              positionGroups
                  .add({chordophoneStringIndex: positionIndex});
            }
          }
        } else {
          positionGroups
              .add({chordophoneStringIndex: positionIndex});
        }
      });
    });
    print_debug('Chordophone.fingerboardCoordinatesToPositions'
        '($fingerboardCoordinatesNoteMap) => $positionGroups');
    return (positionGroups);
  }

  static bool? indexInRangeOfPositions(Map<int, int> positions,
      int positionIndex) {
    bool out = true;
    positions.forEach((_, pos) {
      if (pos - positionIndex.abs() < DEFAULT_POSITION_RANGE) {
        //New positionIndex is out of Range of other positions
        out = false;
      }
    });
    print_debug('Chordophone'
        '.indexInRangeOfPositions($positions, $positionIndex) => $out');
    return (out);
  }


  static Map<int,int> positionsToChord(List<Map<int,int>> positionGroups) {
    Map<int,int> chordophoneChord = {};
    positionGroups.forEach((map) {
      if (map.length > chordophoneChord.length) {
        chordophoneChord = map;
      }
    });
    print_debug('Note'
        '.positionToChord($positionGroups) => $chordophoneChord');
    return (chordophoneChord);
  }


  static List<ChordophoneString> chordophoneStrings(
      List chordophoneStringTuning) {
    List<ChordophoneString> chordophoneStrings = [];
    if (chordophoneStringTuning is List<ChordophoneString>) {
      chordophoneStrings = chordophoneStringTuning;
    } else if ((chordophoneStringTuning is List<Note>)
        || (chordophoneStringTuning is List<String>)) {
      List<Note> _chordophoneStringTuning = Note
          .toNotes(chordophoneStringTuning);
      for (int i = 0; (i < _chordophoneStringTuning.length); i++) {
        chordophoneStrings
            .add(ChordophoneString
            .fromDefaultFingerboardLength(_chordophoneStringTuning[i]));
      }
    }
    print_debug('Chordophone'
        '.chordophoneStrings($chordophoneStringTuning) => $chordophoneStrings');
    return (chordophoneStrings);
  }

  List? chordophoneStringTuning = [];

  Chordophone({this.chordophoneStringTuning});

  Chordophone.fromStandardGuitarTuning() {
    this.chordophoneStringTuning = (STANDARD_GUITAR_STRING_TUNING);
    print_debug('Chordophone.fromStandardGuitarTuning() => $this');
  }

  Chordophone.fromDefaultChordophoneTuning() {
    this.chordophoneStringTuning = (DEFAULT_CHORDOPHONE_STRING_TUNING);
    print_debug('Chordophone.fromDefaultChordophoneTuning() => $this');
  }

  @override
  String toString() =>
      ('Chordophone'
          '(' + this.chordophoneStringTuning.toString() + ')');

  int get getChordophoneStringCount {
    int out = (chordophoneStringTuning!.length);
    print('$this.getChordophoneStringCount => $out');
    return (out);
  }

  List<Note> get getChordophoneStringTuning {
    List<Note> out = (Note.toNotes(chordophoneStringTuning!));
    print_debug('$this.getChordophoneStringTuning => $out');
    return (out);
  }

  List<ChordophoneString> get getChordophoneStrings {
    List<ChordophoneString> out =
    (chordophoneStrings(getChordophoneStringTuning));
    print_debug('$this.getChordophoneStrings => $out');
    return (out);
  }

}
