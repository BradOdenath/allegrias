import 'dart:math';
import 'package:allegrias/music/chordophone/chordophone.dart';

void test() {
  print("TODO: assert()");
  print(Note.frequencyFromMidiIndex(0));
  print(Note.midiIndexFromFrequency(Note.C0_FREQUENCY));
}
void main() => test();

class Note {
  // Half Step Notes in Chromatic Order
  static const List<String> CHROMATIC_SCALE = [
    //0    1
    'C',  'C#',
    //2    3
    'D',  'D#',
    //4
    'E',
    //5    6
    'F',  'F#',
    //7    8
    'G',  'G#',
    //9    10
    'A',  'A#',
    //11
    'B'
  ];

  // Scale Pattern of Whole and Half Steps
  // Based on the Major Scale Pattern
  // Represented with Binary Bits
  // WWHWWWH (Whole & Half Steps) https://www.musictheory.net/lessons/21
  static const List<int> SCALE_PATTERN = [
  //-12   -11   -10   -9    -8    -7    -6   -5    -4    -3    -2    -1
  //0     1     2     3     4     5     6     7     8     9     10    11
    1,    0,    1,    0,    1,    1,    0,    1,    0,    1,    0,    1
  //H           W           W     H           W           W           W
  ];

  // Frequency for Note C0
  static const double C0_FREQUENCY = (16.35);

  // Object for Note C0
  // footnote: non_modifiable as if const
  // ignore: non_constant_identifier_names
  static Note get C0 => Note(
    noteFrequency: C0_FREQUENCY,
    noteNote: CHROMATIC_SCALE[0],
    noteOctave: 0,
  );

  // Object List of Octave 0 Notes
  // footnote: non_modifiable as if const
  // ignore: non_constant_identifier_names
  static List<Note> get CHROMATIC_SCALE_NOTES =>
      (toNotes(CHROMATIC_SCALE));

  // footnote: Scale pattern index
  // Offset by -1 for octave detection
  // (Octave increases every C note)

  // Major/Ionian Scale Pattern Index
  // footnote: non_modifiable as if const
  // ignore: non_constant_identifier_names
  static int get MAJOR_SCALE_PATTERN_INDEX =>
      (SCALE_PATTERN.length-12);

  // Minor/Aeolian Scale Pattern Index
  // footnote: non_modifiable as if const
  // ignore: non_constant_identifier_names
  static int get MINOR_SCALE_PATTERN_INDEX =>
      (SCALE_PATTERN.length-3);

  // footnote: non_modifiable as if const
  // ignore: non_constant_identifier_names
  static int get DORIAN_SCALE_PATTERN_INDEX =>
      (SCALE_PATTERN.length-10);

  // footnote: non_modifiable as if const
  // ignore: non_constant_identifier_names
  static int get PHRYGIAN_SCALE_PATTERN_INDEX =>
      (SCALE_PATTERN.length-8);

  // footnote: non_modifiable as if const
  // ignore: non_constant_identifier_names
  static int get LOCRIAN_SCALE_PATTERN_INDEX =>
      (SCALE_PATTERN.length-1);

  // footnote: non_modifiable as if const
  // ignore: non_constant_identifier_names
  static int get LYDIAN_SCALE_PATTERN_INDEX =>
      (SCALE_PATTERN.length-7);

  // footnote: non_modifiable as if const
  // ignore: non_constant_identifier_names
  static int get MIXOLYDIAN_SCALE_PATTERN_INDEX =>
      (SCALE_PATTERN.length-5);

  // footnote: non_modifiable as if const
  // ignore: non_constant_identifier_names
  static List<Note> get C_MAJOR_SCALE =>
      (MAJOR_SCALE_FROM_NOTE(
          scaleFromNote(
            MAJOR_SCALE_PATTERN_INDEX,
            C0.getNote
          )));

  // footnote: non_modifiable as if const
  // ignore: non_constant_identifier_names
  static List<Note> MAJOR_SCALE_FROM_NOTE(note) =>
      (scaleFromNote(MAJOR_SCALE_PATTERN_INDEX, note));

