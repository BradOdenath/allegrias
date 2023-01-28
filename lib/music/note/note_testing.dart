import 'package:allegrias/commons.dart';
import 'package:allegrias/music/chordophone/chordophone.dart';
import 'package:allegrias/music/note/note.dart';

// ignore: non_constant_identifier_names
void test_note() {
  print_test('Note.CHROMATIC_SCALE => ' + Note.CHROMATIC_SCALE.toString());

  print_test('Note.SCALE_PATTERN => ' + Note.SCALE_PATTERN.toString());

  print_test('Note.C0_FREQUENCY => ' + Note.C0_FREQUENCY.toString());

  print_test('Note.C0 => ' + Note.C0.toString());

  print_test('Note.CHROMATIC_SCALE_NOTES => '
      + Note.CHROMATIC_SCALE_NOTES.toString());

  print_test('Note.MAJOR_SCALE_PATTERN_INDEX => '
      + Note.MAJOR_SCALE_PATTERN_INDEX.toString());

  print_test('Note.MINOR_SCALE_PATTERN_INDEX => '
      + Note.MINOR_SCALE_PATTERN_INDEX.toString());

  print_test('Note.DORIAN_SCALE_PATTERN_INDEX => '
      + Note.DORIAN_SCALE_PATTERN_INDEX.toString());

  print_test('Note.PHRYGIAN_SCALE_PATTERN_INDEX => '
      + Note.PHRYGIAN_SCALE_PATTERN_INDEX.toString());

  print_test('Note.LOCRIAN_SCALE_PATTERN_INDEX => '
      + Note.LOCRIAN_SCALE_PATTERN_INDEX.toString());

  print_test('Note.LYDIAN_SCALE_PATTERN_INDEX => '
      + Note.LYDIAN_SCALE_PATTERN_INDEX.toString());

  print_test('Note.MIXOLYDIAN_SCALE_PATTERN_INDEX => '
      + Note.MIXOLYDIAN_SCALE_PATTERN_INDEX.toString());

  print_test('Note.C_MAJOR_SCALE => ' + Note.C_MAJOR_SCALE.toString());

  print_test('Note.MAJOR_SCALE_FROM_NOTE('
      + Note.CHROMATIC_SCALE_NOTES[0].toString() + ') => '
      + Note.MAJOR_SCALE_FROM_NOTE(
          Note.CHROMATIC_SCALE_NOTES[0]).toString());

  print_test('Note.MINOR_SCALE_FROM_NOTE('
      + Note.CHROMATIC_SCALE_NOTES[1].toString() + ') => '
      + Note.MINOR_SCALE_FROM_NOTE(
          Note.CHROMATIC_SCALE_NOTES[1]).toString());

  print_test('Note.DORIAN_SCALE_FROM_NOTE('
      + Note.CHROMATIC_SCALE_NOTES[2].toString() + ') => '
      + Note.DORIAN_SCALE_FROM_NOTE(
          Note.CHROMATIC_SCALE_NOTES[2]).toString());

  print_test('Note.PHRYGIAN_SCALE_FROM_NOTE('
      + Note.CHROMATIC_SCALE_NOTES[3].toString() + ') => '
      + Note.PHRYGIAN_SCALE_FROM_NOTE(
          Note.CHROMATIC_SCALE_NOTES[3]).toString());

  print_test('Note.LYDIAN_SCALE_FROM_NOTE('
      + Note.CHROMATIC_SCALE_NOTES[4].toString() + ') => '
      + Note.LYDIAN_SCALE_FROM_NOTE(
          Note.CHROMATIC_SCALE_NOTES[4]).toString());

  print_test('Note.MIXOLYDIAN_SCALE_FROM_NOTE('
      + Note.CHROMATIC_SCALE_NOTES[5].toString() + ') => '
      + Note.MIXOLYDIAN_SCALE_FROM_NOTE(
          Note.CHROMATIC_SCALE_NOTES[5]).toString());

  print_test('Note.LOCRIAN_SCALE_FROM_NOTE('
      + Note.CHROMATIC_SCALE_NOTES[6].toString() + ') => '
      + Note.LOCRIAN_SCALE_FROM_NOTE(
          Note.CHROMATIC_SCALE_NOTES[6]).toString());

  print_test('Note.sortNotes(Note.C_MAJOR_SCALE) => '
      + Note.sortNotes(Note.C_MAJOR_SCALE).toString());

  print_test('Note.sortNotesBackwards(Note.CHROMATIC_SCALE) => '
      + Note.sortNotesBackwards(Note.CHROMATIC_SCALE).toString());

  print_test('Note.scaleFromNote(5, Note.CHROMATIC_SCALE_NOTES[3]) => '
      + Note.scaleFromNote(5, Note.CHROMATIC_SCALE_NOTES[3]).toString());

  print_test('Note.chromaticScaleIndex(Note.CHROMATIC_SCALE_NOTES[5]) => '
      + Note.chromaticScaleIndex(
          Note.CHROMATIC_SCALE_NOTES[5]).toString());

  print_test('Note.toNote(Note.CHROMATIC_SCALE[3]) => '
      + Note.toNote(Note.CHROMATIC_SCALE[3]).toString());

  print_test('Note.toNotes(Note.CHROMATIC_SCALE) => '
      + Note.toNotes(Note.CHROMATIC_SCALE).toString());

  print_test('Note.frequencyFromMidiIndex(0) => '
      + Note.frequencyFromMidiIndex(0).toString());

  print_test('Note.midiIndexFromFrequency(44) => '
      + Note.midiIndexFromFrequency(44).toString());

  print_test('Note.frequencyFromNote("C#5") => '
      + Note.frequencyFromNote('C#5').toString());

  print_test('Note.noteFromMidiIndex(33) => '
      + Note.noteFromMidiIndex(33).toString());

  print_test('Note.noteFromFrequency(440.0) => '
      + Note.noteFromFrequency(440.0).toString());

  print_test('Note.noteNoOctave(Note.CHROMATIC_SCALE[7]) => '
      + Note.noteNoOctave(Note.CHROMATIC_SCALE[7]).toString());

  print_test('Note.nextNote("B3") => '
      + Note.nextNote("B3").toString());

  print_test('Note.noteToOctave("G#5") => '
      + Note.noteToOctave("G#5").toString());

  print_test('Note.incrementNoteOctave(Note.toNote("A10")) => '
      + Note.incrementNoteOctave(Note.toNote("A10")).toString());

  print_test('Note.fingerboardCoordinates('
      'Chordophone.fromDefaultChordophoneStringTuning(),"C#5") => '
      + Note.fingerboardCoordinates(
          Chordophone.fromStandardGuitarTuning(),
          "C#5").toString());

  print_test('Note.notesToFingerboardCoordinates('
      'Chordophone.fromDefaultChordophoneStringTuning(), '
      '["E4","D#4","B3","G#3","B2","E2"]) => \n\t'
      + Note.notesToFingerboardCoordinates(
          Chordophone.fromStandardGuitarTuning(),
          ["E4","D#4","B3","G#3","B2","E2"]).toString());

  print_test(
      'Note('
          'noteFrequency: Note.C0.getFrequency,'
          'noteNote: Note.C0.getNote,'
          'noteOctave: Note.C0.getOctave'
          ') => ' + Note(
          noteFrequency: Note.C0.getFrequency,
          noteNote: Note.C0.getNote,
          noteOctave: Note.C0.getOctave
      ).toString()
  );

  print_test('Note.fromNote("E3") => '
      + Note.fromNote("E3").toString());

  print_test('Note.fromFrequency(440.0) => '
      + Note.fromFrequency(440.0).toString());

  print_test('Note.C0.sharpen() => '
      + Note.C0.sharpen().toString());

  print_test('Note.C0.incrementOctave() => '
      + Note.C0.incrementOctave().toString());

  print_test('Note.C0.toStringFrequency() => '
      + Note.C0.toStringFrequency());

  print_test('Note.C0.toString() => '
      + Note.C0.toString());

  print_test('Note.C0 == Note.C0 => '
      + (Note.C0 == Note.C0).toString());

  print_test('Note.C0.hashCode => '
      + Note.C0.hashCode.toString());

  print_test('Note.C0.length => '
      + Note.C0.length.toString());

  print_test('Note.C0.getFrequency => '
      + Note.C0.getFrequency.toString());

  print_test('Note.C0.getNote => '
      + Note.C0.getNote.toString());

  print_test('Note.C0.getOctave => '
      + Note.C0.getOctave.toString());

  print_test('Note.C0.getChromaticScaleIndex => '
      + Note.C0.getChromaticScaleIndex.toString());

  print_test("TODO: assert()");
}

void main() => test_note();

class NoteTesting {
  static void test() => test_note();
}