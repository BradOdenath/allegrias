
import 'package:allegrias/music/chordophone/'
    'chordophone_string/chordophone_string.dart';
import '../note/note.dart';

///TODO: Rewrite the data notes
/*  Class:  Chordophone
* -----------------------------------------------------------------------------
*     Static
*       Attributes
*         int                 FRETBOARD_LENGTH
*       Accessors
*         List<String>        GUITAR_STRING_TUNING
*         List<Note>          GUITAR_STRING_NOTES
*                             FINGERBOARD_COORDINATES_TO_POSITION_GROUPS
*                             IS_VALID_RANGE_TO_POSITION_GROUP
*                             POSITION_GROUPS_TO_STRINGED_INSTRUMENT_CHORD
* -----------------------------------------------------------------------------
*     Attributes
*       List<GuitarStrings>   chordophoneStrings
* -----------------------------------------------------------------------------
*     Constructors
*                             Chordophone()
* -----------------------------------------------------------------------------
*     Accessors
*       List<GuitarStrings>   getChordophoneStrings
* -----------------------------------------------------------------------------
*     Mutators
* -----------------------------------------------------------------------------
*     Methods
*       void                  initializeDefaultValues
*       void                  addDefaultStrings
 */
class Chordophone {
  
  static final int DEFAULT_FINGERBOARD_LENGTH = 24;
  static final List<String> DEFAULT_CHORDOPHONE_STRING_TUNING = [
    //'D#4', 'A#3', 'F#3', 'C#3', 'G#2', 'D#2', 'A#1', 'F#1', 'C#1', 'G#0'
    //'D4', 'A3', 'F3', 'C3', 'G2', 'D2'//, 'A1', 'F1', 'C1', 'G0'
    'E4', 'B3', 'G3', 'D3', 'A2', 'E2'
  ];

  /// TODO: Implement this to writing efficient tablature.
  static int POSITION_RANGE = 5;

  static List<Map<int,int>> FINGERBOARD_COORDINATES_TO_POSITION_GROUPS(
      Map<Note,
      Map<int,int>> fingerboardCoordinatesNoteMap
      )
  {
    //print('FINGERBOARD_COORDINATES_TO_FRET_GROUPS'
    //    '($positionCoordinatesNoteMap)');
    List<Map<int,int>> positionGroups = [];
    if (fingerboardCoordinatesNoteMap != null) {
      fingerboardCoordinatesNoteMap.forEach((note, fingerboardCoordinates) {
        fingerboardCoordinates.forEach((stringIndex, positionIndex) {
          if (positionGroups.length > 0) {
            for (var positionGroup in positionGroups) {
              if (!positionGroup.containsKey(stringIndex)) {
                if (IS_VALID_RANGE_TO_POSITION_GROUP(
                    positionGroup,
                    positionIndex)!
                ) {
                  positionGroup.addAll({stringIndex:positionIndex});
                } else {
                  positionGroups.add({stringIndex:positionIndex});
                }
              } else {
                positionGroups.add({stringIndex:positionIndex});
              }
            }
          } else {
            positionGroups.add({stringIndex:positionIndex});
          }
        });
      });
    }
    //print('=> $positionGroups');
    return positionGroups;
  }

  static bool? IS_VALID_RANGE_TO_POSITION_GROUP(
      Map<int,int> positionGroup,
      int positionIndex) {
    bool out = true;
    //print('IS_VALID_RANGE_TO_POSITION_GROUP($positionGroup, $positionIndex)');
    if (positionGroup != null) {
      positionGroup.forEach((si, pos_i) {
        if (pos_i - positionIndex.abs() < POSITION_RANGE) {
          // print('=> false');
          out = false; //New positionIndex is out of Range of other positions
        }
      });
    }
    //print('=> $out');
    return out;
  }

  static Map<int,int> POSITION_GROUPS_TO_CHORDOPHONE_CHORD(
      List<Map<int,int>> positionGroups) {
    //print('POSITION_GROUPS_TO_CHORDOPHONE_CHORD($positionGroups)');
    Map<int,int> chordophoneChord = {};
    if (positionGroups != null) {
      positionGroups.forEach((map) {
        if (map.length > chordophoneChord.length) {
          chordophoneChord = map;
        }
      });
    }
    //print('=> $chordophoneChord');
    return chordophoneChord;
  }

  static List<Note> CHORDOPHONE_STRING_TUNING_NOTES_GENERATOR(
      List<String> chordophone_string_tuning) =>
      Note.TO_NOTES(chordophone_string_tuning);

  static int get CHORDOPHONE_STRING_COUNT =>
      DEFAULT_CHORDOPHONE_STRING_TUNING.length;

  static List<ChordophoneString>? GENERATE_CHORDOPHONE_STRINGS(
      List<Note> chordophone_string_tuning,
      int chordophone_string_count)
  {
    List<ChordophoneString> chordophoneStrings = [];
    for (int i = 0; i < chordophone_string_count; i++) {
      chordophoneStrings
          .add(ChordophoneString
          .fromDefaultFingerboardLength(chordophone_string_tuning[i]));
    }
    return chordophoneStrings;

  }

  List<String>? string_tuning = [];
  int get string_count => string_tuning!.length;

  Chordophone(List<String> string_tuning) {
    this.string_tuning = string_tuning;
  }

  Chordophone.fromDefaultStringTuning() {
    this.string_tuning = DEFAULT_CHORDOPHONE_STRING_TUNING;
  }

  List<Note> get chordophone_string_tuning_notes =>
      CHORDOPHONE_STRING_TUNING_NOTES_GENERATOR(string_tuning!);

  List<ChordophoneString>? get chordophone_strings =>
      GENERATE_CHORDOPHONE_STRINGS(
          chordophone_string_tuning_notes,
          string_count);

}
