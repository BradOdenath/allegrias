import 'package:allegrias/music/guitar/guitar_string/stringed_instrument_string.dart';

import '../note/note.dart';

/*  Class:  Guitar
* -----------------------------------------------------------------------------
*     Static
*       Attributes
*         int                 FRETBOARD_LENGTH
*       Accessors
*         List<String>        GUITAR_STRING_TUNING
*         List<Note>          GUITAR_STRING_NOTES
*                             FRETBOARD_COORDINATES_TO_FRET_GROUPS
*                             IS_VALID_RANGE_TO_FRET_GROUP
*                             FRET_GROUPS_TO_GUITAR_CHORD
* -----------------------------------------------------------------------------
*     Attributes
*       List<GuitarStrings>   guitarStrings
* -----------------------------------------------------------------------------
*     Constructors
*                             Guitar()
* -----------------------------------------------------------------------------
*     Accessors
*       List<GuitarStrings>   getGuitarStrings
* -----------------------------------------------------------------------------
*     Mutators
* -----------------------------------------------------------------------------
*     Methods
*       void                  initializeDefaultValues
*       void                  addDefaultStrings
 */
class StringedInstrument {
  
  static int FRET_RANGE = 5;
  static final int FRETBOARD_LENGTH = 24;
  static final List<String> INSTRUMENT_STRING_TUNING = [
    //'D#4', 'A#3', 'F#3', 'C#3', 'G#2', 'D#2', 'A#1', 'F#1', 'C#1', 'G#0'
    'D4', 'A3', 'F3', 'C3', 'G2', 'D2', 'A1', 'F1', 'C1', 'G0'
  ];
  
  static List<Map<int,int>> FRETBOARD_COORDINATES_TO_FRET_GROUPS(Map<Note,
      Map<int,int>> fretboardCoordinatesNoteMap) {
    //print('FRETBOARD_COORDINATES_TO_FRET_GROUPS'
    //    '($fretboardCoordinatesNoteMap)');
    List<Map<int,int>> fretGroups = [];
    if (fretboardCoordinatesNoteMap != null) {
      fretboardCoordinatesNoteMap.forEach((note, fretboardCoordinates) {
        fretboardCoordinates.forEach((stringIndex, fretIndex) {
          if (fretGroups.length > 0) {
            for (var fretGroup in fretGroups) {
              if (!fretGroup.containsKey(stringIndex)) {
                if (IS_VALID_RANGE_TO_FRET_GROUP(fretGroup, fretIndex)!) {
                  fretGroup.addAll({stringIndex:fretIndex});
                } else {
                  fretGroups.add({stringIndex:fretIndex});
                }
              } else {
                fretGroups.add({stringIndex:fretIndex});
              }
            }
          } else {
            fretGroups.add({stringIndex:fretIndex});
          }
        });
      });
    }
    //print('=> $fretGroups');
    return fretGroups;
  }

  static bool? IS_VALID_RANGE_TO_FRET_GROUP(
      Map<int,int> fretGroup,
      int fretIndex) {
    bool out = true;
    //print('IS_VALID_RANGE_TO_FRET_GROUP($fretGroup, $fretIndex)');
    if (fretGroup != null) {
      fretGroup.forEach((si, fi) {
        if (fi - fretIndex.abs() < FRET_RANGE) {
          // print('=> false');
          out = false; //New fretIndex is out of Range of other frets
        }
      });
    }
    //print('=> $out');
    return out;
  }

  static Map<int,int> FRET_GROUPS_TO_STRINGED_INSTRUMENT_CHORD(
      List<Map<int,int>> fretGroups) {
    print('FRET_GROUPS_TO_STRINGED_INSTRUMENT_CHORD($fretGroups)');
    Map<int,int> stringedInstrumentChord = {};
    if (fretGroups != null) {
      fretGroups.forEach((map) {
        if (map.length > stringedInstrumentChord.length) {
          stringedInstrumentChord = map;
        }
      });
    }
    //print('=> $stringedInstrumentChord');
    return stringedInstrumentChord;
  }

  static List<Note> get STRINGED_INSTRUMENT_STRING_NOTES =>
      Note.TO_NOTES(INSTRUMENT_STRING_TUNING);

  static int get STRINGED_INSTRUMENT_STRING_COUNT =>
      INSTRUMENT_STRING_TUNING.length;

  static List<StringedInstrumentString> get GUITAR_STRINGS {
    List<StringedInstrumentString> stringedInstrumentStrings = [];
    for (int i = 0; i < STRINGED_INSTRUMENT_STRING_COUNT; i++) {
      stringedInstrumentStrings
          .add(StringedInstrumentString(STRINGED_INSTRUMENT_STRING_NOTES[i]));
    }
    return stringedInstrumentStrings;
  }

}
