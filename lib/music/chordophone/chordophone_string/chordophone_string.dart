import 'package:allegrias/music/chordophone/chordophone.dart';
import 'package:allegrias/music/note/note.dart';

/*  Class: ChordophoneString
* -----------------------------------------------------------------------------
*     Static
*       String      CHORDOPHONE_STRING_ID
*                     Creation Time and Day
*       bool        IS_EXISTANT_NOTE_ON_CHORDOPHONE_STRING
*                     Checks Chordophone String For Note
*       List<Note>  CHORDOPHONE_STRING
*                     Generates Chordophone String Note Scale
* -----------------------------------------------------------------------------
*     Attributes
*       String      id
*       Note        indexNote
*                     Tuning of Chordophone String
* -----------------------------------------------------------------------------
*     Constructors
*                   ChordophoneString(Note)
*                     Constructs Chordophone String
*                     from input Note and generates ID
* -----------------------------------------------------------------------------
*     Accessors
*       Note        getIndexNote
*       List<Note>  getScale
* -----------------------------------------------------------------------------
*     Mutators
*       set         setIndexNote(Note)
* -----------------------------------------------------------------------------
*     Methods
*       bool        isNoteOnChordophoneString
*       int         noteExistsAtFret
* */

class ChordophoneString {

  static String get CHORDOPHONE_STRING_ID => DateTime.now()
      .hashCode
      .toString();

  static int // fret
  IS_EXISTANT_NOTE_ON_CHORDOPHONE_STRING(
      Note note, ChordophoneString stringedInstrumentString) {
    //print('IS_EXISTANT_NOTE_ON_STRINGED_INSTRUMENT_STRING'
    //    '($note, $stringedInstrumentString)');
    for (int i = 0; i < Chordophone.FINGERBOARD_LENGTH; i++) {
      if (stringedInstrumentString
          .getScale[i]
          .getFrequency == note.getFrequency) {
        //print('=> $i');
        return i;
      }
    }
    //print('=> -1');
    return -1;
  }

  static List<Note> CHORDOPHONE_STRING(Note note) {
    //print('CHORDOPHONE_STRING($note)');
    List<Note> chordophoneString = [];
    for (int j = 0; j < Chordophone.FINGERBOARD_LENGTH; j++) {
      chordophoneString.add(note);
      note.sharpen();
    }
    //print('=> $chordophoneString');
    return chordophoneString;
  }

  String? id;
  Note? indexNote;

  ChordophoneString(Note indexNote) {
    this.id = CHORDOPHONE_STRING_ID;
    this.indexNote = indexNote;
  }

  Note get getIndexNote => this.indexNote!;
  List<Note> get getScale => CHORDOPHONE_STRING(this.indexNote!);

  set setIndexNote(Note note) => this.indexNote = note;

  bool isNoteOnGuitarString(Note note) =>
      IS_EXISTANT_NOTE_ON_CHORDOPHONE_STRING(note, this) != -1;

  int noteExistsAtPosition(Note note) =>
      IS_EXISTANT_NOTE_ON_CHORDOPHONE_STRING(note, this);

}