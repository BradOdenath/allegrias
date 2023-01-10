import 'package:allegrias/music/chordophone/chordophone.dart';
import 'package:allegrias/music/note/note.dart';

/// TODO: Rewrite the data notes
/*  Class: ChordophoneString
* -----------------------------------------------------------------------------
*     Static
*       bool        IS_EXISTANT_NOTE_ON_CHORDOPHONE_STRING
*                     Checks Chordophone String For Note
*       List<Note>  CHORDOPHONE_STRING
*                     Generates Chordophone String Note Scale
* -----------------------------------------------------------------------------
*     Attributes
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

void test() {

}

void main() => test();

class ChordophoneString {

  static int // fret
  IS_EXISTANT_NOTE_ON_CHORDOPHONE_STRING(
      Note note, ChordophoneString chordophoneString) {
    //print('IS_EXISTANT_NOTE_ON_STRINGED_INSTRUMENT_STRING'
    //    '($note, $stringedInstrumentString)');
    for (int i = 0; i < Chordophone.FINGERBOARD_LENGTH; i++) {
      if (chordophoneString
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

  Note? index_note;
  int? string_length;

  ChordophoneString(Note index_note, int string_length) {
    this.index_note = index_note;
    this.string_length = string_length;
  }

  ChordophoneString.fromDefaultFingerboardLength(Note index_note) {
    this.index_note = index_note;
    this.string_length = Chordophone.FINGERBOARD_LENGTH;
  }

  Note get getIndexNote => this.index_note!;
  List<Note> get getScale => CHORDOPHONE_STRING(this.index_note!);

  set setIndexNote(Note note) => this.index_note = note;
  set setStringLength(int length) => this.string_length = length;

  bool isNoteOnChordophoneString(Note note) =>
      IS_EXISTANT_NOTE_ON_CHORDOPHONE_STRING(note, this) != -1;

  int noteExistsAtPosition(Note note) =>
      IS_EXISTANT_NOTE_ON_CHORDOPHONE_STRING(note, this);

}