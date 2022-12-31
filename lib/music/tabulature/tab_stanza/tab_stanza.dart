import 'dart:collection';
import 'dart:math' as Math;

import 'package:allegrias/music/guitar/guitar_string/guitar_string.dart';

import '../../guitar/guitar.dart';
import '../../note/note.dart';
import '../tabulature.dart';

/*  Class:  TabStanza
*     Static
*       bool        NOTE_EXISTS(List<Note> noteList, Note note)
*                     Checks noteList for note
*                   NOTES_TO_TABSTANZA_MAP
*                   TAB_STRING
*                   TABSTANZA_MAP_TO_TABSTANZA_STRING_LIST
*                   NOTE_TO_TAB_STANZA_STRING_LIST
*
*     Constructors
*                   TabStanza()
*                     Defines notes as an empty list.
*     Attributes
*       List<Note>  notes
*     Accessors
*       openStringss
*       getNotes
*       getNotesToTabulature
*       getGuitarStringToTabString
*       getOfficialTabStanzaGuitarStringMap
*     Mutators
*
*     Methods
*       noteExists(Note note)
*       isThereAvailableGuitarString(Note note)
*       isValidNoteAddition(Note note)
* */

class TabStanza {
  static List<String> NOTE_TO_TABULATURE_STANZA_LIST(Note note) {
    //print('NOTE_TO_TABULATURE_STANZA_LIST($note)');
    List<String> out = [];
    if (note != null) {
      bool gtrbl = true;
      for (int i = 0; i < Guitar.GUITAR_STRING_COUNT; i++) {
        /* var noat = Guitar.GUITAR_STRINGS[i].indexNote;
        if (noat.length == 3) {
          out.add('-$noat-');
        } else if (noat.length == 2) {
          out.add('-$noat--');
        } else if (noat.length == 1) {
          out.add('-$noat---');
        } */
        for (int j = 0; j < Guitar.FRETBOARD_LENGTH; j++) {
          if (gtrbl == false) {
            out.add('---'/*+'\n'*/);
            break;
          }
          var gn_note = Guitar.GUITAR_STRINGS[i].getScale[j];
          if (gn_note.hashCode == note.hashCode) {
            if (j <= 9) {
              out.add('$j--'/*+'\n'*/);
            } else {
              out.add('$j-'/*+'\n'*/);
            }
            gtrbl = false;
            break;
          }
        }
        if (gtrbl == true) {
          out.add('---'/*+'\n'*/);
        }
        // gtrbl = true;
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
      Guitar.FRET_GROUPS_TO_GUITAR_CHORD(
          Guitar.FRETBOARD_COORDINATES_TO_FRET_GROUPS(
              Note.NOTES_TO_FRETBOARD_COORDINATES_NOTE_MAP(notes)));

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

  static List<String> TABSTANZA_MAP_TO_TABSTANZA_STRING_LIST(Map<int,int> tabStanzaMap) {
    //print('TABSTANZA_MAP_TO_TABSTANZA_STRING_LIST($tabStanzaMap)');
    List<String> tabStanza = [];
    for (int i = 0; i < Guitar.GUITAR_STRING_COUNT; i++) {
      if (tabStanzaMap[i] != null) {
        tabStanza.add(TAB_STRING(tabStanzaMap[i].toString()));
      } else {
        tabStanza.add(TAB_STRING('-'));
      }
    }
    //print('=> $tabStanza');
    return tabStanza;
  }

  List<String> noteToTabStanzaStringList(Note note) {
    //print('noteToTabStanzaStringList($note)');
    Map<int,int> fretboardCoordinates = Note.NOTE_TO_FRETBOARD_COORDINATES(note);
    //print('$Note: $fretboardCoordinates');
    List<String> outStrList = [];
    int stringIndex, fretIndex;
    if (fretboardCoordinates != null && fretboardCoordinates.length > 0) {
      stringIndex = fretboardCoordinates.entries.first.key;
      fretIndex = fretboardCoordinates.entries.first.value;
      for (int i = 0; i < Guitar.GUITAR_STRING_COUNT; i++) {
        outStrList.add((TabStanza.TAB_STRING((i == stringIndex) ? fretIndex.toString() : '-')));
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

  List<String> get getNotesToTabulature {
    if (notes!.length > 1) {
      // print('gntt'+notes.toString());
      return TABSTANZA_MAP_TO_TABSTANZA_STRING_LIST(
          getOfficialTabStanzaGuitarStringMap);
    } else if (notes!.length == 1){
      // print('gntt'+notes.first.toString());
      return NOTE_TO_TABULATURE_STANZA_LIST(notes!.first);
    } else {
      // print('gntt');
      return NOTE_TO_TABULATURE_STANZA_LIST(Note.A4);
    }
  }

  Map<int,int> get getOfficialTabStanzaGuitarStringMap =>
      NOTES_TO_TABSTANZA_MAP(this.notes!);

  List<int> get openStrings {
    List<int> openStrings = [];
    bool isOpen;
    if (getOfficialTabStanzaGuitarStringMap != null) {
      for (int i = 0; i < Guitar.GUITAR_STRING_NOTES.length; i++) {
        isOpen = true;
        if (getOfficialTabStanzaGuitarStringMap.containsKey(i)) {
          isOpen = false;
        }
        isOpen == true ? openStrings.add((i)) : print('$isOpen');
      }
    }
    return openStrings;
  }

  bool? isThereAvailableGuitarString(Note note) {
    for (var guitarStringIndex in openStrings) {
      return (GuitarString.
          IS_EXISTANT_NOTE_ON_GUITAR_STRING(note,
          Guitar.GUITAR_STRINGS[guitarStringIndex]) > -1);
    }
    return false;
  }

  @override
  String toString() {
    return getGuitarStringTabsToString;
  }

  String get getGuitarStringTabsToString {
    String tabulatureStanza = '';
    for (String guitarString in getNotesToTabulature) {
      tabulatureStanza += guitarString;// + '\n';
    }
    return tabulatureStanza;
  }

  bool isValidNoteAddition(note) {
    if (note is String) {
      return isValidNoteAddition(Note.TO_NOTE(note));
    } else {
      //print('asdf');
      return (note != null
          && notes!.length <= 1 == true);
          //&& notes.length <= Guitar.GUITAR_STRING_COUNT == true);
          //&& !(noteExists(note)) == true
          //&& isThereAvailableGuitarString(note) == true);
    }
  }

}

