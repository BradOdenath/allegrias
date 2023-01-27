import 'dart:math';
import 'package:allegrias/commons.dart';
import 'package:allegrias/music/chordophone/chordophone.dart';

void test() {
  print(Note.CHROMATIC_SCALE.toString());
  print(Note.SCALE_PATTERN.toString());
  print(Note.C0_FREQUENCY.toString());
  print(Note.C0.toString());
  print(Note.CHROMATIC_SCALE_NOTES.toString());
  print(Note.MAJOR_SCALE_PATTERN_INDEX.toString());
  print(Note.MINOR_SCALE_PATTERN_INDEX.toString());
  print(Note.DORIAN_SCALE_PATTERN_INDEX.toString());
  print(Note.LOCRIAN_SCALE_PATTERN_INDEX.toString());
  print(Note.LYDIAN_SCALE_PATTERN_INDEX.toString());
  print(Note.MIXOLYDIAN_SCALE_PATTERN_INDEX.toString());
  print('Note.C_MAJOR_SCALE: ' + Note.C_MAJOR_SCALE.toString());
  print(Note.MAJOR_SCALE_FROM_NOTE(Note.CHROMATIC_SCALE_NOTES[0]).toString());
  print(Note.MINOR_SCALE_FROM_NOTE(Note.CHROMATIC_SCALE_NOTES[1]).toString());
  print(Note.DORIAN_SCALE_FROM_NOTE(Note.CHROMATIC_SCALE_NOTES[2]).toString());
  print(Note.PHRYGIAN_SCALE_FROM_NOTE(Note.CHROMATIC_SCALE_NOTES[3]).toString());
  print(Note.LYDIAN_SCALE_FROM_NOTE(Note.CHROMATIC_SCALE_NOTES[4]).toString());
  print(Note.MIXOLYDIAN_SCALE_FROM_NOTE(Note.CHROMATIC_SCALE_NOTES[5]).toString());
  print(Note.LOCRIAN_SCALE_FROM_NOTE(Note.CHROMATIC_SCALE_NOTES[6]).toString());
  print(Note.sortNotes(Note.C_MAJOR_SCALE).toString());
  print(Note.scaleFromNote(5,Note.CHROMATIC_SCALE_NOTES[3]));
  print(Note.frequencyFromMidiIndex(0));
  print(Note.midiIndexFromFrequency(Note.C0_FREQUENCY));
  print("TODO: assert()");
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
    print_debug('Note.sortNotes($notes) => $outNotes');
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
    print_debug('Note.scaleFromNote($patternIndex,$note) => $scale');
    return (scale);
  }

  static int chromaticScaleIndex(note) {
    int out = CHROMATIC_SCALE.indexOf(toNote(note).getNote);
    print_debug('Note.chromaticScaleIndex($note) => $out');
    return (out);
  }

  static Note toNote(note) {
    if (note is Note) return note; // Silly Goose
    Note outNote = Note(
        noteNote: noteNoOctave(note),
        noteOctave: noteToOctave(note));
    print_debug('Note.toNote($note) => $outNote');
    return (outNote);
  }

  static List<Note> toNotes(List<String> strNotes) {
    List<Note> noteList = [];
    for (String strNote in strNotes) {
      noteList.add(toNote(strNote));
    }
    print_debug('Note.toNotes($strNotes) => $noteList');
    return (noteList);
  }

  static double frequencyFromMidiIndex(n) {
    double out = (C0.noteFrequency! * pow(2, (n / 12)));
    print_debug('Note.frequencyFromMidiIndex($n) => $out');
    return (out);
  }

  static int midiIndexFromFrequency(frequency) {
    int out = (17.3123 * log(0.06116207951070336 * frequency)).round();
    print_debug('Note.midiIndexFromFrequency($frequency) => out');
    return (out);
  }

  static int midiIndexFromNote(note) {
    Note _note = toNote(note);
    int index = (
        ((_note.getChromaticScaleIndex + 1)
            * (_note.getOctave + 1)) - (1)
    );
    print_debug('Note.midiIndexFromNote($note) => $index');
    return (index);
  }

  static double frequencyFromNote(note) {
    double out = (frequencyFromMidiIndex(midiIndexFromNote(note)));
    print_debug('Note.frequencyFromNote($note) => $out');
    return (out);
  }

  static Note noteFromMidiIndex(int index) {
    int trueIndex = (index+1);
    int octave = ((trueIndex/CHROMATIC_SCALE.length).floor());
    int noteIndex = (trueIndex%CHROMATIC_SCALE.length);
    Note outNote = Note(
        noteFrequency: (frequencyFromMidiIndex(index)),
        noteOctave: (octave),
        noteNote: (CHROMATIC_SCALE[noteIndex])
    );
    print_debug('Note.noteFromMidiIndex($index) => $outNote');
    return (outNote);
  }

  static Note noteFromFrequency(frequency) {
    Note out = (noteFromMidiIndex(midiIndexFromFrequency(frequency)));
    print_debug('Note.noteFromFrequency($frequency) => $out');
    return (out);
  }

  static String noteNoOctave(note) {
    String out = note;
    if (note is String) {
      out = note.replaceAll(
          noteToOctave(note).toString(),
          ''
      );
    } else if (note is Note) {
      out = note.getNote;
    }
    print('Note.noteNoOctave($note) => $out');
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
    print('Note.nextNote($note) => $focusNote');
    return (focusNote);
  }

  static int noteToOctave(note) {
    int out = (0);
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
      out = (octaveInt);
    } else if (note is Note) {
      out = note.getOctave;
    }
    print('Note.noteToOctave($note) => $out');
    return (out);
  }

  static Note incrementNoteOctave(note) {
    Note out = (toNote(note)..setOctave = (note.getOctave + 1));
    print_debug('Note.incrementNoteOctave($note) => $out');
    return (out);
  }

  static Map<int,int> fingerboardCoordinates(
      Chordophone chordophone, Note note)
  {
    Map<int,int>? noteCoordinates;
    for (int i = 0; (i < Chordophone.chordophoneStringCount); i++) {
      if (chordophone.getStrings![i].noteExistsOnString(note)) {
        noteCoordinates!.addAll(
            {i: chordophone
                .getStrings![i]
                .noteExistsAtPosition(note)
            });
      }
    }
    print_debug('Note.fingerboardCoordinates($chordophone,$note)'
        ' => $noteCoordinates');
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
    print_debug('Note.notesToFingerboardCoordinates($chordophone,$notes)'
        ' => $outCoordinates');
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
  bool operator == (Object other) {
    bool out = (toString() == toNote(other).toString());
    print_debug('Note ==($other) => $out');
    return (out);
  }

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