  // footnote: non_modifiable as if const
  // ignore: non_constant_identifier_names
  static List<Note> MINOR_SCALE_FROM_NOTE(note) =>
      (scaleFromNote(MINOR_SCALE_PATTERN_INDEX, note));

  // footnote: non_modifiable as if const
  // ignore: non_constant_identifier_names
  static List<Note> DORIAN_SCALE_FROM_NOTE(note) =>
      (scaleFromNote(DORIAN_SCALE_PATTERN_INDEX, note));

  // footnote: non_modifiable as if const
  // ignore: non_constant_identifier_names
  static List<Note> PHRYGIAN_SCALE_FROM_NOTE(note) =>
      (scaleFromNote(PHRYGIAN_SCALE_PATTERN_INDEX, note));

  // footnote: non_modifiable as if const
  // ignore: non_constant_identifier_names
  static List<Note> LYDIAN_SCALE_FROM_NOTE(note) =>
      (scaleFromNote(LYDIAN_SCALE_PATTERN_INDEX, note));

  // footnote: non_modifiable as if const
  // ignore: non_constant_identifier_names
  static List<Note> MIXOLYDIAN_SCALE_FROM_NOTE(note) =>
      (scaleFromNote(MIXOLYDIAN_SCALE_PATTERN_INDEX, note));

  // footnote: non_modifiable as if const
  // ignore: non_constant_identifier_names
  static List<Note> LOCRIAN_SCALE_FROM_NOTE(note) =>
      (scaleFromNote(LOCRIAN_SCALE_PATTERN_INDEX, note));

  static List<Note> sortNotes(List<Note> notes) {
    List<Note> outNotes = (notes);
    outNotes.sort((a,b) => a
        .getFrequency
        .compareTo(b.getFrequency)
    );
    return (outNotes);
  }

  static List<Note> scaleFromNote(int patternIndex, note) {
    List<Note> scale = [];
    Note focusNote = ((note is Note)
        ? (note)
        : (toNote(note))
    );
    for (int i = patternIndex; i < SCALE_PATTERN.length; i++) {
      if (SCALE_PATTERN[i] == 1) {
        scale.add(Note.fromNote(focusNote));
      }
      focusNote = nextNote(focusNote);
    }
    for (int i = 0; i < patternIndex; i++) {
      if (SCALE_PATTERN[i] == 1) {
        scale.add(Note.fromNote(focusNote));
      }
      focusNote = (nextNote(focusNote));
    }
    scale.add(scale[0]); // 7 Note Scale is 8 Note Scale (H)
    return (scale);
  }

  static int chromaticScaleIndex(note) =>
      CHROMATIC_SCALE.indexOf(toNote(note).getNote);

  static Note toNote(note) {
    if (note is Note) return note; // Silly Goose
    Note outNote = Note(
        noteNote: noteNoOctave(note),
        noteOctave: noteToOctave(note));
    return (outNote);
  }

  static List<Note> toNotes(List<String> strNotes) {
    List<Note> noteList = [];
    for (String strNote in strNotes) {
      noteList.add(toNote(strNote));
    }
    return (noteList);
  }

  static double frequencyFromMidiIndex(n) =>
      (C0.noteFrequency! * pow(2,(n/12)));

  static int midiIndexFromFrequency(frequency) =>
      (17.3123*log(0.06116207951070336*frequency)).round();

  static int midiIndexFromNote(note) {
    Note _note = toNote(note);
    int index = (
        ((_note.getChromaticScaleIndex + 1)
            * (_note.getOctave + 1)) - (1)
    );
    return (index);
  }

  static double frequencyFromNote(note) =>
      (frequencyFromMidiIndex(midiIndexFromNote(note)));

  static Note noteFromMidiIndex(int index) {
    int trueIndex = (index+1);
    int octave = ((trueIndex/CHROMATIC_SCALE.length).floor());
    int noteIndex = (trueIndex%CHROMATIC_SCALE.length);
    Note outNote = Note(
        noteFrequency: (frequencyFromMidiIndex(index)),
        noteOctave: (octave),
        noteNote: (CHROMATIC_SCALE[noteIndex])
    );
    return (outNote);
  }

