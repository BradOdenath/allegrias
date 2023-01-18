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

  static int // fingerboard note/fret
  IS_EXISTANT_NOTE_ON_CHORDOPHONE_STRING(
      Note note, ChordophoneString chordophoneString) {
    //print('IS_EXISTANT_NOTE_ON_STRINGED_INSTRUMENT_STRING'
    //    '($note, $stringedInstrumentString)');
    for (
    int i = 0;
    i < Chordophone.DEFAULT_FINGERBOARD_LENGTH;
    i++) {
      if (chordophoneString
          .getScale[i]
          .toString() == note.toString()) {
        //print('=> $i');
        return i;
      }
    }
    //print('=> -1');
    return -1;
  }

  static List<Note> CHORDOPHONE_STRING(
      int string_length, Note note)
  {
    List<Note> chordophone_string = [];
    Note focusNote = note;
    for (int i = 0; i < string_length; i++) {
      chordophone_string.add(Note.fromNote(focusNote));
      focusNote = focusNote.sharpen();
    }
    //print('Chordophone String: $chordophone_string');
    return chordophone_string;
  }

  Note? index_note;
  int? string_length;

  ChordophoneString(Note index_note, int string_length) {
    this.index_note = index_note;
    this.string_length = string_length;
  }

  ChordophoneString.fromDefaultFingerboardLength(Note index_note) {
    this.index_note = index_note;
    this.string_length = Chordophone.DEFAULT_FINGERBOARD_LENGTH;
  }

  Note get getIndexNote =>
      this.index_note!;

  List<Note> get getScale => CHORDOPHONE_STRING(
      this.string_length!, this.index_note!);

  set setIndexNote(Note note) =>
      this.index_note = note;

  set setStringLength(int length) =>
      this.string_length = length;

  bool isNoteOnChordophoneString(Note note) =>
      IS_EXISTANT_NOTE_ON_CHORDOPHONE_STRING(note, this) != -1;

  int noteExistsAtPosition(Note note) =>
      IS_EXISTANT_NOTE_ON_CHORDOPHONE_STRING(note, this);

}