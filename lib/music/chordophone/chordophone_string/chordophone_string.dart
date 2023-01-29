import 'package:allegrias/commons.dart';
import 'package:allegrias/music/chordophone/chordophone.dart';
import 'package:allegrias/music/note/note.dart';


class ChordophoneString {

  // fingerboard note/fret
  static int noteTabIndex(Note note,
      ChordophoneString chordophoneString) {
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
    print_debug('ChordophoneString.noteTabIndex($note, $chordophoneString)'
        ' => $out');
    return (out);
  }

  static List<Note> fingerboardPositionNotes(int chordophoneStringLength,
      Note note) {
    List<Note> chordophoneString = [];
    Note focusNote = note;
    for (int i = 0; (i < chordophoneStringLength); i++) {
      chordophoneString.add(Note.fromNote(focusNote));
      focusNote = (focusNote.sharpen());
    }
    print_debug('ChordophoneString'
        '.fingerboardPositionNotes($chordophoneStringLength, $note)'
        ' => $chordophoneString');
    return (chordophoneString);
  }

  Note? indexNote;
  int? chordophoneStringPositionCount;

  ChordophoneString(Note indexNote, int chordophoneStringLength) {
    this.setIndexNote = indexNote;
    this.setChordophoneStringLength = chordophoneStringLength;
    print_debug(toStringObject());
  }

  ChordophoneString.fromDefaultFingerboardLength(Note indexNote) {
    this.indexNote = (indexNote);
    this.chordophoneStringPositionCount = (Chordophone.DEFAULT_FINGERBOARD_LENGTH);
    print_debug(toStringObject());
  }

  String toStringObject() =>
      'ChordophoneString($indexNote, $chordophoneStringPositionCount)';

  @override
  String toString() {
    String out = '$indexNote';
    print_debug(toStringObject() + 'toString() => $out');
    return (out);
  }

  int? notePositionOnChordophoneString(Note note) {
    int out = (noteTabIndex(note, this));
    print_debug(toStringObject()
        + '.$notePositionOnChordophoneString($note) => $out');
    return (out);
  }

  Note get getIndexNote {
    Note out = (this.indexNote!);
    print_debug(toStringObject() + '.getIndexNote => $out');
    return (out);
  }

  List<Note> get getScale {
    List<Note> out = (fingerboardPositionNotes(
        this.chordophoneStringPositionCount!,
        this.indexNote!
    ));
    print_debug(toStringObject() + '.getScale => $out');
    return (out);
  }

  set setIndexNote(Note note) {
    String out = (toStringObject() + '.setIndexNote = $note');
    this.indexNote = (note);
    out += (' => ' + toStringObject());
    print_debug(out);
  }

  set setChordophoneStringLength(int length) {
    String out = (toStringObject() + '.setChordophoneStringLength = $length');
    this.chordophoneStringPositionCount = (length);
    out += (' => ' + toStringObject());
    print_debug(out);
  }

}