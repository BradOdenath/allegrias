import 'dart:math' as Math;
import 'dart:math';

import 'package:allegrias/music/chordophone/chordophone.dart';
import 'package:allegrias/music/chordophone/'
    'chordophone_string/chordophone_string.dart';
import 'package:allegrias/music/tablature/tab_stanza/tab_stanza.dart';

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
*                               NOTE_TO_FINGERBOARD_COORDINATES
*                               NOTES_TO_FINGERBOARD_COORDINATES_NOTE_MAP
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

void test() {
  /*
  print('CHROMATIC_SCALE: '
      + Note.chromaticScale.toString());
  print('SCALE_PATTERN: '
      + Note.scalePattern.toString());
  print('A4: '
      + Note.A4.toString());
  print('CHROMATIC_SCALE_NOTES: '
      + Note.CHROMATIC_SCALE_NOTES.toString());
  print('MAJOR_SCALE_PATTERN_INDEX: '
      + Note.MAJOR_SCALE_PATTERN_INDEX.toString());
  print('MINOR_SCALE_PATTERN_INDEX: '
      + Note.MINOR_SCALE_PATTERN_INDEX.toString());
  print('DORIAN_SCALE_PATTERN_INDEX: '
      + Note.DORIAN_SCALE_PATTERN_INDEX.toString());
  print('LYDIAN_SCALE_PATTERN_INDEX: '
      + Note.LYDIAN_SCALE_PATTERN_INDEX.toString());

  print('C_MAJOR_SCALE: '
      + Note.C_MAJOR_SCALE.toString());
  print('A4_FREQUENCY: '
      + Note.A4_FREQUENCY.toString());

  //Ionian
  print('MAJOR_SCALE_FROM_NOTE(C):       '
      + Note.MAJOR_SCALE_FROM_NOTE(Note.chromaticScale[0]).toString());
  print('DORIAN_SCALE_FROM_NOTE(D):      '
      + Note.DORIAN_SCALE_FROM_NOTE(Note.chromaticScale[2]).toString());
  print('PHRYGIAN_SCALE_FROM_NOTE(E):    '
      + Note.PHRYGIAN_SCALE_FROM_NOTE(Note.chromaticScale[4]).toString());
  print('LYDIAN_SCALE_FROM_NOTE(F):      '
      + Note.LYDIAN_SCALE_FROM_NOTE(Note.chromaticScale[5]).toString());
  print('MIXOLYDIAN_SCALE_FROM_NOTE(G):  '
      + Note.MIXOLYDIAN_SCALE_FROM_NOTE(Note.chromaticScale[7]).toString());
  //AEOLIAN
  print('MINOR_SCALE_FROM_NOTE(A):       '
      + Note.MINOR_SCALE_FROM_NOTE(Note.chromaticScale[9]).toString());
  print('LOCRIAN_SCALE_FROM_NOTE(B):     '
      + Note.LOCRIAN_SCALE_FROM_NOTE(Note.chromaticScale[11]).toString());

  print('NOTE_INDEX(D#): '
      + Note.NOTE_INDEX(Note.chromaticScale[3]).toString());
  print('SCALE_FROM_NOTE(Lydian, A)'
      + Note.SCALE_FROM_NOTE(
          Note.LYDIAN_SCALE_PATTERN_INDEX,
          Note.A4
      ).toString());
  print('NOTE_INDEX(C#): '
      + Note.NOTE_INDEX(Note.A4.getNote).toString());
  print('A4.getNoteIndex: '
      + Note.A4.getNoteIndex.toString());
  print('NOTE_VALUE(A4): '
      + Note.NOTE_VALUE(Note.A4).toString());

  /// TODO: Fix NOTE_FROM_NOTE_VALUE(frequency) Note: Value reverse.?
  //  print('NOTE_FROM_NOTE_VALUE(A4_FREQEUENCY): '
  //    + Note.NOTE_FROM_NOTE_VALUE(Note.A4_FREQUENCY).toString());

  //Note value does not have an octave; if toString, then octave.
  print('TO_NOTE(A): '
      + Note.TO_NOTE(Note.A4).toString());
  print('TO_NOTES(CHROMATIC_SCALE): '
      + Note.TO_NOTES(Note.chromaticScale).toString());

  print('NOTE_NO_OCTAVE(A4): '
      + Note.NOTE_NO_OCTAVE(Note.A4).toString());
  print('NOTE_CHECK(A4): '
      + Note.NOTE_CHECK(Note.A4).toString());

  /// TODO: Fix B to C Octave Transition
  print('NEXT_NOTE(A4): '
      + Note.NEXT_NOTE(Note.A4).toString());

  print('NOTE_TO_OCTAVAE(A4): '
      + Note.NOTE_TO_OCTAVE(Note.A4).toString());
  print('INCREMENT_NOTE_OCTAVE(A4): '
      + Note.INCREMENT_NOTE_OCTAVE(Note.A4).toString());

  /// TODO: Fix this
  //print('NOTE_TO_FINGERBOARD_COORDINATES(A4): '
  //    + Note.NOTE_TO_FINGERBOARD_COORDINATES(Note.A4).toString());

  /// TODO: Fix this
  //print('NOTE_TO_FINGERBOARD_COORDINATES_NOTE_MAP(C_MAJOR_SCALE): '
  //    + Note.NOTES_TO_FINGERBOARD_COORDINATES_NOTE_MAP(
  //        Note.C_MAJOR_SCALE
  //    ).toString());
  print('Note(A4): '
      + Note(
        noteFrequency: Note.A4.getFrequency,
        noteNote: Note.A4.getNote,
        noteOctave: Note.A4.getOctave
      ).toString());
  print('Note.fromNote(noat): '
      + Note.fromNote(Note.A4).toString());
  print('Note.fromChordophoneString(C#): '
      + Note.fromChordophoneString(Note.chromaticScale[0]).toString());

  print('.toString(): '
      + Note.A4.toString());
  print('.length: '
      + Note.A4.length.toString());

  /// TODO: Fix Recursion
  print('A4==(A5): '
      + (Note.A4==Note.A4.incrementOctave()).toString());

  print('.hashCode: '
      + Note.A4.hashCode.toString());
  print('.getFrequency: '
      + Note.A4.getFrequency.toString());
  print('.setFrequency = A4_FREQUNENCY: '
      + (Note.A4.setFrequency = Note.A4_FREQUENCY).toString());
  print('.getNote: '
      + Note.A4.getNote.toString());
  print('.setNote = Note.A4.getNote: '
      + (Note.A4.setNote = Note.A4.getNote).toString());
  print('.sharpen(): '
      + Note.A4.sharpen().toString());
  print('.getOctave: '
      + Note.A4.getOctave.toString());
  print('.setOctave = Note.A4.getOctave: '
      + (Note.A4.setOctave = Note.A4.getOctave).toString());
  print('.incrementOctave(): '
      + Note.A4.incrementOctave().toString());
  print('A4: '
      + Note.A4.toString());
  print(Note(noteNote: 'B', noteOctave: 1).sharpen());
  */
  /// TODO: Fix SORT_NOTES(notes)
  print('SORT_NOTES(CHROMATIC_SCALE): '
      + Note.SORT_NOTES(Note.CHROMATIC_SCALE_NOTES).toString());

  print(int.tryParse("D#4"[2]));
  print(Note.NOTE_TO_OCTAVE('D#333'));
}

