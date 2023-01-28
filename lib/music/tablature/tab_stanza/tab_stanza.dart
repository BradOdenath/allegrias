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
    return (out);
  }

  static Map<int,int> notesToTabStanzaMap(
      Chordophone chordophone, List notes) =>
      Chordophone.positionsToChord(
          Chordophone.fingerboardCoordinatesToPositions(
              Note.notesToFingerboardCoordinates(
                  chordophone, Note.toNotes(notes))));

  static String tabChordophoneString(String fretIndex) {
    String out = ('-$fretIndex--');
    out = out.substring(0, (out.length + 1 - fretIndex.length));
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
    return (out);
  }

  List<Note>? notes;
  Chordophone? chordophone = Chordophone.fromStandardGuitarTuning();

  TabStanza(Chordophone chordophone) {
    this.notes = [];
    this.chordophone = (chordophone);
  }

  bool? addNote(note) {
    bool? out = false;
    Note _note = Note.toNote(note);
    if (validNoteAddition(_note)) {
      notes?.add(_note);
      out = true;
    }
    return (out);
  }

  bool noteExists(note) => (Note.noteExists(notes!, note));

  @override
  String toString() => (chordophoneStringTabsToString);

  bool validNoteAddition(note) {
    Note _note = Note.toNote(note);
    bool out =  ((notes!.length <= 1 == true)
        //&& notes.length <= Chordophone.CHORDOPHONE_STRING_COUNT == true);
        //&& !(noteExists(note)) == true
        //&& isThereAvailableChordophoneString(note) == true);
    );
    print_debug("$this.........");
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
      )! >= 0);
    }
    return (out);
  }

  List<Note> get getNotes => (notes!);

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
    return (out);
  }
  
  Map<int,int> get getOfficialTabStanzaChordophoneStringMap =>
      notesToTabStanzaMap(chordophone!, this.notes!);

  String get chordophoneStringTabsToString {
    String tablatureStanza = ('');
    for (String chordophoneString in getNotesToTablature) {
      tablatureStanza += (chordophoneString);
    }
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
    return (openChordophoneStrings);
  }
  
}

