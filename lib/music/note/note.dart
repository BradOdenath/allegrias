import 'dart:math' as Math;

import 'package:allegrias/music/guitar/stringed_instrument.dart';
import 'package:allegrias/music/guitar/guitar_string/stringed_instrument_string.dart';
import 'package:allegrias/music/tabulature/tab_stanza/tab_stanza.dart';

/*  Class:  Note
*     Static
*       Attributes
*         const List<String>    CHROMATIC_SCALE
*         const List<int>       SCALE_PATTERN
*         final Note            A4
*       Accessors
*         List<Note>            CHROMATIC_SCALE_NOTES
*         int                   MAJOR_SCALE_PATTERN_INDEX
*         int                   MINOR_SCALE_PATTERN_INDEX
*         List<String>          C_MAJOR_STRNOTE_SCALE
*         double                A4_FREQUENCY
*       Methods
*         List<Note>            SORT_NOTES(notes)
*         List                  MAJOR_SCALE_FROM_NOTE(note)
*         List                  SCALE_FROM_NOTE(index, note)
*         int                   NOTE_INDEX(note)
*                                 Note Index from Chromatic Scale
*         double                NOTE_VALUE(note)
*         Note                  NOTE_FROM_NOTE_VALUE(double)
*         Note                  TO_NOTE
*         List<Notes>           TO_NOTES(List<String> notes)
*         double                FREQUENCY_EQUATION(n)
*         double                NOTE_TO_FREQUENCY(note)
*                               NOTE_NO_OCTAVE
*                               NOTE_TO_OCTAVE
*                               INCREMENT_NOTE_OCTAVE
*                               NEXT_NOTE(note)
*                                 returns next chromatic note
*                               NOTE_TO_FRETBOARD_COORDINATES
*                               NOTES_TO_FRETBOARD_COORDINATES_NOTE_MAP
* -----------------------------------------------------------------------------
*     Constructors
*       Note({})
*       Note.fromString(String note)
* -----------------------------------------------------------------------------
*     Attributes
*       double                  noteFrequency
*       String                  noteNote
*       int                     noteOctave
* -----------------------------------------------------------------------------
*     Accessors
*       int                     length
*                                 toString.length
*       double                  getFrequency
*       String                  getNote
*       int                     getOctave
* -----------------------------------------------------------------------------
*     Mutators
*                               setFrequency(double)
*                               setNote(String)
*                               setOctave(int)
* -----------------------------------------------------------------------------
*     Methods
*       @override String        toString()
*       @override bool          operator ==(Object object)
*       void                    incrementOctave
* */

class Note {

  static const List<String> CHROMATIC_SCALE = [
    'C#', 'D',  'D#', 'E',  'F',  'F#', 'G',  'G#', 'A',  'A#', 'B',  'C'
  ];

  static const List<int> SCALE_PATTERN = [
    0,    1,    0,    1,    1,    0,    1,    0,    1,    0,    1,    1
  ];

  static final Note A4 = Note(
    noteFrequency: A4_FREQUENCY,
    noteNote: CHROMATIC_SCALE[CHROMATIC_SCALE.length-1],
    noteOctave: 4,
  );

  static List<Note> get CHROMATIC_SCALE_NOTES => TO_NOTES(CHROMATIC_SCALE);

  static int get MAJOR_SCALE_PATTERN_INDEX => SCALE_PATTERN.length-1;

  static int get MINOR_SCALE_PATTERN_INDEX => SCALE_PATTERN.length-4;

  static List/*<String>*/ get C_MAJOR_STRNOTE_SCALE =>
      MAJOR_SCALE_FROM_NOTE(CHROMATIC_SCALE[CHROMATIC_SCALE.length-1]);

  static double get A4_FREQUENCY => FREQUENCY_EQUATION(0);

  static List MAJOR_SCALE_FROM_NOTE(note) =>
      SCALE_FROM_NOTE(MAJOR_SCALE_PATTERN_INDEX, note);