  static Note noteFromFrequency(frequency) =>
      (noteFromMidiIndex(midiIndexFromFrequency(frequency)));

  static String noteNoOctave(note) {
    //print('NOTE_NO_OCTAVE($note)');
    if (note is String) {
      return note.replaceAll(
          noteToOctave(note).toString(),
          ''
      );
    } else if (note is Note) {
      return note.getNote;
    }
    //print('=> $note');
    return (note);
  }

  static Note nextNote(note) {
    Note focusNote = Note.fromNote(toNote(note));
    for (int i = 0; i < CHROMATIC_SCALE.length; i++) {
      if (CHROMATIC_SCALE[i] == focusNote.getNote) {
        focusNote.setNote = (i == (CHROMATIC_SCALE.length-1)) ?
          CHROMATIC_SCALE[0] : CHROMATIC_SCALE[i+1];
        break;
      }
    }
    if (focusNote.getNote == CHROMATIC_SCALE[0]) {
      focusNote.incrementOctave();
    }
    return (focusNote);
  }

  static int noteToOctave(note) {
    //print('NOTE_TO_OCTAVE($note)');
    if (note is String) {
      int octaveInt;
      String octaveString = ('');
      for (int i = (note.length-1); (i > 0); i--) {
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
    return (0);
  }

  static Note incrementNoteOctave(note) =>
      (toNote(note)..setOctave = (note.getOctave+1));

  static Map<int,int> fingerboardCoordinates(
      Chordophone chordophone, Note note)
  {
    Map<int,int>? noteCoordinates;
    for (
    int i = 0;
    (i < Chordophone.chordophoneStringCount);
    i++
    ) {
      if (chordophone
          .getStrings![i]
          .noteExistsOnString(note)
      ) {
        noteCoordinates!.addAll(
            {i:chordophone
                .getStrings![i]
                .noteExistsAtPosition(note)
            });
      } else {
      }
    }
    return (noteCoordinates!);
  }

  static Map<Note, Map<int, int>> notesToFingerboardCoordinates(
      Chordophone chordophone,
      List<Note> notes)
  {
    Map<Note,Map<int,int>> outCoordinates = {};
    for (Note note in notes) {
      outCoordinates.addAll({
        note:fingerboardCoordinates(chordophone, note)
      });
    }
    return (outCoordinates);
  }

  double? noteFrequency;
  String? noteNote;
  int? noteOctave;

  Note({
    this.noteFrequency,
    this.noteNote,
    this.noteOctave
  });

  Note.fromNote(Note note) {
    this.noteNote = (note.noteNote);
    this.noteOctave = (note.noteOctave);
    this.noteFrequency = (note.noteFrequency);
  }

  Note.fromNoteString(String note) {
    Note _note = (toNote(note));
    this.noteOctave = (_note.noteOctave!);
    this.noteNote = (_note.noteNote!);
  }

  Note.fromFrequency(double frequency) {
    Note note = (noteFromFrequency(frequency));
    this.noteFrequency = (note.getFrequency);
    this.noteNote = (note.getNote);
    this.noteOctave = (note.getOctave);
  }

  Note sharpen() => (nextNote(this));

  Note incrementOctave() => (incrementNoteOctave(this));

  String toStringFrequency() =>
      (this.toString() + ' ($noteFrequency)');

  @override
  String toString() => ('$noteNote$noteOctave');

  @override
  bool operator == (Object other) =>
      (toString() == toNote(other).toString());

  // Accessors

  @override
  // TODO: implement hashCode
  int get hashCode => (super.hashCode);

  int get length => (toString().length);

  double get getFrequency =>
      (noteFrequency != null)
          ? (noteFrequency!)
          : (0.0);

  String get getNote => (noteNote!);

  int get getOctave => (noteOctave!);

  int get getChromaticScaleIndex =>
      (chromaticScaleIndex(this));

  // Mutators

  set setFrequency(double frequency) => noteFrequency = (frequency);

  set setNote(String note) => noteNote = (note);

  set setOctave(int octave) => noteOctave = (octave);

}