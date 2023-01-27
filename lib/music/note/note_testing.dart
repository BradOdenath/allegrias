import 'package:allegrias/music/chordophone/chordophone.dart';
import 'package:allegrias/music/note/note.dart';

void test() {
  print('Note.CHROMATIC_SCALE => ' + Note.CHROMATIC_SCALE.toString());

  print('Note.SCALE_PATTERN => ' + Note.SCALE_PATTERN.toString());

  print('Note.C0_FREQUENCY => ' + Note.C0_FREQUENCY.toString());

  print('Note.C0 => ' + Note.C0.toString());

  print('Note.CHROMATIC_SCALE_NOTES => '
      + Note.CHROMATIC_SCALE_NOTES.toString());

  print('Note.MAJOR_SCALE_PATTERN_INDEX => '
      + Note.MAJOR_SCALE_PATTERN_INDEX.toString());

  print('Note.MINOR_SCALE_PATTERN_INDEX => '
      + Note.MINOR_SCALE_PATTERN_INDEX.toString());

  print('Note.DORIAN_SCALE_PATTERN_INDEX => '
      + Note.DORIAN_SCALE_PATTERN_INDEX.toString());

  print('Note.PHRYGIAN_SCALE_PATTERN_INDEX => '
      + Note.PHRYGIAN_SCALE_PATTERN_INDEX.toString());

  print('Note.LOCRIAN_SCALE_PATTERN_INDEX => '
      + Note.LOCRIAN_SCALE_PATTERN_INDEX.toString());

  print('Note.LYDIAN_SCALE_PATTERN_INDEX => '
      + Note.LYDIAN_SCALE_PATTERN_INDEX.toString());

  print('Note.MIXOLYDIAN_SCALE_PATTERN_INDEX => '
      + Note.MIXOLYDIAN_SCALE_PATTERN_INDEX.toString());

  print('Note.C_MAJOR_SCALE => ' + Note.C_MAJOR_SCALE.toString());

  print('Note.MAJOR_SCALE_FROM_NOTE('
      + Note.CHROMATIC_SCALE_NOTES[0].toString() + ') => '
      + Note.MAJOR_SCALE_FROM_NOTE(
          Note.CHROMATIC_SCALE_NOTES[0]).toString());

  print('Note.MINOR_SCALE_FROM_NOTE('
      + Note.CHROMATIC_SCALE_NOTES[1].toString() + ') => '
      + Note.MINOR_SCALE_FROM_NOTE(
          Note.CHROMATIC_SCALE_NOTES[1]).toString());

  print('Note.DORIAN_SCALE_FROM_NOTE('
      + Note.CHROMATIC_SCALE_NOTES[2].toString() + ') => '
      + Note.DORIAN_SCALE_FROM_NOTE(
          Note.CHROMATIC_SCALE_NOTES[2]).toString());

  print('Note.PHRYGIAN_SCALE_FROM_NOTE('
      + Note.CHROMATIC_SCALE_NOTES[3].toString() + ') => '
      + Note.PHRYGIAN_SCALE_FROM_NOTE(
          Note.CHROMATIC_SCALE_NOTES[3]).toString());

  print('Note.LYDIAN_SCALE_FROM_NOTE('
      + Note.CHROMATIC_SCALE_NOTES[4].toString() + ') => '
      + Note.LYDIAN_SCALE_FROM_NOTE(
          Note.CHROMATIC_SCALE_NOTES[4]).toString());

  print('Note.MIXOLYDIAN_SCALE_FROM_NOTE('
      + Note.CHROMATIC_SCALE_NOTES[5].toString() + ') => '
      + Note.MIXOLYDIAN_SCALE_FROM_NOTE(
          Note.CHROMATIC_SCALE_NOTES[5]).toString());

  print('Note.LOCRIAN_SCALE_FROM_NOTE('
      + Note.CHROMATIC_SCALE_NOTES[6].toString() + ') => '
      + Note.LOCRIAN_SCALE_FROM_NOTE(
          Note.CHROMATIC_SCALE_NOTES[6]).toString());

  print('Note.sortNotes(Note.C_MAJOR_SCALE) => '
      + Note.sortNotes(Note.C_MAJOR_SCALE).toString());

  print('Note.scaleFromNote(5, Note.CHROMATIC_SCALE_NOTES[3]) => '
      + Note.scaleFromNote(5, Note.CHROMATIC_SCALE_NOTES[3]).toString());

  print('Note.chromaticScaleIndex(Note.CHROMATIC_SCALE_NOTES[5]) => '
      + Note.chromaticScaleIndex(
          Note.CHROMATIC_SCALE_NOTES[5]).toString());

  print('Note.toNote(Note.CHROMATIC_SCALE[3]) => '
      + Note.toNote(Note.CHROMATIC_SCALE[3]).toString());

  print('Note.toNotes(Note.CHROMATIC_SCALE) => '
      + Note.toNotes(Note.CHROMATIC_SCALE).toString());

  print('Note.frequencyFromMidiIndex(0) => '
      + Note.frequencyFromMidiIndex(0).toString());

  print('Note.midiIndexFromFrequency(44) => '
      + Note.midiIndexFromFrequency(44).toString());

  print('Note.frequencyFromNote("C#5") => '
      + Note.frequencyFromNote('C#5').toString());

  print('Note.noteFromMidiIndex(33) => '
      + Note.noteFromMidiIndex(33).toString());

  print('Note.noteFromFrequency(440.0) => '
      + Note.noteFromFrequency(440.0).toString());

  print('Note.noteNoOctave(Note.CHROMATIC_SCALE[7]) => '
      + Note.noteNoOctave(Note.CHROMATIC_SCALE[7]).toString());

  print('Note.nextNote("B3") => '
      + Note.nextNote("B3").toString());

  print('Note.noteToOctave("G#5") => '
      + Note.noteToOctave("G#5").toString());

  print('Note.incrementNoteOctave(Note.toNote("A10")) => '
      + Note.incrementNoteOctave(Note.toNote("A10")).toString());

  print('Note.fingerboardCoordinates('
      'Chordophone.fromDefaultChordophoneStringTuning(),"C#5") => '
      + Note.fingerboardCoordinates(
          Chordophone.fromDefaultChordophoneStringTuning(),
          "C#5").toString());

  /// TODO: FIX THIS
  /// print("TODO: FIX THIS");
  print('Note.notesToFingerboardCoordinates('
      'Chordophone.fromDefaultChordophoneStringTuning(), '
      '["E4","D#4","B3","G#3","B2","E2"]) => \n\t'
      + Note.notesToFingerboardCoordinates(
          Chordophone.fromDefaultChordophoneStringTuning(),
          ["E4","D#4","B3","G#3","B2","E2"]).toString());

  print(
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

  print('Note.fromNote("E3") => '
      + Note.fromNote("E3").toString());

  print('Note.fromFrequency(440.0) => '
      + Note.fromFrequency(440.0).toString());

  print('Note.C0.sharpen() => '
      + Note.C0.sharpen().toString());

  print('Note.C0.incrementOctave() => '
      + Note.C0.incrementOctave().toString());

  print('Note.C0.toStringFrequency() => '
      + Note.C0.toStringFrequency());

  print('Note.C0.toString() => '
      + Note.C0.toString());

  print('Note.C0 == Note.C0 => '
      + (Note.C0 == Note.C0).toString());

  print('Note.C0.hashCode => '
      + Note.C0.hashCode.toString());

  print('Note.C0.length => '
      + Note.C0.length.toString());

  print('Note.C0.getFrequency => '
      + Note.C0.getFrequency.toString());

  print('Note.C0.getNote => '
      + Note.C0.getNote.toString());

  print('Note.C0.getOctave => '
      + Note.C0.getOctave.toString());

  print('Note.C0.getChromaticScaleIndex => '
      + Note.C0.getChromaticScaleIndex.toString());

  print("TODO: assert()");
}

void main() => test();
