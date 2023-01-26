import 'dart:collection';

import 'package:allegrias/music/chordophone/chordophone_string/chordophone_string.dart';
import 'package:allegrias/music/note/note.dart';

import '../chordophone/chordophone.dart';
import 'tab_stanza/tab_stanza.dart';

/// TODO: Rewrite the data notes
/*  Class:  Tablature
*     Static
*
*       String            TAB_STANZAS_TOSTRING
*       String            NOTE_TO_TABULATURE_STANZA_TOSTRING(Note)
*         -Takes in Note parameter and outputs full toString Tabulature
* -----------------------------------------------------------------------------
*     Constructor
*                         Tablature()
*     Attributes
*       List<TabStanza>   tabs
*     Accessors
*       List<TabStanza>   getTabs
*       int               getLastTabStanzaIndex
*       bool              isNotEmpty
*       String            tabStanzasToString
*     Methods
*       bool              addNote(note)
*       @override String  toString
* */

class Tablature {

  static String TAB_STANZAS_TOSTRING(
      Chordophone chordophone, List<TabStanza> tabStanzas)
  {
    //print('TAB_STANZAS_TOSTRING($tabStanzas)');
    String outString = '';
    if (tabStanzas != null && tabStanzas.length > 0) {
      for (
      int i = 0;
      i < Chordophone.CHORDOPHONE_STRING_COUNT;
      i++
      ) {
        outString += '|-'
            + Chordophone.DEFAULT_CHORDOPHONE_STRING_TUNING[i]
            + '-|-';

        for (
        int j = tabStanzas.length > 10
            ? tabStanzas.length-10
            : 0;
        j < tabStanzas.length;
        j++
        ) {
          //print(tabStanzas[j].getNotesToTablature.toString());
          outString += tabStanzas[j].getNotesToTablature[i];
        }
        outString += '\n';
      }
    }
    //print('=> $outString');
    return outString;
  }

  List<TabStanza> tabs = [];
  Chordophone? chordophone =
      new Chordophone.fromDefaultStringTuning();

  Tablature(Chordophone chordophone) {
    this.tabs = [];
    this.chordophone = chordophone;
  }
  
  bool addNote(note) {
    if (note == null) {
      return (false);
    } else {
      tabs.add(TabStanza(chordophone!));
      return (tabs[getLastTabStanzaIndex]
          .addNote(note)!);
    }
  }
  
  List<TabStanza> get getTabs => (this.tabs);

  int get getLastTabStanzaIndex =>
      (tabs.length > 0)
          ? (this.tabs.length-1)
          : (0);

  bool get isNotEmpty => this.tabs.isNotEmpty;

  String get tabStanzasToString =>
      TAB_STANZAS_TOSTRING(chordophone!, tabs);

  @override
  String toString() =>
      isNotEmpty ? tabStanzasToString : 'Make Notes :)';

}
