import 'package:allegrias/commons.dart';
import 'package:allegrias/music/chordophone/chordophone.dart';
import 'package:allegrias/music/note/note.dart';
import 'package:allegrias/music/tablature/tab_stanza/tab_stanza.dart';

// ignore: non_constant_identifier_names
void tab_stanza_string_test() {
  print_test('TabStanza.noteToTabStanzaList('
      'Chordophone.fromStandardGuitarTuning(),'
      'Note.fromFrequency(440))'
      + TabStanza.noteToTabStanzaList(
          Chordophone.fromStandardGuitarTuning(),
          Note.fromFrequency(440))
          .toString());

  print_test("TODO: assert()");
}

void main() => tab_stanza_string_test();

class TabStanzaTesting {
  static void test() => tab_stanza_string_test();
}