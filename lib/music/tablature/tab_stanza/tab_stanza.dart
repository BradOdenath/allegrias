import 'package:allegrias/commons.dart';
import 'package:allegrias/music/chordophone/chordophone.dart';
import 'package:allegrias/music/chordophone/'
    'chordophone_string/chordophone_string.dart';
import 'package:allegrias/music/note/note.dart';

class TabStanza {
  static List<String> noteToTabStanzaList(
      Chordophone chordophone,
      Note note)
  {
    List<String> out = [];
    bool chordophoneBool = true;
    for (ChordophoneString chordophoneString
    in (chordophone.getChordophoneStrings)) {
      List<Note> chordophoneStringScale = (chordophoneString.getScale);
      for (int j = 0; (j < chordophoneStringScale.length); j++)
      {
        Note chordophoneNote = chordophoneStringScale[j];
        if (chordophoneBool == false) {
          out.add('---');
          break;
        }
        if (chordophoneNote == note) {
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
    print_debug('TabStanza.noteToTabStanzaList($chordophone, $note) => $out');
    return (out);
  }

  static Map<int,int> notesToTabStanzaMap(
      Chordophone chordophone, List notes) {
    Map<int,int> out = Chordophone.positionsToChord(
        Chordophone.fingerboardCoordinatesToPositions(
            Note.notesToFingerboardCoordinates(
                chordophone, Note.toNotes(notes))));
    print_debug('TabStanza.notesToTabStanzaMap($chordophone, $notes) => $out');
    return (out);
  }
  static String tabChordophoneString(String fretIndex) {
    String out = ('-$fretIndex--');
    out = out.substring(0, (out.length + 1 - fretIndex.length));
    print_debug('TabStanza.tabChordophoneString($fretIndex) => $out');
    return (out);
  }

  static List<String> tabStanzaMapToTabStanzaList(
      Map<int,int> tabStanzaMap, Chordophone chordophone
      )
  {
    List<String> tabStanza = [];
    for (int i = 0;
    (i < chordophone.getChordophoneStringCount);
    i++) {
      if (tabStanzaMap[i] != null) {
        tabStanza.add(tabChordophoneString(tabStanzaMap[i].toString()));
      } else {
        tabStanza.add(tabChordophoneString('-'));
      }
    }
    print_debug('TabStanza'
        '.tabStanzaMapToTabStanzaList($tabStanzaMap, $chordophone) '
        '=> $tabStanza');
    return (tabStanza);
  }

  static List<String> noteToTabStanzaChordophoneStringList(Chordophone chordophone, Note note)
  {
    List<String> out = [];
    Map<int,int> fingerboardCoordinates = (Note
        .fingerboardCoordinates(chordophone, note));
    //print('$Note: $fingerboardCoordinates');
    int chordophoneStringIndex, fretIndex;
    if (fingerboardCoordinates.length > 0) {
      chordophoneStringIndex = (fingerboardCoordinates.entries.first.key);
      fretIndex = (fingerboardCoordinates.entries.first.value);
      for (int i = 0; (i < chordophone.getChordophoneStringCount); i++) {
        out.add((TabStanza.tabChordophoneString(
            (i == chordophoneStringIndex)
                ? (fretIndex.toString())
                : ('-'))));
      }
    }
    print_debug('TabStanza'
        '.noteToTabStanzaChordophoneStringList($chordophone, $note) => $out');
    return (out);
  }

  List<Note>? notes;
  Chordophone? chordophone = Chordophone.fromStandardGuitarTuning(); // <_<

  /// TODO: May delete this class and merge it with Tablature
  TabStanza(Chordophone chordophone) {
    this.notes = [];
    this.chordophone = (chordophone);
    print_debug('TabStanza($chordophone) => ' + toStringObject());
  }

  bool? addNote(note) {
    bool? out = false;
    Note _note = Note.toNote(note);
    if (validNoteAddition(_note)) {
      notes?.add(_note);
      out = true;
    }
    print_debug(toStringObject() + '.addNote($note) => $out');
    return (out);
  }

  bool noteExists(note) {
    bool out = (Note.noteExists(notes!, note));
    print_debug(toStringObject() + '.noteExists($note) => $out');
    return (out);
  }
  String toStringObject() => 'TabStanza($getNotes, $getChordophone)';

  @override
  String toString() {
    String out = (getChordophoneStringTabsToString);
    print_debug(toStringObject() + '.toString() => $out');
    return (out);
  }

  bool validNoteAddition(note) {
    Note _note = Note.toNote(note); // >_>
    bool out =  ((notes!.length <= 1)
        //&& notes.length <= Chordophone.CHORDOPHONE_STRING_COUNT == true);
        //&& !(noteExists(note)) == true
        //&& isThereAvailableChordophoneString(note) == true);
    );
    print_debug(toStringObject() + '.ValidNoteAddition($note) => $out');
    return out;
  }

  bool? availableChordophoneString(Note note) {
    bool out = false;
    for (var chordophoneStringIndex in getOpenChordophoneStrings!) {
      out = (ChordophoneString.
      noteTabIndex(
          note,
          chordophone!
              .getChordophoneStrings[
          chordophoneStringIndex
          ]
      ) >= 0);
    }
    print_debug(toStringObject() + '.availableChordophoneString($note) => $out');
    return (out);
  }

  List<Note> get getNotes {
    List<Note> out = (notes!);
    print_debug(toStringObject() + '.getNotes => $out');
    return (out);
  }

  List<String> get getNotesToTablature {
    List<String> out;
    if (notes!.length > 1) {
      out = (tabStanzaMapToTabStanzaList(
          getOfficialTabStanzaChordophoneStringMap, this.chordophone!));
    } else if (notes!.length == 1){
      out = (noteToTabStanzaList(chordophone!,notes!.first));
    } else {
      out = (noteToTabStanzaList(chordophone!,Note.C0));
    }
    print_debug(toStringObject() + '.getNotesToTablature => $out');
    return (out);
  }
  
  Map<int,int> get getOfficialTabStanzaChordophoneStringMap {
    Map<int,int> out = notesToTabStanzaMap(chordophone!, this.notes!);
    print_debug(toStringObject() + '.getOfficialTabStanzaChordophoneStringMap => $out');
    return (out);
  }

  String get getChordophoneStringTabsToString {
    String tablatureStanza = ('');
    for (String chordophoneString in getNotesToTablature) {
      tablatureStanza += (chordophoneString);
    }
    print_debug(toStringObject()
        + '.getChordophoneStringTabsToString => $tablatureStanza');
    return (tablatureStanza);
  }

  List<int>? get getOpenChordophoneStrings {
    List<int> openChordophoneStrings = [];
    bool isOpen;
    for (
    int i = 0;
    i < chordophone!.getChordophoneStringTuning.length;
    i++) {
      isOpen = true;
      if (getOfficialTabStanzaChordophoneStringMap
          .containsKey(i)) {
        isOpen = false;
      }
      if (isOpen == true) {
        openChordophoneStrings.add(i);
      }
    }
    print_debug(toStringObject()
        + '.getOpenChordophoneStrings => $openChordophoneStrings');
    return (openChordophoneStrings);
  }

  Chordophone? get getChordophone {
    print_debug(toStringObject() + '.getChordophone => $chordophone');
    return (chordophone);
  }

  set setChordophone(Chordophone chordophone) {
    String out = (toStringObject() + '.setChordophone = $chordophone');
    this.chordophone = chordophone;
    out += (' => ' + toStringObject());
    print_debug(out);
  }

}

