import 'package:allegrias/commons.dart';
import 'package:allegrias/music/chordophone/chordophone.dart';
import 'package:allegrias/music/note/note.dart';
import 'package:allegrias/music/tablature/tab_stanza/tab_stanza.dart';

// ignore: non_constant_identifier_names
void tab_stanza_string_test() {
  print_test('TabStanza.noteToTabStanzaList('
      'Chordophone.fromStandardGuitarTuning(),'
      'Note.fromFrequency(440)) => '
      + TabStanza.noteToTabStanzaList(
          Chordophone.fromStandardGuitarTuning(),
          Note.fromFrequency(440))
          .toString());

  print_test('TabStanza.notesToTabStanzaMap('
      'Chordophone.fromStandardGuitarTuning(), '
      '["E4","B3"]) => '
      + TabStanza.notesToTabStanzaMap(
          Chordophone.fromStandardGuitarTuning(),
          ["E4","B3"])
          .toString());

  print_test('TabStanza.tabChordophoneString("2") => '
      + TabStanza.tabChordophoneString("2"));

  print_test('TabStanza.tabStanzaMapToTabStanzaList('
      'TabStanza.notesToTabStanzaMap('
      'Chordophone.fromStandardGuitarTuning(),'
      '["E4","B3"]),'
      'Chordophone.fromStandardGuitarTuning()) => '
      + TabStanza.tabStanzaMapToTabStanzaList(
          TabStanza.notesToTabStanzaMap(
              Chordophone.fromStandardGuitarTuning(),
              ["E4","B3"]),
          Chordophone.fromStandardGuitarTuning())
          .toString());

  print_test('TabStanza'
      '.noteToTabStanzaChordophoneStringList('
      'Chordophone.fromStandardCelloTuning(),'
      'Note.fromFrequency(666)) => '
      + TabStanza.noteToTabStanzaChordophoneStringList(
          Chordophone.fromStandardCelloTuning(),
          Note.fromFrequency(666))
          .toString());

  print_test('TabStanza(Chordophone.fromStandardCelloTuning()) => '
      + TabStanza(Chordophone.fromStandardCelloTuning())
          .toString());

  print_test('TabStanza('
      'Chordophone.fromStandardCelloTuning())'
      '.noteToTabStanzaChordophoneStringList('
      'Note.fromFrequency(666) => '
      + TabStanza(Chordophone.fromStandardCelloTuning())
          .addNote(Note.fromFrequency(666))
          .toString());

  print_test('TabStanza('
      'Chordophone.fromStandardCelloTuning())'
      '.noteExists(Note.fromFrequency(666))'
      + TabStanza(Chordophone.fromStandardCelloTuning())
          .noteExists(Note.fromFrequency(666))
          .toString());

  print_test('TabStanza(Chordophone.fromStandardCelloTuning()).toString() => '
      + TabStanza(Chordophone.fromStandardCelloTuning()).toString());

  print_test('TabStanza(Chordophone.fromStandardCelloTuning())'
      '.validNoteAddition("C5")'
      + TabStanza(Chordophone.fromStandardCelloTuning())
          .validNoteAddition("C5")
          .toString());

  print_test(TabStanza(Chordophone.fromStandardCelloTuning())
      .availableChordophoneString(Note.fromFrequency(666)));

  print_test('TabStanza('
      'Chordophone.fromStandardCelloTuning())'
      '.getNotes => '
      + TabStanza(Chordophone.fromStandardCelloTuning())
          .getNotes
          .toString());

  print_test('TabStanza('
      'Chordophone.fromStandardCelloTuning())'
      '.getNotesToTablature => '
      + TabStanza(Chordophone.fromStandardCelloTuning())
          .getNotesToTablature
          .toString());

  print_test('TabStanza('
      'Chordophone.fromStandardCelloTuning())'
      '.getOfficialTabStanzaChordophoneStringMap => '
      + TabStanza(Chordophone.fromStandardCelloTuning())
          .getOfficialTabStanzaChordophoneStringMap
          .toString());

  print_test('TabStanza('
      'Chordophone.fromStandardCelloTuning())'
      '.getOpenChordophoneStrings => '
      + TabStanza(Chordophone.fromStandardCelloTuning())
          .getOpenChordophoneStrings
          .toString());

  //print_test();

  print_test("TODO: assert()");
}

void main() => tab_stanza_string_test();

class TabStanzaTesting {
  static void test() => tab_stanza_string_test();
}