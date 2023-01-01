import 'package:allegrias/music/guitar/stringed_instrument.dart';
import 'package:allegrias/music/note/note.dart';

/*  Class: StringedInstrumentString
* -----------------------------------------------------------------------------
*     Static
*       String      STRINGED_INSTRUMENT_STRING_ID
*                     Creation Time and Day
*       bool        IS_EXISTANT_NOTE_ON_STRINGED_INSTRUMENT_STRING
*                     Checks Guitar String For Note
*       List<Note>  STRINGED_INSTRUMENT_STRING
*                     Generates Guitar String Note Scale
* -----------------------------------------------------------------------------
*     Attributes
*       String      id
*       Note        indexNote
*                     Tuning of Stringed Instrument String
* -----------------------------------------------------------------------------
*     Constructors
*                   StringedInstrumentString(Note)
*                     Constructs Stringed Instrument String
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
*       bool        isNoteOnStringedInstrumentString
*       int         noteExistsAtFret
* */

class StringedInstrumentString {

  static String get STRINGED_INSTRUMENT_STRING_ID => DateTime.now()
      .hashCode
      .toString();

  static int // fret
  IS_EXISTANT_NOTE_ON_STRINGED_INSTRUMENT_STRING(
      Note note, StringedInstrumentString stringedInstrumentString) {
    //print('IS_EXISTANT_NOTE_ON_STRINGED_INSTRUMENT_STRING'
    //    '($note, $stringedInstrumentString)');
    for (int i = 0; i < StringedInstrument.FRETBOARD_LENGTH; i++) {
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

  static List<Note> STRINGED_INSTRUMENT_STRING(Note note) {
    //print('STRINGED_INSTRUMENT_STRING($note)');
    List<Note> stringedInstrumentString = [];
    for (int j = 0; j < StringedInstrument.FRETBOARD_LENGTH; j++) {
      stringedInstrumentString.add(note);
      note.sharpen();
    }
    //print('=> $stringedInstrumentString');
    return stringedInstrumentString;
  }

  String? id;
  Note? indexNote;

  StringedInstrumentString(Note indexNote) {
    this.id = STRINGED_INSTRUMENT_STRING_ID;
    this.indexNote = indexNote;
  }

  Note get getIndexNote => this.indexNote!;
  List<Note> get getScale => STRINGED_INSTRUMENT_STRING(this.indexNote!);

  set setIndexNote(Note note) => this.indexNote = note;

  bool isNoteOnGuitarString(Note note) =>
      IS_EXISTANT_NOTE_ON_STRINGED_INSTRUMENT_STRING(note, this) != -1;

  int noteExistsAtFret(Note note) =>
      IS_EXISTANT_NOTE_ON_STRINGED_INSTRUMENT_STRING(note, this);

}