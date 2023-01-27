import 'package:allegrias/music/chordophone/chordophone.dart';
import 'package:allegrias/music/tablature/tab_stanza/tab_stanza.dart';

void test() {
  print("TODO: assert()");
}
void main() => test();

class Tablature {
  static String tabStanzasToString(
      Chordophone chordophone, List<TabStanza> tabStanzas)
  {
    String outChordophoneString = '';
    if (tabStanzas.length > 0) {
      for (int i = 0;
      (i < Chordophone.chordophoneStringCount);
      i++) {
        outChordophoneString += '|-'
            + Chordophone.DEFAULT_CHORDOPHONE_STRING_TUNING[i]
            + '-|-';
        for (int j = (tabStanzas.length > 10)
            ? (tabStanzas.length-10)
            : (0);
        (j < tabStanzas.length);
        j++
        ) {
          outChordophoneString += tabStanzas[j]
              .getNotesToTablature[i];
        }
        outChordophoneString += '\n';
      }
    }
    return outChordophoneString;
  }

  List<TabStanza> tabs = [];
  Chordophone? chordophone =
      new Chordophone.fromDefaultChordophoneStringTuning();

  Tablature(Chordophone chordophone) {
    this.tabs = [];
    this.chordophone = chordophone;
  }
  
  bool addNote(note) {
    tabs.add(TabStanza(chordophone!));
    return (tabs[getLastTabStanzaIndex]
        .addNote(note)!);
  }
  
  List<TabStanza> get getTabs => (this.tabs);

  int get getLastTabStanzaIndex =>
      (tabs.length > 0)
          ? (this.tabs.length-1)
          : (0);

  bool get isNotEmpty => (this.tabs.isNotEmpty);

  @override
  String toString() => (isNotEmpty)
          ? (tabStanzasToString(chordophone!, tabs))
          : ('Make Notes :)');

}