  static List<Note> SORT_NOTES(List<Note> notes) {
    //print('SORT_NOTES($notes)');
    List<Note> outNotes = notes;
    outNotes.sort((a,b) => a.getNoteValue.compareTo(b.getNoteValue));
    outNotes = List.from(outNotes.reversed);
    //print('=> $outNotes');
    return outNotes;
  }
  
  static List SCALE_FROM_NOTE(int patternIndex, note) {
    //print('SCALE_FROM_NOTE($patternIndex,$note)');
    List scale = [];
    var focusNote = note;
    if (note != null) {
      int noteOctave = NOTE_TO_OCTAVE(note);
      int startIndex = NOTE_INDEX(note)!;
      for (int i = patternIndex; i < SCALE_PATTERN.length; i++) {
        if (SCALE_PATTERN[i] == 1) {
          scale.add(focusNote);
        }
        focusNote = NEXT_NOTE(focusNote);
      }
      for (int i = 0; i < patternIndex; i++) {
        if (SCALE_PATTERN[i] == 1) {
          scale.add(focusNote);
        }
        focusNote = NEXT_NOTE(focusNote);
      }
    }
    //print('$scale');
    return scale;
  }

  static int? NOTE_INDEX(note) {
    //print('NOTE_INDEX($note)');
    for (int i = 0; i < CHROMATIC_SCALE.length; i++) {
      if (CHROMATIC_SCALE[i] == NOTE_NO_OCTAVE(note)) {
        return i;
      }
    }
  }
  int get getNoteIndex => NOTE_INDEX(this)!;

  static double NOTE_VALUE(note) {
    //print('NOTE_VALUE($note)');
    //Index of StrNote + 1 * .01 * IntOctave
    var out = (((NOTE_INDEX(NOTE_NO_OCTAVE(note))! + 1) * 0.01)
                  + NOTE_TO_OCTAVE(note));
    //print('=> $out');
    return out;
  }
  double get getNoteValue => NOTE_VALUE(this);

  static Note NOTE_FROM_NOTE_VALUE(double value) {
    //print('NOTE_FROM_NOTE_VALUE($value)');
    int noteOctave = (value - value.floor()).toInt();
    int noteIndex = (((value - noteOctave) * 100.0).toInt() - 1);
    Note outNote = Note(noteNote: CHROMATIC_SCALE[noteIndex],
      noteOctave: noteOctave);
    //print('=> $outNote');
    return outNote;
  }

  static Note TO_NOTE(note) {
    // print('$TO_NOTE($note)');
    if (note is Note) return note;
    Note outNote = Note(
        noteNote: NOTE_NO_OCTAVE(note),
        noteOctave: NOTE_TO_OCTAVE(note));
    // print('=> $outNote');
    return outNote;
  }

  static List<Note> TO_NOTES(List<String> strNotes) {
    // print('TO_NOTES($strNotes)');
    List<Note> guitarTuning = [];
    for (String strNote in strNotes) {
      guitarTuning.add(TO_NOTE(strNote));
    }
    // print('=> $guitarTuning');
    return guitarTuning;

  }

  static double FREQUENCY_EQUATION(double n) {
    return (A4.getFrequency*Math.pow(2.0,n/12.0));
  }

  static double NOTE_TO_FREQUENCY(note) {
    double noteVal = (note is Note) ? note.getNoteValue : NOTE_VALUE(note);
    return (A4.getFrequency*noteVal/A4.getNoteValue);
  }

  static String NOTE_NO_OCTAVE(note) {
    //print('NOTE_NO_OCTAVE($note)');
    if (note is String) {
      return note.trimRight();
    } else if (note is Note) {
      return note.getNote;
    }
    //print('=> $note');
    return note;
  }

