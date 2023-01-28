import 'package:allegrias/music/chordophone/chordophone_string/chordophone_string_testing.dart';
import 'package:allegrias/music/chordophone/chordophone_testing.dart';
import 'package:allegrias/music/note/note_testing.dart';
import 'package:allegrias/music/tablature/tab_stanza/tab_stanza_testing.dart';
import 'package:allegrias/music/tablature/tablature_testing.dart';

void main() {
  NoteTesting.test();
  ChordophoneTesting.test();
  ChordophoneStringTesting.test();
  TablatureTesting.test();
  TabStanzaTesting.test();
}