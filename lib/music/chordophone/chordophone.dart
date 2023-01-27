import 'package:allegrias/music/chordophone/'
    'chordophone_string/chordophone_string.dart';
import 'package:allegrias/music/note/note.dart';

void test() {
  print("TODO: assert()");
}
void main() => test();

class Chordophone {
  
  static const int DEFAULT_FINGERBOARD_LENGTH = 24;
  static const List<String> DEFAULT_CHORDOPHONE_STRING_TUNING = [
    //'D#4', 'A#3', 'F#3', 'C#3', 'G#2', 'D#2', 'A#1', 'F#1', 'C#1', 'G#0'
    //'D4', 'A3', 'F3', 'C3', 'G2', 'D2'//, 'A1', 'F1', 'C1', 'G0'
    'E4', 'B3', 'G3', 'D3', 'A2', 'E2'
  ];

  /// TODO: Implement this to writing efficient tablature.
  static const int DEFAULT_POSITION_RANGE = 5;

  static List<Map<int, int>> fingerboardCoordinatesToPositions(
      Map<Note, Map<int, int>> fingerboardCoordinatesNoteMap
      )
  {
    //print('FINGERBOARD_COORDINATES_TO_FRET_GROUPS'
    //    '($positionCoordinatesNoteMap)');
    List<Map<int,int>> positionGroups = [];
    fingerboardCoordinatesNoteMap
        .forEach((note, fingerboardCoordinates) {
          fingerboardCoordinates
              .forEach((stringIndex, positionIndex) {
                if (positionGroups.length > 0) {
                  for (var positionGroup in positionGroups) {
                    if (!positionGroup.containsKey(stringIndex)) {
                      if (indexInRangeOfPositions(
                          positionGroup,
                          positionIndex
                      )!) {
                        positionGroup
                            .addAll({stringIndex:positionIndex});
                      } else {
                        positionGroups
                            .add({stringIndex:positionIndex});
                      }
                    } else {
                      positionGroups
                          .add({stringIndex:positionIndex});
                    }
                  }
                } else {
                  positionGroups
                      .add({stringIndex:positionIndex});
                }
              });
        });
    //print('=> $positionGroups');
    return (positionGroups);
  }

  static bool? indexInRangeOfPositions(
      Map<int,int> positions,
      int positionIndex)
  {
    bool out = true;
    positions.forEach((_, pos) {
      if (pos - positionIndex.abs() < DEFAULT_POSITION_RANGE) {
        //New positionIndex is out of Range of other positions
        out = false;
      }
    });
    return (out);
  }

  static Map<int,int> positionsToChord(
      List<Map<int,int>> positionGroups) {
    Map<int,int> chordophoneChord = {};
    positionGroups.forEach((map) {
      if (map.length > chordophoneChord.length) {
        chordophoneChord = map;
      }
    });
    return (chordophoneChord);
  }

  static List<Note> stringTuningNotes(
      List<String> chordophoneStringTuning) =>
      (Note.toNotes(chordophoneStringTuning));

  static int get chordophoneStringCount =>
      (DEFAULT_CHORDOPHONE_STRING_TUNING.length);

  static List<ChordophoneString> strings(
      List<Note> chordophoneStringTuning,
      int chordophoneStringCount
      )
  {
    List<ChordophoneString> chordophoneStrings = [];
    for (int i = 0; i < chordophoneStringCount; i++) {
      chordophoneStrings
          .add(ChordophoneString
          .fromDefaultFingerboardLength(chordophoneStringTuning[i]));
    }
    return (chordophoneStrings);

  }

  List<String>? string_tuning = [];

  Chordophone(List<String> string_tuning) {
    this.string_tuning = (string_tuning);
  }

  Chordophone.fromDefaultChordophoneStringTuning() {
    this.string_tuning = (DEFAULT_CHORDOPHONE_STRING_TUNING);
  }

  int get getStringCount => (string_tuning!.length);

  List<Note> get getTuning =>
      (stringTuningNotes(string_tuning!));

  List<ChordophoneString>? get getStrings =>
      (strings(
          getTuning,
          getStringCount));

}