void main() => test();

class Note {

  static const List<String> chromaticScale = [
    //0   1     2     3     4     5     6     7     8     9     10    11
    'C',  'C#', 'D',  'D#', 'E',  'F',  'F#', 'G',  'G#', 'A',  'A#', 'B'

    /// TODO: Fix offsets all over the file
    //'A',  'A#', 'B',  'C',  'C#', 'D',  'D#', 'E',  'F',  'F#', 'G',  'G#'
  ];

  static const List<int> scalePattern = [
  //-12   -11   -10   -9    -8    -7    -6   -5    -4    -3    -2    -1
  //0     1     2     3     4     5     6     7     8     9     10    11
    1,    0,    1,    0,    1,    1,    0,    1,    0,    1,    0,    1
  //H           W           W     H           W           W           W
  ]; //WWHWWWH (Whole & Half Steps) https://www.musictheory.net/lessons/21

  static Note get C0 => Note(
    noteFrequency: C0_FREQUENCY,
    noteNote: chromaticScale[0],
    noteOctave: 0,
  );

  static Note get A4 => Note(
    noteFrequency: A4_FREQUENCY,
    noteNote: chromaticScale[9],
    noteOctave: 4,
  );

  static List<Note> get CHROMATIC_SCALE_NOTES => TO_NOTES(chromaticScale);

