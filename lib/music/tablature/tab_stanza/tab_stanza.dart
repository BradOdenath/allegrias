import 'dart:collection';
import 'dart:math' as Math;

import 'package:allegrias/music/chordophone/'
    'chordophone_string/chordophone_string.dart';

import '../../chordophone/chordophone.dart';
import '../../note/note.dart';

/// TODO: Rewrite the data notes
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
  static List<String>
  NOTE_TO_TABLATURE_STANZA_LIST(
      Chordophone chordophone,
      Note note)
  {
    //print('NOTE_TO_TABLATURE_STANZA_LIST($note)');
    List<String> out = [];
    if (note != null) {
      bool chordophoneBool = true;
      for (ChordophoneString chordophone_string
      in (chordophone.chordophone_strings!)) {
        List<Note> chordophone_string_scale = (chordophone_string
            .getScale);
        for (int j = 0;
        (j < chordophone_string_scale.length); 
        j++)
        {
          Note chordophoneNote = chordophone_string_scale[j];
          if (chordophoneBool == false) {
            out.add('---');
            break;
          }

          if (chordophoneNote.toString() == note.toString()) {
            out.add((j <= 9)
                ? ('$j--')
                : ('$j-'));
            chordophoneBool = false;
            break;
          }
        }
        if (chordophoneBool == true) {
          out.add('---');
        }
      }
    } else {
      out.add('||');
    }
    //print('=> $out');
    return (out);
  }

  static bool NOTE_EXISTS(List<Note> noteList, objNote) {
    //print('NOTE_EXISTS($noteList, $objNote)');
    bool out = false;
    Note focusNote;
    focusNote = (Note.TO_NOTE(objNote));
    for (Note note in noteList) {
      if (note == focusNote) {
        out = true;
      }
    }
    return (out);
  }

  static Map<int,int> NOTES_TO_TABSTANZA_MAP(
      Chordophone chordophone, List<Note> notes) =>
      Chordophone.POSITION_GROUPS_TO_CHORDOPHONE_CHORD(
          Chordophone.FINGERBOARD_COORDINATES_TO_POSITION_GROUPS(
              Note.NOTES_TO_FINGERBOARD_COORDINATES_NOTE_MAP(
                  chordophone, notes)));

  static String TAB_STRING(String fretIndex) {
    //print('TAB_STRING(String $fretIndex)');
    String out = ('');
    
    //out += ('-$fretIndex---').substring(0,);

    if (fretIndex.length == 3) {
      out += ('-$fretIndex');
    } else if (fretIndex.length == 2) {
      out += ('-$fretIndex-');
    } else if (fretIndex.length == 1) {
      out += ('-$fretIndex--');
    }
    //out.replaceAll('\n','');
    //print('TAB_STRING => $out');
    return (out);
  }

  static List<String> TABSTANZA_MAP_TO_TABSTANZA_CHORDOPHONE_STRING_LIST(
      Map<int,int> tabStanzaMap) {
    //print('TABSTANZA_MAP_TO_TABSTANZA_STRING_LIST($tabStanzaMap)');
    List<String> tabStanza = [];
    for (int i = 0;
    (i < Chordophone.CHORDOPHONE_STRING_COUNT);
    i++) {
      if (tabStanzaMap[i] != null) {
        tabStanza.add(TAB_STRING(tabStanzaMap[i].toString()));
      } else {
        tabStanza.add(TAB_STRING('-'));
      }
    }
    //print('=> $tabStanza');
    return (tabStanza);
  }

  List<Note>? notes;
  Chordophone? chordophone = Chordophone.fromDefaultStringTuning();

  TabStanza(Chordophone chordophone) {
    notes = [];
    this.chordophone = (chordophone);
  }

  List<String> noteToTabStanzaChordophoneStringList(Note note)
  {
    //print('noteToTabStanzaStringList($note)');
    List<String> out = [];
    Map<int,int> fingerboardCoordinates = (Note
        .NOTE_TO_FINGERBOARD_COORDINATES(chordophone!, note));
    //print('$Note: $fingerboardCoordinates');
    int stringIndex, fretIndex;
    if ((fingerboardCoordinates != null) 
        && (fingerboardCoordinates.length > 0)
    ) {
      stringIndex = (fingerboardCoordinates.entries.first.key);
      fretIndex = (fingerboardCoordinates.entries.first.value);
      for (int i = 0; (i < Chordophone.CHORDOPHONE_STRING_COUNT); i++) {
        out.add((TabStanza.TAB_STRING(
            (i == stringIndex)
                ? (fretIndex.toString())
                : ('-'))));
      }
    }
    //print('=> $outStrList');
    return (out);
  }

  List<Note> get getNotes => (notes!);

  bool? addNote(note) {
    bool? out = false;
    if (isValidNoteAddition(note)) {
      if (note is Note) {
        notes?.add(note);
        out = true;
      } else if (note is String) {
        out = (addNote(Note.TO_NOTE(note)));
      }
    }
    return (out);
  }

  bool noteExists(note) => (NOTE_EXISTS(notes!, note));

  List<String> get getNotesToTablature {
    List<String> out;
    if (notes!.length > 1) {
      out = (TABSTANZA_MAP_TO_TABSTANZA_CHORDOPHONE_STRING_LIST(
          getOfficialTabStanzaChordophoneStringMap));
    } else if (notes!.length == 1){
      out = (NOTE_TO_TABLATURE_STANZA_LIST(chordophone!,notes!.first));
    } else {
      out = (NOTE_TO_TABLATURE_STANZA_LIST(chordophone!,Note.C0));
    }
    return (out);
  }

  @override
  String toString() => (chordophoneStringTabsToString);

  String get chordophoneStringTabsToString {
    String tablatureStanza = ('');
    for (String chordophoneString in getNotesToTablature) {
      tablatureStanza += (chordophoneString);
    }
    return (tablatureStanza);
  }

  bool isValidNoteAddition(note) => ((note is String) 
      ? (isValidNoteAddition(Note.TO_NOTE(note)))
      : ((note != null)
          && (notes!.length <= 1 == true))
          //&& notes.length <= Chordophone.CHORDOPHONE_STRING_COUNT == true);
          //&& !(noteExists(note)) == true
          //&& isThereAvailableChordophoneString(note) == true);
  );
  
  
  Map<int,int> get getOfficialTabStanzaChordophoneStringMap =>
      NOTES_TO_TABSTANZA_MAP(chordophone!, this.notes!);

  List<int>? get openStrings {
    List<int> openStrings = [];
    bool isOpen;
    if (getOfficialTabStanzaChordophoneStringMap != null) {
      for (
      int i = 0;
      i < chordophone!.chordophone_string_tuning_notes.length;
      i++) {
        isOpen = true;
        if (getOfficialTabStanzaChordophoneStringMap
            .containsKey(i)) {
          isOpen = false;
        }
        if (isOpen == true) {
          openStrings.add(i);
        }
      }
    }
    return (openStrings);
  }

  bool? isThereAvailableChordophoneString(Note note)
  {
    bool out = false;
    for (var chordophoneStringIndex in openStrings!) {
      out = (ChordophoneString.
      IS_EXISTANT_NOTE_ON_CHORDOPHONE_STRING(
          note, 
          chordophone!
              .chordophone_strings![
                chordophoneStringIndex
          ]
      ) > -1);
    }
    return (out);
  }
  
}

