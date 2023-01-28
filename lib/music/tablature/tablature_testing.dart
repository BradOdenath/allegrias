import 'package:allegrias/commons.dart';
import 'package:allegrias/music/chordophone/chordophone.dart';
import 'package:allegrias/music/tablature/tablature.dart';

// ignore: non_constant_identifier_names
void tablature_string_test() {
  print_test('Tablature.tabStanzasToString('
      'Chordophone.fromStandardGuitarTuning(), '
      'Tablature(Chordophone.fromStandardGuitarTuning()).getTabs => '
      + Tablature.tabStanzasToString(Chordophone.fromStandardGuitarTuning(),
          Tablature(Chordophone.fromStandardGuitarTuning()).getTabs)
          .toString());

  print_test('Tablature(Chordophone.fromStandardGuitarTuning()) => '
      '.addNote("C6") => '
      + Tablature(Chordophone.fromStandardGuitarTuning()).addNote("C6")
          .toString());

  print_test('Tablature(Chordophone.fromStandardGuitarTuning()).toString() => '
      + Tablature(Chordophone.fromStandardGuitarTuning())
          .toString());

  print_test('Tablature(Chordophone.fromStandardGuitarTuning()).getTabs => '
      + Tablature(Chordophone.fromStandardGuitarTuning())
          .getTabs.toString());

  print_test('Tablature(Chordophone.fromStandardGuitarTuning()) => '
      '.isNotEmpty.toString()'
      + Tablature(Chordophone.fromStandardGuitarTuning())
          .isNotEmpty.toString());

  print_test("TODO: assert()");
}

void main() => tablature_string_test();

class TablatureTesting {
  static void test() => tablature_string_test();
}