  static int get MAJOR_SCALE_PATTERN_INDEX => scalePattern.length-12;

  static int get MINOR_SCALE_PATTERN_INDEX => scalePattern.length-3;

  static int get DORIAN_SCALE_PATTERN_INDEX => scalePattern.length-10;

  static int get PHRYGIAN_SCALE_PATTERN_INDEX => scalePattern.length-8;

  static int get LOCRIAN_SCALE_PATTERN_INDEX => scalePattern.length-1;

  static int get LYDIAN_SCALE_PATTERN_INDEX => scalePattern.length-7;

  static int get MIXOLYDIAN_SCALE_PATTERN_INDEX => scalePattern.length-5;

  static List<Note> get C_MAJOR_SCALE =>
      MAJOR_SCALE_FROM_NOTE(chromaticScale[chromaticScale.length-12]);

  static double get A4_FREQUENCY => (440.0);
  static double get C0_FREQUENCY => (16.35);

  static List<Note> MAJOR_SCALE_FROM_NOTE(note) =>
      SCALE_FROM_NOTE(MAJOR_SCALE_PATTERN_INDEX, note);

  static List<Note> MINOR_SCALE_FROM_NOTE(note) =>
      SCALE_FROM_NOTE(MINOR_SCALE_PATTERN_INDEX, note);

  static List<Note> DORIAN_SCALE_FROM_NOTE(note) =>
      SCALE_FROM_NOTE(DORIAN_SCALE_PATTERN_INDEX, note);

  static List<Note> PHRYGIAN_SCALE_FROM_NOTE(note) =>
      SCALE_FROM_NOTE(PHRYGIAN_SCALE_PATTERN_INDEX, note);

  static List<Note> LYDIAN_SCALE_FROM_NOTE(note) =>
      SCALE_FROM_NOTE(LYDIAN_SCALE_PATTERN_INDEX, note);

  static List<Note> MIXOLYDIAN_SCALE_FROM_NOTE(note) =>
      SCALE_FROM_NOTE(MIXOLYDIAN_SCALE_PATTERN_INDEX, note);

  static List<Note> LOCRIAN_SCALE_FROM_NOTE(note) =>
      SCALE_FROM_NOTE(LOCRIAN_SCALE_PATTERN_INDEX, note);

  static List<Note> SORT_NOTES(List<Note> notes) {
    print('SORT_NOTES($notes)');
    List<Note> outNotes = notes;
    outNotes.sort((a,b) => a.getFrequency.compareTo(b.getFrequency));
    //outNotes = List.from(outNotes.reversed);
    print('=> $outNotes');
    return outNotes;
  }

