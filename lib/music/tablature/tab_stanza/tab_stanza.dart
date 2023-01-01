import 'dart:collection';
import 'dart:math' as Math;

import 'package:allegrias/music/chordophone/'
    'chordophone_string/chordophone_string.dart';

import '../../chordophone/chordophone.dart';
import '../../note/note.dart';
import '../tablature.dart';

/*  Class:  TabStanza
*     Static
*       bool        NOTE_EXISTS(List<Note> noteList, Note note)
*                     Checks noteList for note
*                   NOTES_TO_TABSTANZA_MAP
*                   TAB_STRING
*                   TABSTANZA_MAP_TO_TABSTANZA_CHORDOPHONE_STRING_LIST
*                   NOTE_TO_TAB_STANZA_CHORDOPHONE_STRING_LIST
*
*     Constructors
*                   TabStanza()
*                     Defines notes as an empty list.
*     Attributes
*       List<Note>  notes
*     Accessors
*       openStrings
*       getNotes
*       getNotesToTablature
*       getChordophoneStringToTabString
*       getOfficialTabStanzaChordophoneStringMap
*     Mutators
*
*     Methods
*       noteExists(Note note)
*       isThereAvailableChordophoneString(Note note)
*       isValidNoteAddition(Note note)
* */

class TabStanza {
  static List<String> NOTE_TO_TABLATURE_STANZA_LIST(Note note) {
    print('NOTE_TO_TABLATURE_STANZA_LIST($note)');
    List<String> out = [];
    if (note != null) {
      bool chordophoneBool = true;
      for (int i = 0;
      i < Chordophone.CHORDOPHONE_STRING_COUNT;
      i++) {
        /* var noat = Guitar.GUITAR_STRINGS[i].indexNote;
        if (noat.length == 3) {
          out.add('-$noat-');
        } else if (noat.length == 2) {
          out.add('-$noat--');
        } else if (noat.length == 1) {
          out.add('-$noat---');
        } */
        for (int j = 0; j < Chordophone.FINGERBOARD_LENGTH; j++) {
          if (chordophoneBool == false) {
            out.add('---'/*+'\n'*/);
            break;
          }
          var chordophoneNote = Chordophone
              .CHORDOPHONE_STRINGS[i]
              .getScale[j];
          if (chordophoneNote.hashCode == note.hashCode) {
            if (j <= 9) {
              out.add('$j--'/*+'\n'*/);
            } else {
              out.add('$j-'/*+'\n'*/);
            }
            print('j: $j');
            chordophoneBool = false;
            break;
          }
        }
        if (chordophoneBool == true) {
          out.add('---'/*+'\n'*/);
        }
        // chordophoneBool = true;
      }
    } else {
      out.add('||');
    }
    //print('=> $out');
    return out;
  }

  static bool NOTE_EXISTS(List<Note> noteList, objNote) {
    //print('NOTE_EXISTS($noteList, $objNote)');
    Note focusNote;
    focusNote = Note.TO_NOTE(objNote);
    for (Note note in noteList) {
      if (note == focusNote) {
        //print('=> true');
        return true;
      }
    }
    //print('=> false');
    return false;
  }

  static Map<int,int> NOTES_TO_TABSTANZA_MAP(List<Note> notes) =>
      Chordophone.POSITION_GROUPS_TO_CHORDOPHONE_CHORD(
          Chordophone.FINGERBOARD_COORDINATES_TO_POSITION_GROUPS(
              Note.NOTES_TO_FINGERBOARD_COORDINATES_NOTE_MAP(notes)));

  static String TAB_STRING(String fretIndex) {
    print('TAB_STRING(String $fretIndex)');
    String out = '';
    if (fretIndex.length == 3) {
      out += '-$fretIndex';
    } else if (fretIndex.length == 2) {
      out += '-$fretIndex-';
    } else if (fretIndex.length == 1) {
      out += '-$fretIndex--'; //why is it 3 - not 4?
    }
    //out.replaceAll('\n','');
    print('TAB_STRING => $out');
    return out;
  }

