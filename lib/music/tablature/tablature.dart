import 'package:allegrias/commons.dart';
import 'package:allegrias/music/chordophone/chordophone.dart';
import 'package:allegrias/music/note/note.dart';
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
      (i < chordophone.getChordophoneStringCount);
      i++) {
        outChordophoneString += '|'
            + (TabStanza.tabChordophoneString(chordophone
                .getChordophoneStringTuning[i].toString()))
            + '|-';
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
    print_debug('Tablature.tabStanzaToString($chordophone, $tabStanzas)'
        ' => $outChordophoneString');
    return outChordophoneString;
  }

  List<TabStanza> tabs = [];
  Chordophone? chordophone =
      new Chordophone.fromStandardGuitarTuning();

  Tablature(Chordophone chordophone) {
    this.tabs = [];
    this.setChordophone = chordophone;
    print_debug(toStringObject());
  }
  
  bool addNote(note) {
    tabs.add(TabStanza(chordophone!));
    bool out = (tabs[getLastTabStanzaIndex]
        .addNote(Note.toNote(note))!);
    print_debug(toStringObject() + '.addNote($note) => $out');
    return (out);
  }

  String toStringObject() => ('Tablature($tabs, $chordophone)');

  @override
  String toString() {
    String out = ((isNotEmpty)
        ? (tabStanzasToString(chordophone!, tabs))
        : ('Make Notes :)'));
    print_debug(toStringObject() + '.toString() => $out');
    return (out);
  }

    List<TabStanza> get getTabs => (this.tabs);

    int get getLastTabStanzaIndex {
      int out = ((tabs.length > 0)
          ? (this.tabs.length - 1)
          : (0));
      print_debug(toStringObject() + '.getLastTabStanzaIndex => $out');
      return (out);
    }

    bool get isNotEmpty {
      bool out = (this.tabs.isNotEmpty);
      print_debug(toStringObject() + '.isNotEmpty => $out');
      return (out);
    }

    set setChordophone(Chordophone chordophone) {
      String out = (toStringObject() + '.setChordophone($chordophone)');
      this.chordophone = chordophone;
      for (var tabStanza in tabs) {
        tabStanza.setChordophone = chordophone;
      }
      out += (' => ' + toStringObject());
      print_debug(out);
    }

}