  static List<Note> SCALE_FROM_NOTE(int patternIndex, note) {
    //print('SCALE_FROM_NOTE($patternIndex,$note)');
    List<Note> scale = [];
    if (note != null) {
      Note focusNote = (note is Note) ? (note) : (TO_NOTE(note));
      //int noteOctave = NOTE_TO_OCTAVE(note);
      //int startIndex = NOTE_INDEX(note)!;
      for (int i = patternIndex; i < scalePattern.length; i++) {
        if (scalePattern[i] == 1) {
          scale.add(Note.fromNote(focusNote));
          //print('Added Note: $focusNote, Scale: $scale');
        }
        focusNote = NEXT_NOTE(focusNote);
      }
      for (int i = 0; i < patternIndex; i++) {
        if (scalePattern[i] == 1) {
          scale.add(Note.fromNote(focusNote));
          //print('Added Note: $focusNote, Scale: $scale');
        }
        focusNote = NEXT_NOTE(focusNote);
      }
    }
    // TODO: Add or Remove this line
    scale.add(scale[0]);
    //print('$scale');
    return scale;
  }

  static int? NOTE_INDEX(note) {
    //print('NOTE_INDEX($note)');
    for (int i = 0; i < chromaticScale.length; i++) {
      if (chromaticScale[i] == NOTE_NO_OCTAVE(note)) {
        return i;
      }
    }
  }
  int get getNoteIndex => NOTE_INDEX(this)!;

  static Note TO_NOTE(note) {
    // print('$TO_NOTE($note)');
    if (note is Note) return note;
    Note outNote = Note(
        noteNote: NOTE_NO_OCTAVE(note),
        noteOctave: NOTE_TO_OCTAVE(note));
    //print('=> $outNote');
    return outNote;
  }

  static List<Note> TO_NOTES(List<String> strNotes) {
    //print('TO_NOTES($strNotes)');
    List<Note> noteList = [];
    for (String strNote in strNotes) {
      noteList.add(TO_NOTE(strNote));
    }
    //print('=> $noteList');
    return noteList;
  }

  static double frequency(n) =>
      (C0.noteFrequency!
          *pow(2,(n/12)));

  static int n(frequency) =>
      (17.3123*log(0.06116207951070336*frequency)).round();

  static Note getNoteFromIndex(int index) {
    int trueIndex = (index+1);

    int octave = (
        trueIndex/chromaticScale.length
    ).floor();

    int noteIndex = ((
        trueIndex%chromaticScale.length
    )-1);

    Note outNote = Note(
        noteFrequency: frequency(index),
        noteOctave: octave,
        noteNote: chromaticScale[noteIndex]
    );

    return (outNote);
  }

  static Note getNoteFromFrequency(frequency) {
    int index = n(frequency);
    print("index: $index");
    Note note = getNoteFromIndex(index);
    return(note);
  }

  // Note Frequencies: https://pages.mtu.edu/~suits/notefreqs.html
  /*
  static double NOTE_TO_FREQUENCY(note) {
    double noteVal = NOTE_VALUE(NOTE_CHECK(note));
    return (A4.getFrequency*noteVal/A4.getNoteValue);
  }
  */

  static String NOTE_NO_OCTAVE(note) {
    //print('NOTE_NO_OCTAVE($note)');
    if (note is String) {
      return note.replaceAll(
          NOTE_TO_OCTAVE(note).toString(),
          ''
      );
    } else if (note is Note) {
      return note.getNote;
    }
    //print('=> $note');
    return note;
  }

  static Note NOTE_CHECK(note) => (note is Note) ? note : TO_NOTE(note);

  static Note NEXT_NOTE(note) {
    Note focusNote = Note.fromNote(NOTE_CHECK(note));
    //print("IN: $focusNote");
    for (int i = 0; i < chromaticScale.length; i++) {
      if (chromaticScale[i] == focusNote.getNote) {
        focusNote.setNote = (i == (chromaticScale.length-1)) ?
          chromaticScale[0] : chromaticScale[i+1];
        break;
      }
    }
    //print("OUT: $focusNote");
    if (focusNote.getNote == chromaticScale[0]) {
      focusNote.incrementOctave();
    }
    return focusNote;
  }

