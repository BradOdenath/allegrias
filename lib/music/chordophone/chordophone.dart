import 'package:allegrias/commons.dart';
import 'package:allegrias/music/chordophone/'
    'chordophone_string/chordophone_string.dart';
import 'package:allegrias/music/note/note.dart';


class Chordophone {
  static const int DEFAULT_FINGERBOARD_LENGTH = 24;

  static const String
  DEFAULT_CHORDOPHONE_TUNING_NAME = 'Default';

  static const List<String> DEFAULT_CHORDOPHONE_TUNING = [
    //'D#4', 'A#3', 'F#3', 'C#3', 'G#2', 'D#2', 'A#1', 'F#1', 'C#1', 'G#0'
    //'D4', 'A3', 'F3', 'C3', 'G2', 'D2'//, 'A1', 'F1', 'C1', 'G0'
    'E4', 'B3', 'G3', 'D3', 'A2', 'E2', 'B1', 'F#1', 'C#1', 'G#0'
  ];

  static const String
  STANDARD_TEN_STRING_GUITAR_TUNING_NAME = '10 String Guitar';

  static const List<String> STANDARD_TEN_STRING_GUITAR_TUNING = [
    'E4', 'B3', 'G3', 'D3', 'A2', 'E2', 'B1', 'F#1', 'C#1', 'G#0'
  ];

  static const String
  STANDARD_SEVEN_STRING_GUITAR_TUNING_NAME = '7 String Guitar';

  static const List<String> STANDARD_SEVEN_STRING_GUITAR_TUNING = [
    'E4', 'B3', 'G3', 'D3', 'A2', 'E2', 'B1'
  ];

  static const String
  STANDARD_GUITAR_TUNING_NAME = '6 String Guitar';

  static const List<String> STANDARD_GUITAR_TUNING = [
    'E4', 'B3', 'G3', 'D3', 'A2', 'E2'
  ];

  static const String
  STANDARD_UKULELE_TUNING_NAME = 'Ukulele';

  static const List<String> STANDARD_UKULELE_TUNING = [
    'G4', 'C4', 'E4', 'A4'
  ];

  static const String
  STANDARD_VIOLIN_TUNING_NAME = 'Violin';

  static const List<String> STANDARD_VIOLIN_TUNING = [
    'E5', 'A4', 'D4', 'G3'
  ];

  static const String
  STANDARD_VIOLA_TUNING_NAME = 'Viola';

  static const List<String> STANDARD_VIOLA_TUNING = [
    'A4', 'D4', 'G3', 'C3'
  ];

  static const String
  STANDARD_CELLO_TUNING_NAME = 'Cello';

  static const List<String> STANDARD_CELLO_TUNING = [
    'A3', 'D3', 'G2', 'C2'
  ];

  static const String
  STANDARD_SIX_STRING_BASS_TUNING_NAME = '6 String Bass';

  static const List<String> STANDARD_SIX_STRING_BASS_TUNING = [
    'C3', 'G2', 'D2', 'A1', 'E1', 'B0'
  ];

  static const String
  STANDARD_FIVE_STRING_BASS_TUNING_NAME = '5 String Bass';

  static const List<String> STANDARD_FIVE_STRING_BASS_TUNING = [
    'G2', 'D2', 'A1', 'E1', 'B0'
  ];

  static const String
  STANDARD_BASS_TUNING_NAME = 'Bass';

  static const List<String> STANDARD_BASS_TUNING = [
    'G2', 'D2', 'A1', 'E1'
  ];

