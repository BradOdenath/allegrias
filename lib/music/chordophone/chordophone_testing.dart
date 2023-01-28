import 'package:allegrias/commons.dart';
import 'package:allegrias/music/chordophone/chordophone.dart';
import 'package:allegrias/music/note/note.dart';

void test() {

  print_test('Chordophone.DEFAULT_FINGERBOARD_LENGTH => '
      + Chordophone.DEFAULT_FINGERBOARD_LENGTH.toString());

  print_test('Chordophone.DEFAULT_CHORDOPHONE_STRING_TUNING => '
      + Chordophone.DEFAULT_CHORDOPHONE_STRING_TUNING.toString());

  print_test('Chordophone.DEFAULT_POSITION_RANGE => '
      + Chordophone.DEFAULT_POSITION_RANGE.toString());

  print_test('Chordophone.fingerboardCoordinatesToPosition('
      'Note.notesToFingerboardCoordinates('
      'Chordophone.fromDefaultChordophoneStringTuning(),'
      '["E4","D#4","B3","G#3","B2","E2"])) => '
      + Chordophone.fingerboardCoordinatesToPositions(
          Note.notesToFingerboardCoordinates(
              Chordophone.fromStandardGuitarTuning(),
              ["E4","D#4","B3","G#3","B2","E2"])).toString());

  print_test('Chordophone.indexInRangeOfPositions('
      'Note.fingerboardCoordinates('
      'Chordophone.fromDefaultChordophoneStringTuning(),'
      '"C#5"), 3) => '
      + Chordophone.indexInRangeOfPositions(
          Note.fingerboardCoordinates(
          Chordophone.fromStandardGuitarTuning(),
          "C#5"), 3).toString());

  print_test('Chordophone.positionsToChord('
      '.fingerboardCoordinatesToPositions('
      'Note.notesToFingerboardCoordinates('
      'Chordophone.fromDefaultTuning(),'
      '["E4","D#4","B3","G#3","B2","E2"])))'
      + Chordophone.positionsToChord(Chordophone
          .fingerboardCoordinatesToPositions(
          Note.notesToFingerboardCoordinates(
              Chordophone.fromStandardGuitarTuning(),
              ["E4","D#4","B3","G#3","B2","E2"])))
          .toString());

  print_test('Chordophone.chordophoneStrings('
      'Chordophone.DEFAULT_CHORDOPHONE_STRING_TUNING) => '
      + Chordophone.chordophoneStrings(
          Chordophone.DEFAULT_CHORDOPHONE_STRING_TUNING)
          .toString());

  print_test('Chordophone.fromDefaultTuning()'
      '.getChordophoneStringCount'
      + Chordophone.fromStandardGuitarTuning()
          .getChordophoneStringCount.toString());

  print_test('$Chordophone.fromDefaultTuning()');

  print_test("TODO: assert()");
}
void main() => test();