  static int NOTE_TO_OCTAVE(note) {
    //print('NOTE_TO_OCTAVE($note)');
    if (note is String) {
      int octaveInt;
      String octaveString = '';
      for (int i = note.length-1; i > 0; i--) {
        var numberCheck = int.tryParse(note[i]);
        if (numberCheck != null) {
          octaveString = (note[i] + octaveString);
        } else {
          break;
        }
      }
      octaveInt = ((octaveString != '')
          ? int.parse(octaveString)
          : (0));
      return (octaveInt);
    } else if (note is Note) {
      //print('=> '+note.getOctave.toString());
      return note.getOctave;
    }
    //print('=> 0');
    return 0;
  }

  static Note INCREMENT_NOTE_OCTAVE(note) =>
      NOTE_CHECK(note)..setOctave = (note.getOctave+1);

  static Map<int,int> NOTE_TO_FINGERBOARD_COORDINATES(
      Chordophone chordophone, Note note)
  {
    //print('NOTE_TO_FINGERBOARD_COORDINATES($note)');
    Map<int,int>? noteCoordinates;
    for (
    int i = 0;
    i < Chordophone.CHORDOPHONE_STRING_COUNT;
    i++
    ) {
      if (chordophone
          .chordophone_strings![i]
          .isNoteOnChordophoneString(note) == true
      ) {
        noteCoordinates!.addAll(
            {i:chordophone
                .chordophone_strings![i]
                .noteExistsAtPosition(note)
            });
      } else {
      }
    }
    //print('=> $noteCoordinates');
    return noteCoordinates!;
  }

  static Map<Note, Map<int, int>> NOTES_TO_FINGERBOARD_COORDINATES_NOTE_MAP(
      Chordophone chordophone,
      List<Note> notes)
  {
    //print('NOTE_TO_FINGERBOARD_COORDINATES_NOTE_MAP($notes)');
    Map<Note,Map<int,int>> outCoordinates = {};
    if (notes != null) {
      for (Note note in notes) {
        outCoordinates.addAll({
          note:NOTE_TO_FINGERBOARD_COORDINATES(chordophone, note)
        });
      }
    }
    //print('=> $outCoordinates');
    return outCoordinates;
  }

  double? noteFrequency;
  String? noteNote;
  int? noteOctave;

  Note({
    this.noteFrequency,
    this.noteNote,
    this.noteOctave
  });

  Note.fromNote(Note noat) {
    this.noteNote = noat.noteNote;
    this.noteOctave = noat.noteOctave;
    this.noteFrequency = noat.noteFrequency;
  }

  Note.fromChordophoneString(String noat) {
    Note note = TO_NOTE(noat);
    this.noteOctave = note.noteOctave!;
    this.noteNote = note.noteNote!;
  }

  Note.fromFrequency(double frequency) {
    Note note = getNoteFromFrequency(frequency);
    this.noteFrequency = note.getFrequency;
    this.noteNote = note.getNote;
    this.noteOctave = note.getOctave;
  }

  @override
  String toString() =>
      '$noteNote$noteOctave';

  String toDisplayString() =>
      '$noteNote$noteOctave'
          ' ($noteFrequency)';

  int get length =>
      toString().length;

  @override
  bool operator ==(Object other) =>
      (toString() == NOTE_CHECK(other).toString())
          ? (true)
          : (false);

  @override
  // TODO: implement hashCode
  int get hashCode => super.hashCode;

  double get getFrequency =>
      (noteFrequency != null) ? noteFrequency! : (0.0);
  set setFrequency(double frequency) => noteFrequency = frequency;

  String get getNote => noteNote!;
  set setNote(String note) => noteNote = note;
  Note sharpen() => NEXT_NOTE(this);

  int get getOctave => noteOctave!;
  set setOctave(int octave) => noteOctave = octave;
  Note incrementOctave() =>
    INCREMENT_NOTE_OCTAVE(this);

}