  static NEXT_NOTE(note) {
    //print('NEXT_NOTE($note)');
    dynamic outNote = '';
    int outNoteOctave = 0;
    if (note != null) {
      outNoteOctave = NOTE_TO_OCTAVE(note);
      for (int i = 0; i < CHROMATIC_SCALE.length; i++) {
        if (NOTE_NO_OCTAVE(note) == CHROMATIC_SCALE[i]) {
          if (i == CHROMATIC_SCALE.length-1) {
            outNote = CHROMATIC_SCALE[0];
            outNoteOctave += 1;
          } else {
            outNote = CHROMATIC_SCALE[i+1];
          }
        }
      }
    }
    // if (outNoteOctave != null)
      outNote += outNoteOctave.toString();

    if (note is Note) {
      outNote = TO_NOTE(outNote);
    }
    //print('=> $outNote');
    return outNote;
  }

  static int NOTE_TO_OCTAVE(note) {
    //print('NOTE_TO_OCTAVE($note)');
    if (note is String) {
      if (note.length > 2) {
        var check = int.parse(note[note.length-1]);
        if (check is int) {
          //print('=> $check');
          return check;
        }
      }
    } else if (note is Note) {
      //print('=> '+note.getOctave.toString());
      return note.getOctave;
    }
    //print('=> 0');
    return 0;
  }

  static INCREMENT_NOTE_OCTAVE(note) {
    //print('INCREMENT_NOTE_OCTAVE($note)');
    if (note is String) {
      TO_NOTE(NOTE_NO_OCTAVE(note)
          +(NOTE_TO_OCTAVE(note)+1).toString());
    } else if (note is Note) {
      note.setOctave = note.getOctave+1;
    }
    //print('=> $note');
    return note;
  }

  static Map<int,int> NOTE_TO_FRETBOARD_COORDINATES(Note note) {
    //print('NOTE_TO_FRETBOARD_COORDINATES($note)');
    Map<int,int>? noteCoordinates;
    for (int i = 0; i < StringedInstrument.STRINGED_INSTRUMENT_STRING_COUNT; i++) {
      //print(i.toString());
      if (StringedInstrument.STRINGED_INSTRUMENT_STRINGS[i].isNoteOnGuitarString(note) == true) {
        // print('\ttT$note');
        noteCoordinates!.addAll({i:StringedInstrument.STRINGED_INSTRUMENT_STRINGS[i].noteExistsAtFret(note)});
      } else {
        // print('\ttF$note');
      }
    }
    //print('=> $noteCoordinates');
    return noteCoordinates!;
  }

  static Map<Note, Map<int, int>> NOTES_TO_FRETBOARD_COORDINATES_NOTE_MAP(List<Note> notes) {
    //print('NOTE_TO_FRETBOARD_COORDINATES_NOTE_MAP($notes)');
    Map<Note,Map<int,int>> outCoordinates = {};
    if (notes != null) {
      for (Note note in notes) {
        outCoordinates.addAll({note:NOTE_TO_FRETBOARD_COORDINATES(note)});
      }
    }
    //print('=> $outCoordinates');
    return outCoordinates;
  }
  
  double? noteFrequency;
  String? noteNote;
  int? noteOctave;
  
  Note({this.noteFrequency, this.noteNote, this.noteOctave});

  Note.fromString(String inote) {
    Note note = TO_NOTE(inote)!;
    this.noteOctave = note.noteOctave!;
    this.noteNote = note.noteNote!;
  }

  @override
  String toString() {
    return '$noteNote$noteOctave';
  }

  int get length => toString().length;

  @override
  bool operator ==(Object other) {
    if (other is String) {
      return (toString() == other);
    } else {
      return (this == other);
    }
  }

  double get getFrequency => noteFrequency!;
  set setFrequency(double frequency) => noteFrequency = frequency;

  String get getNote => noteNote!;
  set setNote(String note) => noteNote = note;
  void sharpen() => NEXT_NOTE(this);

  int get getOctave => noteOctave!;
  set setOctave(int octave) => noteOctave = octave;
  void incrementOctave() {
    INCREMENT_NOTE_OCTAVE(this);
  }

}
