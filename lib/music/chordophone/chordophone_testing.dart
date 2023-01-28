import 'package:allegrias/commons.dart';
import 'package:allegrias/music/chordophone/chordophone.dart';
import 'package:allegrias/music/note/note.dart';

void test_chordophone() {

  print_test('Chordophone.DEFAULT_FINGERBOARD_LENGTH => '
      + Chordophone.DEFAULT_FINGERBOARD_LENGTH.toString());

  print_test('Chordophone.DEFAULT_CHORDOPHONE_TUNING => '
      + Chordophone.DEFAULT_CHORDOPHONE_TUNING.toString());

  print_test('Chordophone.STANDARD_TEN_STRING_GUITAR_TUNING => '
      + Chordophone.STANDARD_TEN_STRING_GUITAR_TUNING.toString());

  print_test('Chordophone.STANDARD_SEVEN_STRING_GUITAR_TUNING => '
      + Chordophone.STANDARD_SEVEN_STRING_GUITAR_TUNING.toString());

  print_test('Chordophone.STANDARD_GUITAR_TUNING => '
      + Chordophone.STANDARD_GUITAR_TUNING.toString());

  print_test('Chordophone.STANDARD_UKULELE_TUNING => '
      + Chordophone.STANDARD_UKULELE_TUNING.toString());

  print_test('Chordophone.STANDARD_VIOLIN_TUNING => '
      + Chordophone.STANDARD_VIOLIN_TUNING.toString());

  print_test('Chordophone.STANDARD_VIOLA_TUNING => '
      + Chordophone.STANDARD_VIOLA_TUNING.toString());

  print_test('Chordophone.STANDARD_CELLO_TUNING => '
      + Chordophone.STANDARD_CELLO_TUNING.toString());

  print_test('Chordophone.STANDARD_SIX_STRING_BASS_TUNING => '
      + Chordophone.STANDARD_SIX_STRING_BASS_TUNING.toString());

  print_test('Chordophone.STANDARD_FIVE_STRING_BASS_TUNING => '
      + Chordophone.STANDARD_FIVE_STRING_BASS_TUNING.toString());

  print_test('Chordophone.STANDARD_BASS_TUNING => '
      + Chordophone.STANDARD_BASS_TUNING.toString());

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
      'Chordophone.fingerboardCoordinatesToPositions('
      'Note.notesToFingerboardCoordinates('
      'Chordophone.fromDefaultTuning(),'
      '["E4","D#4","B3","G#3","B2","E2"]))) => '
      + Chordophone.positionsToChord(Chordophone
          .fingerboardCoordinatesToPositions(
          Note.notesToFingerboardCoordinates(
              Chordophone.fromStandardGuitarTuning(),
              ["E4","D#4","B3","G#3","B2","E2"])))
          .toString());

  print_test('Chordophone.chordophoneStrings('
      'Chordophone.DEFAULT_CHORDOPHONE_STRING_TUNING) => '
      + Chordophone.chordophoneStrings(
          Chordophone.DEFAULT_CHORDOPHONE_TUNING)
          .toString());

  print('Chordophone.fromDefaultChordophoneTuning() => '
      + Chordophone.fromDefaultChordophoneTuning().toString());

  print('Chordophone.fromStandardTenStringGuitarTuning() => '
      + Chordophone.fromStandardTenStringGuitarTuning().toString());

  print('Chordophone.fromStandardSevenStringGuitarTuning() => '
      + Chordophone.fromStandardSevenStringGuitarTuning().toString());

  print('Chordophone.fromStandardGuitarTuning() => '
      + Chordophone.fromStandardGuitarTuning().toString());

  print('Chordophone.fromStandardUkuleleTuning() => '
      + Chordophone.fromStandardUkuleleTuning().toString());

  print('Chordophone.fromStandardViolinTuning() => '
      + Chordophone.fromStandardViolinTuning().toString());

  print('Chordophone.fromStandardViolaTuning() => '
      + Chordophone.fromStandardViolaTuning().toString());

  print('Chordophone.fromStandardCelloTuning() => '
      + Chordophone.fromStandardCelloTuning().toString());

  print('Chordophone.fromStandardSixStringBassTuning() => '
      + Chordophone.fromStandardSixStringBassTuning().toString());

  print('Chordophone.fromStandardFiveStringBassTuning() => '
      + Chordophone.fromStandardFiveStringBassTuning().toString());

  print('Chordophone.fromStandardBassTuning() => '
      + Chordophone.fromStandardBassTuning().toString());

  print_test('Chordophone.fromStandardGuitarTuning()'
      '.getChordophoneStringCount => '
      + Chordophone.fromStandardGuitarTuning()
          .getChordophoneStringCount.toString());

  print('Chordophone.fromStandardGuitarTuning().toString() => '
      + Chordophone.fromStandardGuitarTuning().toString());

  print('Chordophone.fromStandardGuitarTuning()'
      '.getChordophoneStringCount => '
      + Chordophone
          .fromStandardGuitarTuning()
          .getChordophoneStringCount.toString());

  print('Chordophone.fromStandardGuitarTuning()'
      '.getChordophoneStringTuning => '
      + Chordophone
          .fromStandardGuitarTuning()
          .getChordophoneStringTuning.toString());

  print('Chordophone.fromStandardGuitarTuning()'
      '.getChordophoneStrings => '
      + Chordophone
          .fromStandardGuitarTuning()
          .getChordophoneStrings.toString());

  print_test("TODO: assert()");
}

void main() => test_chordophone();

class ChordophoneTesting {
  static void test() => test_chordophone();
}