  static List<String> TABSTANZA_MAP_TO_TABSTANZA_CHORDOPHONE_STRING_LIST(
      Map<int,int> tabStanzaMap) {
    //print('TABSTANZA_MAP_TO_TABSTANZA_STRING_LIST($tabStanzaMap)');
    List<String> tabStanza = [];
    for (int i = 0;
    i < Chordophone.CHORDOPHONE_STRING_COUNT;
    i++) {
      if (tabStanzaMap[i] != null) {
        tabStanza.add(TAB_STRING(tabStanzaMap[i].toString()));
      } else {
        tabStanza.add(TAB_STRING('-'));
      }
    }
    //print('=> $tabStanza');
    return tabStanza;
  }

  List<String> noteToTabStanzaChordophoneStringList(Note note) {
    //print('noteToTabStanzaStringList($note)');
    Map<int,int> fingerboardCoordinates = Note
        .NOTE_TO_FINGERBOARD_COORDINATES(note);
    //print('$Note: $fingerboardCoordinates');
    List<String> outStrList = [];
    int stringIndex, fretIndex;
    if (fingerboardCoordinates != null && fingerboardCoordinates.length > 0) {
      stringIndex = fingerboardCoordinates.entries.first.key;
      fretIndex = fingerboardCoordinates.entries.first.value;
      for (int i = 0; i < Chordophone.CHORDOPHONE_STRING_COUNT; i++) {
        outStrList.add((TabStanza.TAB_STRING(
            (i == stringIndex)
                ? fretIndex.toString()
                : '-')));
      }
    }
    //print('=> $outStrList');
    return outStrList;
  }
  
  List<Note>? notes;

  TabStanza() {
    notes = [];
  }

  List<Note> get getNotes => notes!;

  bool? addNote(note) {
    if (isValidNoteAddition(note)) {
      if (note is Note) {
        notes?.add(note);
        print('Note: $note, Notes: $notes');
        return true;
      } else if (note is String) {
        return addNote(Note.TO_NOTE(note));
      }
    }
    return false;
  }

  bool noteExists(note) {
    return NOTE_EXISTS(notes!, note);
  }

  List<String> get getNotesToTablature {
    if (notes!.length > 1) {
      // print('gntt'+notes.toString());
      return TABSTANZA_MAP_TO_TABSTANZA_CHORDOPHONE_STRING_LIST(
          getOfficialTabStanzaChordophoneStringMap);
    } else if (notes!.length == 1){
      // print('gntt'+notes.first.toString());
      return NOTE_TO_TABLATURE_STANZA_LIST(notes!.first);
    } else {
      // print('gntt');
      return NOTE_TO_TABLATURE_STANZA_LIST(Note.A4);
    }
  }

  Map<int,int> get getOfficialTabStanzaChordophoneStringMap =>
      NOTES_TO_TABSTANZA_MAP(this.notes!);

  List<int> get openStrings {
    List<int> openStrings = [];
    bool isOpen;
    if (getOfficialTabStanzaChordophoneStringMap != null) {
      for (int i = 0; i < Chordophone.CHORDOPHONE_STRING_NOTES.length; i++) {
        isOpen = true;
        if (getOfficialTabStanzaChordophoneStringMap.containsKey(i)) {
          isOpen = false;
        }
        isOpen == true ? openStrings.add((i)) : print('$isOpen');
      }
    }
    return openStrings;
  }

  bool? isThereAvailableChordophoneString(Note note) {
    for (var chordophoneStringIndex in openStrings) {
      return (ChordophoneString.
          IS_EXISTANT_NOTE_ON_CHORDOPHONE_STRING(note,
          Chordophone
              .CHORDOPHONE_STRINGS[chordophoneStringIndex]) > -1);
    }
    return false;
  }

  @override
  String toString() {
    return getChordophoneStringTabsToString;
  }

  String get getChordophoneStringTabsToString {
    String tablatureStanza = '';
    for (String chordophoneString in getNotesToTablature) {
      tablatureStanza += chordophoneString;// + '\n';
    }
    return tablatureStanza;
  }

  bool isValidNoteAddition(note) {
    if (note is String) {
      return isValidNoteAddition(Note.TO_NOTE(note));
    } else {
      //print('asdf');
      return (note != null
          && notes!.length <= 1 == true);
          //&& notes.length <= Chordophone.CHORDOPHONE_STRING_COUNT == true);
          //&& !(noteExists(note)) == true
          //&& isThereAvailableChordophoneString(note) == true);
    }
  }

}

