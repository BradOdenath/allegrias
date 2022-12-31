import 'package:allegrias/music/guitar/guitar.dart';
import 'package:allegrias/music/note/note.dart';

/*  Class: GuitarString
* -----------------------------------------------------------------------------
*     Static
*       String      GUITAR_STRING_ID
*                     Creation Time and Day
*       bool        IS_EXISTANT_NOTE_ON_GUITAR_STRING
*                     Checks Guitar String For Note
*       List<Note>  GUITAR_STRING
*                     Generates Guitar String Note Scale
* -----------------------------------------------------------------------------
*     Attributes
*       String      id
*       Note        indexNote
*                     Tuning of Guitar String
* -----------------------------------------------------------------------------
*     Constructors
*                   GuitarString(Note)
*                     Constructs Guitar String from input Note and generates ID
* -----------------------------------------------------------------------------
*     Accessors
*       Note        getIndexNote
*       List<Note>  getScale
* -----------------------------------------------------------------------------
*     Mutators
*       set         setIndexNote(Note)
* -----------------------------------------------------------------------------
*     Methods
*       bool        isNoteOnGuitarString
*       int         noteExistsAtFret
* */

class GuitarString {

  static String get GUITAR_STRING_ID => DateTime.now().hashCode.toString();

  static int // fret
  IS_EXISTANT_NOTE_ON_GUITAR_STRING(Note note, GuitarString guitarString) {
    print('IS_EXISTANT_NOTE_ON_GUITAR_STRING($note, $guitarString)');
    for (int i = 0; i < Guitar.FRETBOARD_LENGTH; i++) {
      if (guitarString.getScale[i].getFrequency == note.getFrequency) {
        print('=> $i');
        return i;
      }
    }
    print('=> -1');
    return -1;
  }

  static List<Note> GUITAR_STRING(Note note) {
    print('GUITAR_STRING($note)');
    List<Note> guitarString = [];
    for (int j = 0; j < Guitar.FRETBOARD_LENGTH; j++) {
      guitarString.add(note);
      note.sharpen();
    }
    print('=> $guitarString');
    return guitarString;
  }

  String? id;
  Note? indexNote;

  GuitarString(Note indexNote) {
    this.id = GUITAR_STRING_ID;
    this.indexNote = indexNote;
  }

  Note get getIndexNote => this.indexNote!;
  List<Note> get getScale => GUITAR_STRING(this.indexNote!);

  set setIndexNote(Note note) => this.indexNote = note;

  bool isNoteOnGuitarString(Note note) =>
      IS_EXISTANT_NOTE_ON_GUITAR_STRING(note, this) != -1;

  int noteExistsAtFret(Note note) =>
      IS_EXISTANT_NOTE_ON_GUITAR_STRING(note, this);

}