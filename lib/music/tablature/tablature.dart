import 'dart:collection';

import '../chordophone/chordophone.dart';
import 'tab_stanza/tab_stanza.dart';

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

  static String TAB_STANZAS_TOSTRING(List<TabStanza> tabStanzas) {
    //print('TAB_STANZAS_TOSTRING($tabStanzas)');
    String outString = '';
    if (tabStanzas != null && tabStanzas.length > 0) {
      for (int i = 0;
      i < Chordophone.CHORDOPHONE_STRING_COUNT;
      i++) {
        outString += '|-'
            + Chordophone.CHORDOPHONE_STRING_TUNING[i]
            + '-|-';
     for (int j = tabStanzas.length > 10 ? tabStanzas.length-10 : 0;
        j < tabStanzas.length;
        j++) {
          //print(tabStanzas[j].getNotesToTablature.toString());
          outString += tabStanzas[j].getNotesToTablature[i];
        }
        outString += '\n';
      }
    }
    //print('=> $outString');
    return outString;
  }

  static String NOTE_TO_TABLATURE_TOSTRING(String note) {
    //print('NOTE_TO_TABLATURE_TOSTRING($note)');
    int chordophoneStringCounter = 0;
    String out = '';
    if (note != null) {
      bool chordophoneBool = true;
      for (int i = 0;
      i < Chordophone.CHORDOPHONE_STRING_COUNT;
      i++) {
        var noat = Chordophone.CHORDOPHONE_STRINGS[i].indexNote;
        if (noat!.length == 3) {
          out += '|-$noat-|-';
        } else if (noat.length == 2) {
          out += '|-$noat--|-';
        } else if (noat.length == 1) {
          out += '|-$noat---|-';
        }
        for (int j = 0; j < Chordophone.FINGERBOARD_LENGTH; j++) {
          if (chordophoneBool == false) {
            out += '---';//+'\n';
            break;
          }
          var chordophone_note = Chordophone
              .CHORDOPHONE_STRINGS[i]
              .getScale[j];
          if (chordophone_note.hashCode == note.hashCode) {
            if (j <= 9) {
              out += '$j--';//+'\n';
            } else {
              out += '$j-';//+'\n';
            }
            chordophoneBool = false;
            break;
          }
        }
        if (chordophoneBool == true) {
          out += '---';//+'\n';
        }
        //out.replaceAll('\n','');
        //chordophoneBool = true;
        chordophoneStringCounter++;
      }
    } else {
      out += '||';
    }
    //print('TABLATURE_TOSTRING => $out');
    return out;
  }

  List<TabStanza> tabs = [];

  Tablature() {
    this.tabs = [];
  }
  
  bool addNote(note) {
    if (note == null) {
      return false;
    } else {
      tabs.add(TabStanza());
      return tabs[getLastTabStanzaIndex].addNote(note)!;
    }
  }
  
  List<TabStanza> get getTabs => this.tabs;
  int get getLastTabStanzaIndex => tabs.length > 0 ? this.tabs.length-1 : 0;
  bool get isNotEmpty => this.tabs.isNotEmpty;
  String get tabStanzasToString => TAB_STANZAS_TOSTRING(tabs);

  @override
  String toString() {
    String out = tabStanzasToString;
    //print(out);
    return out;
  }

}
