
import 'package:allegrias/music/chordophone/'
    'chordophone_string/chordophone_string.dart';
import '../note/note.dart';

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
  
  static int POSITION_RANGE = 5;
  static final int FINGERBOARD_LENGTH = 24;
  static final List<String> CHORDOPHONE_STRING_TUNING = [
    //'D#4', 'A#3', 'F#3', 'C#3', 'G#2', 'D#2', 'A#1', 'F#1', 'C#1', 'G#0'
    'D4', 'A3', 'F3', 'C3', 'G2', 'D2', 'A1', 'F1', 'C1', 'G0'
  ];
  
  static List<Map<int,int>> FINGERBOARD_COORDINATES_TO_POSITION_GROUPS(Map<Note,
      Map<int,int>> fingerboardCoordinatesNoteMap) {
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
                    positionIndex)!) {
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
    print('POSITION_GROUPS_TO_CHORDOPHONE_CHORD($positionGroups)');
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

  static List<Note> get CHORDOPHONE_STRING_NOTES =>
      Note.TO_NOTES(CHORDOPHONE_STRING_TUNING);

  static int get CHORDOPHONE_STRING_COUNT =>
      CHORDOPHONE_STRING_TUNING.length;

  static List<ChordophoneString> get CHORDOPHONE_STRINGS {
    List<ChordophoneString> chordophoneStrings = [];
    for (int i = 0; i < CHORDOPHONE_STRING_COUNT; i++) {
      chordophoneStrings
          .add(ChordophoneString(CHORDOPHONE_STRING_NOTES[i]));
    }
    return chordophoneStrings;
  }

}