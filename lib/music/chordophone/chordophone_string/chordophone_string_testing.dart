import 'package:allegrias/commons.dart';
import 'package:allegrias/music/chordophone/chordophone.dart';
import 'package:allegrias/music/chordophone/chordophone_string/chordophone_string.dart';
import 'package:allegrias/music/note/note.dart';

// ignore: non_constant_identifier_names
void chordophone_string_test() {

  print_test('ChordophoneString'
      '.noteTabIndex(Note.fromFrequency(24),'
      'ChordophoneString.fromDefaultFingerboardLength(Note.C0))'
      + ChordophoneString
          .noteTabIndex(Note.fromFrequency(24),
          ChordophoneString.fromDefaultFingerboardLength(Note.C0))
          .toString());

  print_test('ChordophoneString('
      'indexNote: Note.C0, '
      'chordophoneStringLength: Chordophone.DEFAULT_FINGERBOARD_LENGTH) => '
      + ChordophoneString(
          indexNote: Note.C0,
          chordophoneStringLength: Chordophone.DEFAULT_FINGERBOARD_LENGTH)
          .toString());

  print_test('ChordophoneString.fingerboardPositionNotes('
      'Chordophone.DEFAULT_FINGERBOARD_LENGTH,'
      'Note.C0) => '
      + ChordophoneString.fingerboardPositionNotes(
          Chordophone.DEFAULT_FINGERBOARD_LENGTH,
          Note.C0).toString()
  );

  print_test('ChordophoneString'
      '.fromDefaultFingerboardLength(Note.C0)'
      '.noteExistsOnChordophoneString(Note.C0) => '
      + ChordophoneString
          .fromDefaultFingerboardLength(Note.C0)
          .noteExistsOnChordophoneString(Note.C0)
          .toString());

  print_test('ChordophoneString'
      '.fromDefaultFingerboardLength(Note.C0)'
      '.noteExistsAtPosition(Note.C0) => '
      + ChordophoneString
          .fromDefaultFingerboardLength(Note.C0)
          .noteExistsAtPosition(Note.C0)
          .toString());

  print_test('ChordophoneString'
      '.fromDefaultFingerboardLength(Note.C0)'
      '.getIndexNote => '
      + ChordophoneString
          .fromDefaultFingerboardLength(Note.C0)
          .getIndexNote
          .toString());

  print_test('ChordophoneString'
      '.fromDefaultFingerboardLength(Note.C0)'
      '.getScale => '
      + ChordophoneString
          .fromDefaultFingerboardLength(Note.C0)
          .getScale
          .toString());

  print_test("TODO: assert()");
}

void main() => chordophone_string_test();

class ChordophoneStringTesting {
  static void test() => chordophone_string_test();
}