  /// TODO: Modify the dart language with const list contain const elements.
  static const List<String> chordophoneTunings = [
    Chordophone.DEFAULT_CHORDOPHONE_TUNING_NAME,
    Chordophone.STANDARD_TEN_STRING_GUITAR_TUNING_NAME,
    Chordophone.STANDARD_SEVEN_STRING_GUITAR_TUNING_NAME,
    Chordophone.STANDARD_GUITAR_TUNING_NAME,
    Chordophone.STANDARD_UKULELE_TUNING_NAME,
    Chordophone.STANDARD_VIOLIN_TUNING_NAME,
    Chordophone.STANDARD_VIOLA_TUNING_NAME,
    Chordophone.STANDARD_CELLO_TUNING_NAME,
    Chordophone.STANDARD_SIX_STRING_BASS_TUNING_NAME,
    Chordophone.STANDARD_FIVE_STRING_BASS_TUNING_NAME,
    Chordophone.STANDARD_BASS_TUNING_NAME
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
        //if (positionGroups.length > 0) {
          for (var positionGroup in positionGroups) {
            if (!positionGroup.containsKey(chordophoneStringIndex)) {
              if (indexInRangeOfPositions(positionGroup, positionIndex)!) {
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
        /* } else {
          positionGroups
              .add({chordophoneStringIndex: positionIndex});
        }*/
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

  Chordophone.fromDefaultChordophoneTuning() {
    this.setChordophoneStringTuning = (DEFAULT_CHORDOPHONE_TUNING);
    print_debug('Chordophone.fromDefaultChordophoneTuning() => $this');
  }

  Chordophone.fromStandardTenStringGuitarTuning() {
    this.setChordophoneStringTuning = (STANDARD_TEN_STRING_GUITAR_TUNING);
    print_debug('Chordophone.fromStandardTenStringGuitarTuning() => $this');
  }

  Chordophone.fromStandardSevenStringGuitarTuning() {
    this.setChordophoneStringTuning = (STANDARD_SEVEN_STRING_GUITAR_TUNING);
    print_debug('Chordophone.fromStandardSevenStringGuitarTuning() => $this');
  }

  Chordophone.fromStandardGuitarTuning() {
    this.setChordophoneStringTuning = (STANDARD_GUITAR_TUNING);
    print_debug('Chordophone.fromStandardGuitarTuning() => $this');
  }

  Chordophone.fromStandardUkuleleTuning() {
    this.setChordophoneStringTuning = (STANDARD_UKULELE_TUNING);
    print_debug('Chordophone.fromStandardUkuleleTuning() => $this');
  }

  Chordophone.fromStandardViolinTuning() {
    this.setChordophoneStringTuning = (STANDARD_VIOLIN_TUNING);
    print_debug('Chordophone.fromStandardViolinTuning() => $this');
  }

  Chordophone.fromStandardViolaTuning() {
    this.setChordophoneStringTuning = (STANDARD_VIOLA_TUNING);
    print_debug('Chordophone.fromStandardViolaTuning() => $this');
  }

  Chordophone.fromStandardCelloTuning() {
    this.setChordophoneStringTuning = (STANDARD_CELLO_TUNING);
    print_debug('Chordophone.fromStandardCelloTuning() => $this');
  }

  Chordophone.fromStandardSixStringBassTuning() {
    this.setChordophoneStringTuning = (STANDARD_SIX_STRING_BASS_TUNING);
    print_debug('Chordophone.fromStandardSixStringBassTuning() => $this');
  }

  Chordophone.fromStandardFiveStringBassTuning() {
    this.setChordophoneStringTuning = (STANDARD_FIVE_STRING_BASS_TUNING);
    print_debug('Chordophone.fromStandardFiveStringBassTuning() => $this');
  }

  Chordophone.fromStandardBassTuning() {
    this.setChordophoneStringTuning = (STANDARD_BASS_TUNING);
    print_debug('Chordophone.fromStandardBassTuning() => $this');
  }

  Chordophone.fromStringTuning(String chordophoneTuning) {
    switch(chordophoneTuning) {
      case (Chordophone.STANDARD_TEN_STRING_GUITAR_TUNING_NAME):
        Chordophone.fromStandardTenStringGuitarTuning();
        break;
      case (Chordophone.STANDARD_SEVEN_STRING_GUITAR_TUNING_NAME):
        Chordophone.fromStandardSevenStringGuitarTuning();
        break;
      case (Chordophone.STANDARD_GUITAR_TUNING_NAME):
        Chordophone.fromStandardGuitarTuning();
        break;
      case (Chordophone.STANDARD_UKULELE_TUNING_NAME):
        Chordophone.fromStandardUkuleleTuning();
        break;
      case (Chordophone.STANDARD_VIOLIN_TUNING_NAME):
        Chordophone.fromStandardViolinTuning();
        break;
      case (Chordophone.STANDARD_VIOLA_TUNING_NAME):
        Chordophone.fromStandardViolaTuning();
        break;
      case (Chordophone.STANDARD_CELLO_TUNING_NAME):
        Chordophone.fromStandardCelloTuning();
        break;
      case (Chordophone.STANDARD_SIX_STRING_BASS_TUNING_NAME):
        Chordophone.fromStandardSixStringBassTuning();
        break;
      case (Chordophone.STANDARD_FIVE_STRING_BASS_TUNING_NAME):
        Chordophone.fromStandardFiveStringBassTuning();
        break;
      case (Chordophone.STANDARD_BASS_TUNING_NAME):
        Chordophone.fromStandardBassTuning();
        break;
      default:
        Chordophone.fromDefaultChordophoneTuning();
    }
  }

  @override
  String toString() =>
      ('Chordophone'
          '(' + this.chordophoneStringTuning.toString() + ')');

  int get getChordophoneStringCount {
    int out = (chordophoneStringTuning!.length);
    print_debug('$this.getChordophoneStringCount => $out');
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

  set setChordophoneStringTuning(chordophoneStringTuning) {
    String out = ('$this.setChordophoneStringTuning = $chordophoneStringTuning');
    this.chordophoneStringTuning = chordophoneStringTuning;
    out += (' => $this');
    print_debug(out);
  }

}
