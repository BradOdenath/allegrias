import 'package:allegrias/music/chordophone/chordophone.dart';
import 'package:allegrias/music/chordophone/'
    'chordophone_string/chordophone_string.dart';
import 'package:allegrias/music/note/note.dart';

void test() {
  print("TODO: assert()");
}
void main() => test();

class TabStanza {
  static List<String> noteToTabStanzaList(
      Chordophone chordophone,
      Note note)
  {
    List<String> out = [];
    bool chordophoneBool = true;
    for (ChordophoneString chordophoneString
    in (chordophone.getStrings!)) {
      List<Note> chordophoneStringScale = (chordophoneString
          .getScale);
      for (int j = 0;
      (j < chordophoneStringScale.length);
      j++)
      {
        Note chordophoneNote = chordophoneStringScale[j];
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
    return (out);
  }

  static bool noteExists(List<Note> noteList, objNote) {
    //print('NOTE_EXISTS($noteList, $objNote)');
    bool out = false;
    Note focusNote;
    focusNote = (Note.toNote(objNote));
    for (Note note in noteList) {
      if (note == focusNote) {
        out = true;
      }
    }
    return (out);
  }

  static Map<int,int> notesToTabStanzaMap(
      Chordophone chordophone, List<Note> notes) =>
      Chordophone.positionsToChord(
          Chordophone.fingerboardCoordinatesToPositions(
              Note.notesToFingerboardCoordinates(
                  chordophone, notes)));

  static String tabString(String fretIndex) {
    //print('tabString(String $fretIndex)');
    String out = ('-$fretIndex--');
    out = out.substring(0, (out.length + 1 - fretIndex.length));
    return (out);
  }

  static List<String> tabStanzaMapToTabStanzaList(
      Map<int,int> tabStanzaMap
      )
  {
    List<String> tabStanza = [];
    for (int i = 0;
    (i < Chordophone.chordophoneStringCount);
    i++) {
      if (tabStanzaMap[i] != null) {
        tabStanza.add(tabString(tabStanzaMap[i].toString()));
      } else {
        tabStanza.add(tabString('-'));
      }
    }
    return (tabStanza);
  }

  List<Note>? notes;
  Chordophone? chordophone = Chordophone.fromDefaultChordophoneStringTuning();

  TabStanza(Chordophone chordophone) {
    notes = [];
    this.chordophone = (chordophone);
  }

  List<String> noteToTabStanzaChordophoneStringList(Note note)
  {
    //print('noteToTabStanzaStringList($note)');
    List<String> out = [];
    Map<int,int> fingerboardCoordinates = (Note
        .fingerboardCoordinates(chordophone!, note));
    //print('$Note: $fingerboardCoordinates');
    int stringIndex, fretIndex;
    if (fingerboardCoordinates.length > 0) {
      stringIndex = (fingerboardCoordinates.entries.first.key);
      fretIndex = (fingerboardCoordinates.entries.first.value);
      for (int i = 0; (i < Chordophone.chordophoneStringCount); i++) {
        out.add((TabStanza.tabString(
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
        out = (addNote(Note.toNote(note)));
      }
    }
    return (out);
  }

  bool isExistentNote(note) => (noteExists(notes!, note));

  List<String> get getNotesToTablature {
    List<String> out;
    if (notes!.length > 1) {
      out = (tabStanzaMapToTabStanzaList(
          getOfficialTabStanzaChordophoneStringMap));
    } else if (notes!.length == 1){
      out = (noteToTabStanzaList(chordophone!,notes!.first));
    } else {
      out = (noteToTabStanzaList(chordophone!,Note.C0));
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
      ? (isValidNoteAddition(Note.toNote(note)))
      : ((note != null)
          && (notes!.length <= 1 == true))
          //&& notes.length <= Chordophone.CHORDOPHONE_STRING_COUNT == true);
          //&& !(noteExists(note)) == true
          //&& isThereAvailableChordophoneString(note) == true);
  );
  
  
  Map<int,int> get getOfficialTabStanzaChordophoneStringMap =>
      notesToTabStanzaMap(chordophone!, this.notes!);

  List<int>? get openStrings {
    List<int> openStrings = [];
    bool isOpen;
    for (
    int i = 0;
    i < chordophone!.getTuning.length;
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
    return (openStrings);
  }

  bool? isThereAvailableChordophoneString(Note note)
  {
    bool out = false;
    for (var chordophoneStringIndex in openStrings!) {
      out = (ChordophoneString.
      noteTabIndex(
          note, 
          chordophone!
              .getStrings![
                chordophoneStringIndex
          ]
      ) > -1);
    }
    return (out);
  }
  
}

