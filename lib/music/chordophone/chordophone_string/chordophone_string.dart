import 'package:allegrias/music/chordophone/chordophone.dart';
import 'package:allegrias/music/note/note.dart';

void test() {
  print("TODO: assert()");
}
void main() => test();

class ChordophoneString {

  // fingerboard note/fret
  static int noteTabIndex(
      Note note,
      ChordophoneString chordophoneString
      )
  {
    int out = -1;
    for (
    int i = 0;
    (i < Chordophone.DEFAULT_FINGERBOARD_LENGTH);
    i++) {
      if (chordophoneString
          .getScale[i]
          .toString() == note.toString()) {
        out = (i);
        break;
      }
    }
    //print('=> -1');
    return (out);
  }

  static List<Note> fingerboardPositionNotes(
      int stringLength, Note note)
  {
    List<Note> chordophoneString = [];
    Note focusNote = note;
    for (int i = 0; (i < stringLength); i++) {
      chordophoneString.add(Note.fromNote(focusNote));
      focusNote = (focusNote.sharpen());
    }
    //print('Chordophone String: $chordophone_string');
    return (chordophoneString);
  }

  Note? indexNote;
  int? stringLength;

  ChordophoneString(Note indexNote, int stringLength) {
    this.indexNote = (indexNote);
    this.stringLength = (stringLength);
  }

  ChordophoneString.fromDefaultFingerboardLength(Note indexNote) {
    this.indexNote = (indexNote);
    this.stringLength = (Chordophone.DEFAULT_FINGERBOARD_LENGTH);
  }

  Note get getIndexNote =>
      (this.indexNote!);

  List<Note> get getScale =>
      (fingerboardPositionNotes(
          this.stringLength!,
          this.indexNote!
      ));

  set setIndexNote(Note note) =>
      this.indexNote = (note);

  set setStringLength(int length) =>
      this.stringLength = (length);

  bool noteExistsOnString(Note note) =>
      (noteTabIndex(note, this) != -1);

  int noteExistsAtPosition(Note note) =>
      (noteTabIndex(note, this));

}