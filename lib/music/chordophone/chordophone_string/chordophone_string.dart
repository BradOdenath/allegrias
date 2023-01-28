import 'package:allegrias/music/chordophone/chordophone.dart';
import 'package:allegrias/music/note/note.dart';


class ChordophoneString {

  // fingerboard note/fret
  static int? noteTabIndex(
      Note note,
      ChordophoneString chordophoneString
      )
  {
    int? out;
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
      int chordophoneStringLength, Note note)
  {
    List<Note> chordophoneString = [];
    Note focusNote = note;
    for (int i = 0; (i < chordophoneStringLength); i++) {
      chordophoneString.add(Note.fromNote(focusNote));
      focusNote = (focusNote.sharpen());
    }
    //print('Chordophone String: $chordophone_string');
    return (chordophoneString);
  }

  Note? indexNote;
  int? chordophoneStringLength;

  ChordophoneString({
    this.indexNote,
    this.chordophoneStringLength
  });

  ChordophoneString.fromDefaultFingerboardLength(Note indexNote) {
    this.indexNote = (indexNote);
    this.chordophoneStringLength = (Chordophone.DEFAULT_FINGERBOARD_LENGTH);
  }

  @override
  String toString() => '$indexNote';

  int? noteExistsOnChordophoneString(Note note) =>
      (noteTabIndex(note, this));

  int? noteExistsAtPosition(Note note) =>
      (noteTabIndex(note, this));

  Note get getIndexNote =>
      (this.indexNote!);

  List<Note> get getScale =>
      (fingerboardPositionNotes(
          this.chordophoneStringLength!,
          this.indexNote!
      ));

  set setIndexNote(Note note) =>
      this.indexNote = (note);

  set setChordophoneStringLength(int length) =>
      this.chordophoneStringLength = (length);

}