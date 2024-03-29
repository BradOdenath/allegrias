import 'package:allegrias/commons.dart';
import 'package:allegrias/music/chordophone/'
    'chordophone_string/chordophone_string.dart';
import 'package:allegrias/music/note/note.dart';
import 'package:flutter/material.dart';


class Chordophone {
  static const int DEFAULT_FINGERBOARD_LENGTH = 24;

  static const Map<dynamic, int> DEFAULT_FINGERBOARD_LENGTHS = const {
    'Classical': 19, //
    'Dreadnought': 21,
    'Broomstick': 15, // Martin Backpacker
    'Shred24': 24,
    'Shred36': 36,
    'TrollMartin': 5, // Maybe 7
    'Martin18': 18,
  };

  static Map<int,int> STRING_FRET_LENGTHS(eye) {
    Map<int,int> out = DEFAULT_STRING_FRET_LENGTHS;
    if (eye is Map<int,int>) out = eye;
    else for (int i = 1; i < 6; i++) out.addAll({i:eye});
    return out;
  }

  static const Map<int,int> DEFAULT_STRING_FRET_LENGTHS = const {
    1: 19,
    2: 19,
    3: 17,
    4: 17,
    5: 19,
    6: 19
  };

  ///TODO: Map This All

  static const String
  DEFAULT_CHORDOPHONE_TUNING_NAME = 'Default';

  static const List<String> DEFAULT_CHORDOPHONE_TUNING = [
    //'D#4', 'A#3', 'F#3', 'C#3', 'G#2', 'D#2', 'A#1', 'F#1', 'C#1', 'G#0'
    //'D4', 'A3', 'F3', 'C3', 'G2', 'D2'//, 'A1', 'F1', 'C1', 'G0'
    //'F6', 'C6', 'G#5', 'D#5', 'A#4',
    'E4', 'B3', 'G3', 'D3', 'A2', 'E2', 'B1', 'F#1'//, 'C#1', 'G#0'
  ];


  static const String STANDARD_TEN_STRING_GUITAR_TUNING_NAME = '10 String Guitar';

  static const List<String> STANDARD_TEN_STRING_GUITAR_TUNING = [
    'E4', 'B3', 'G3', 'D3', 'A2', 'E2', 'B1', 'F#1', 'C#1', 'G#0'
  ];


  static const String STANDARD_SEVEN_STRING_GUITAR_TUNING_NAME = '7 String Guitar';

  static const List<String> STANDARD_SEVEN_STRING_GUITAR_TUNING = [
    'E4', 'B3', 'G3', 'D3', 'A2', 'E2', 'B1'
  ];


  static const String STANDARD_GUITAR_TUNING_NAME = 'Guitar';

  static const List<String> STANDARD_GUITAR_TUNING = [
    'E4', 'B3', 'G3', 'D3', 'A2', 'E2'
  ];


  static const String STANDARD_UKULELE_TUNING_NAME = 'Ukulele';

  static const List<String> STANDARD_UKULELE_TUNING = [
    'G4', 'C4', 'E4', 'A4'
  ];


  static const String STANDARD_VIOLIN_TUNING_NAME = 'Violin';

  static const List<String> STANDARD_VIOLIN_TUNING = [
    'E5', 'A4', 'D4', 'G3'
  ];


  static const String STANDARD_VIOLA_TUNING_NAME = 'Viola';

  static const List<String> STANDARD_VIOLA_TUNING = [
    'A4', 'D4', 'G3', 'C3'
  ];


  static const String STANDARD_CELLO_TUNING_NAME = 'Cello';

  static const List<String> STANDARD_CELLO_TUNING = [
    'A3', 'D3', 'G2', 'C2'
  ];


  static const String STANDARD_SIX_STRING_BASS_TUNING_NAME = '6 String Bass';

  static const List<String> STANDARD_SIX_STRING_BASS_TUNING = [
    'C3', 'G2', 'D2', 'A1', 'E1', 'B0'
  ];


  static const String STANDARD_FIVE_STRING_BASS_TUNING_NAME = '5 String Bass';

  static const List<String> STANDARD_FIVE_STRING_BASS_TUNING = [
    'G2', 'D2', 'A1', 'E1', 'B0'
  ];


  static const String STANDARD_BASS_TUNING_NAME = 'Bass';

  static const List<String> STANDARD_BASS_TUNING = [
    'G2', 'D2', 'A1', 'E1'
  ];


  static const String ZHONG_RUAN_A_TUNING_NAME = 'Zhong Ruan (A)';

  static const List<String> ZHONG_RUAN_A_TUNING = [
    'D4', 'G3', 'D3', 'G2'
  ];


  static const String ZHONG_RUAN_B_TUNING_NAME = 'Zhong Ruan (B)';

  static const List<String> ZHONG_B_RUAN_TUNING = [
    'D4', 'A3', 'D3', 'A2'
  ];


  static const String ZHONG_RUAN_C_TUNING_NAME = 'Zhong Ruan (C)';

  static const List<String> ZHONG_C_RUAN_TUNING = [
    'E4', 'A3', 'D3', 'G2'
  ];


  static const String DA_RUAN_A_TUNING_NAME = 'Da Ruan (A)';

  static const List<String> DA_RUAN_A_TUNING = [
    'A3', 'D3', 'A2', 'D2'
  ];


  static const String DA_RUAN_B_TUNING_NAME = 'Da Ruan (B)';

  static const List<String> DA_B_RUAN_TUNING = [
    'A3', 'D3', 'G2', 'C2'
  ];


  static const String DA_RUAN_C_TUNING_NAME = 'Da Ruan (C)';

  static const List<String> DA_C_RUAN_TUNING = [
    'G3', 'D3', 'G2', 'D2'
  ];


  static const String EHRU_TUNING_NAME = 'Ehru';

  static const List<String> EHRU_TUNING = [
    'A4', 'D4'
  ];


  static const String PIPA_TUNING_NAME = 'Pipa';

  static const List<String> PIPA_TUNING = [
    'A3', 'E3', 'D3', 'A2'
  ];


  static const String OUD_A_TUNING_NAME = 'Oud (A)';

  static const List<String> OUD_A_TUNING = [
    'C4', 'G3', 'D3', 'A2', 'F2', 'C2'
  ];


  static const String OUD_B_TUNING_NAME = 'Oud (B)';

  static const List<String> OUD_B_TUNING = [
    'C4', 'G3', 'D3', 'A2', 'F2', 'C2'
  ];


  static const String ARABIC_OUD_A_TUNING_NAME = 'Arabic Oud (A)';

  static const List<String> ARABIC_OUD_A_TUNING = [
    'C4', 'G3', 'D3', 'A2', 'F2', 'C2'
  ];


  static const String ARABIC_OUD_B_TUNING_NAME = 'Arabic Oud (B)';

  static const List<String> ARABIC_OUD_B_TUNING = [
    'F4', 'C4', 'G3', 'D3', 'A2', 'F2'
  ];


  static const String ARABIC_OUD_C_TUNING_NAME = 'Arabic Oud (C)';

  static const List<String> ARABIC_OUD_C_TUNING = [
    'C4', 'G3', 'D3', 'A2', 'G2', 'D2'
  ];


  static const String OTTOMAN_OUD_TUNING_NAME = 'Ottoman Oud';

  static const List<String> OTTOMAN_OUD_TUNING = [
    'D4', 'A3', 'E3', 'B2', 'G2', 'D2'
  ];


  static const String TURKISH_OUD_TUNING_NAME = 'Turkish Oud';

  static const List<String> TURKISH_OUD_TUNING = [
    'D4', 'A3', 'E3', 'B2', 'G2', 'D2'
  ];


  static const String
  TURKISH_CLASSICAL_OUD_A_TUNING_NAME = 'Turkish Classical Oud (A)';

  static const List<String> TURKISH_CLASSICAL_OUD_A_TUNING = [
    'D4', 'A3', 'E3', 'B2', 'F#2', 'C#2'
  ];


  static const String
  TURKISH_CLASSICAL_OUD_B_TUNING_NAME = 'Turkish Classical Oud (B)';

  static const List<String> TURKISH_CLASSICAL_OUD_B_TUNING = [
    'D4', 'A3', 'E3', 'B2', 'F#2', 'D2'
  ];


  /// TODO: Modify the dart language with const list contain const elements.
  static const List<String> chordophoneTunings = [
    Chordophone.DEFAULT_CHORDOPHONE_TUNING_NAME,
    Chordophone.STANDARD_TEN_STRING_GUITAR_TUNING_NAME,
    Chordophone.STANDARD_SEVEN_STRING_GUITAR_TUNING_NAME,
    Chordophone.STANDARD_GUITAR_TUNING_NAME,
    Chordophone.STANDARD_UKULELE_TUNING_NAME,
    Chordophone.STANDARD_VIOLIN_TUNING_NAME,
    Chordophone.STANDARD_VIOLA_TUNING_NAME,
    Chordophone.STANDARD_CELLO_TUNING_NAME,
    Chordophone.STANDARD_SIX_STRING_BASS_TUNING_NAME,
    Chordophone.STANDARD_FIVE_STRING_BASS_TUNING_NAME,
    Chordophone.STANDARD_BASS_TUNING_NAME,
    Chordophone.ZHONG_RUAN_A_TUNING_NAME,
    Chordophone.ZHONG_RUAN_B_TUNING_NAME,
    Chordophone.ZHONG_RUAN_C_TUNING_NAME,
    Chordophone.DA_RUAN_A_TUNING_NAME,
    Chordophone.DA_RUAN_B_TUNING_NAME,
    Chordophone.DA_RUAN_C_TUNING_NAME,
    Chordophone.EHRU_TUNING_NAME,
    Chordophone.PIPA_TUNING_NAME,
    Chordophone.OUD_A_TUNING_NAME,
    Chordophone.OUD_B_TUNING_NAME,
    Chordophone.ARABIC_OUD_A_TUNING_NAME,
    Chordophone.ARABIC_OUD_B_TUNING_NAME,
    Chordophone.ARABIC_OUD_C_TUNING_NAME,
    Chordophone.OTTOMAN_OUD_TUNING_NAME,
    Chordophone.TURKISH_OUD_TUNING_NAME,
    Chordophone.TURKISH_CLASSICAL_OUD_A_TUNING_NAME,
    Chordophone.TURKISH_CLASSICAL_OUD_B_TUNING_NAME,
  ];
  static Map<String,List<String>> get chordophoneMapTunings =>
      Map.fromIterables(
          Chordophone.chordophoneTunings,
          Chordophone.chordophoneTuningsFromString as Iterable<List<String>>
      );


  /// TODO: Figure this out
  //static List<String> get chordophoneTuningsFromString =>
  //    (for (int i = 0; i <= chordophoneTunings.length; i++) chordophoneTuningFromString(chordophoneTunings[i]));

  static List<String> get chordophoneTuningsFromString {
    List<String> out = [];
    for (int i = 0; i <= chordophoneTunings.length; i++) chordophoneTuningFromString(chordophoneTunings[i]);
    return out;
  }


  static List<String> chordophoneTuningFromString(
      String chordophoneStringTuning) {
    List<String> out;
    switch (chordophoneStringTuning) {
      case (Chordophone.STANDARD_TEN_STRING_GUITAR_TUNING_NAME):
        out = Chordophone.STANDARD_TEN_STRING_GUITAR_TUNING;
        break;
      case (Chordophone.STANDARD_SEVEN_STRING_GUITAR_TUNING_NAME):
        out = Chordophone.STANDARD_SEVEN_STRING_GUITAR_TUNING;
        break;
      case (Chordophone.STANDARD_GUITAR_TUNING_NAME):
        out = Chordophone.STANDARD_GUITAR_TUNING;
        break;
      case (Chordophone.STANDARD_UKULELE_TUNING_NAME):
        out = Chordophone.STANDARD_UKULELE_TUNING;
        break;
      case (Chordophone.STANDARD_VIOLIN_TUNING_NAME):
        out = Chordophone.STANDARD_VIOLIN_TUNING;
        break;
      case (Chordophone.STANDARD_VIOLA_TUNING_NAME):
        out = Chordophone.STANDARD_VIOLA_TUNING;
        break;
      case (Chordophone.STANDARD_CELLO_TUNING_NAME):
        out = Chordophone.STANDARD_CELLO_TUNING;
        break;
      case (Chordophone.STANDARD_SIX_STRING_BASS_TUNING_NAME):
        out = Chordophone.STANDARD_SIX_STRING_BASS_TUNING;
        break;
      case (Chordophone.STANDARD_FIVE_STRING_BASS_TUNING_NAME):
        out = Chordophone.STANDARD_FIVE_STRING_BASS_TUNING;
        break;
      case (Chordophone.STANDARD_BASS_TUNING_NAME):
        out = Chordophone.STANDARD_BASS_TUNING;
        break;
      case (Chordophone.ZHONG_RUAN_A_TUNING_NAME):
        out = Chordophone.ZHONG_RUAN_A_TUNING;
        break;
      case (Chordophone.ZHONG_RUAN_B_TUNING_NAME):
        out = Chordophone.ZHONG_B_RUAN_TUNING;
        break;
      case (Chordophone.ZHONG_RUAN_C_TUNING_NAME):
        out = Chordophone.ZHONG_C_RUAN_TUNING;
        break;
      case (Chordophone.DA_RUAN_A_TUNING_NAME):
        out = Chordophone.DA_RUAN_A_TUNING;
        break;
      case (Chordophone.DA_RUAN_B_TUNING_NAME):
        out = Chordophone.DA_B_RUAN_TUNING;
        break;
      case (Chordophone.DA_RUAN_C_TUNING_NAME):
        out = Chordophone.DA_C_RUAN_TUNING;
        break;
      case (Chordophone.EHRU_TUNING_NAME):
        out = Chordophone.EHRU_TUNING;
        break;
      case (Chordophone.PIPA_TUNING_NAME):
        out = Chordophone.PIPA_TUNING;
        break;
      case (Chordophone.OUD_A_TUNING_NAME):
        out = Chordophone.OUD_A_TUNING;
        break;
      case (Chordophone.OUD_B_TUNING_NAME):
        out = Chordophone.OUD_B_TUNING;
        break;
      case (Chordophone.ARABIC_OUD_A_TUNING_NAME):
        out = Chordophone.ARABIC_OUD_A_TUNING;
        break;
      case (Chordophone.ARABIC_OUD_B_TUNING_NAME):
        out = Chordophone.ARABIC_OUD_B_TUNING;
        break;
      case (Chordophone.ARABIC_OUD_C_TUNING_NAME):
        out = Chordophone.ARABIC_OUD_C_TUNING;
        break;
      case (Chordophone.OTTOMAN_OUD_TUNING_NAME):
        out = Chordophone.OTTOMAN_OUD_TUNING;
        break;
      case (Chordophone.TURKISH_OUD_TUNING_NAME):
        out = Chordophone.TURKISH_OUD_TUNING;
        break;
      case (Chordophone.TURKISH_CLASSICAL_OUD_A_TUNING_NAME):
        out = Chordophone.TURKISH_CLASSICAL_OUD_A_TUNING;
        break;
      case (Chordophone.TURKISH_CLASSICAL_OUD_B_TUNING_NAME):
        out = Chordophone.TURKISH_CLASSICAL_OUD_B_TUNING;
        break;
      default:
        out = Chordophone.DEFAULT_CHORDOPHONE_TUNING;
    }
    return (out);
  }


  /// TODO: Implement this to writing efficient tablature.
  static const int DEFAULT_POSITION_RANGE = 5;


  static List<Map<int, int>> fingerboardCoordinatesToPositions(
      Map<Note, Map<int, int>> fingerboardCoordinatesNoteMap) {
    List<Map<int, int>> positionGroups = [];
    fingerboardCoordinatesNoteMap.forEach((note, fingerboardCoordinates) {
      fingerboardCoordinates.forEach((chordophoneStringIndex, positionIndex) {
        for (var positionGroup in positionGroups) {
          if (!positionGroup.containsKey(chordophoneStringIndex)) {
            if (indexInRangeOfPositions(positionGroup, positionIndex)!) {
              positionGroup.addAll({chordophoneStringIndex: positionIndex});
            } else {
              positionGroups.add({chordophoneStringIndex: positionIndex});
            }
          } else {
            positionGroups.add({chordophoneStringIndex: positionIndex});
          }
        }
      });
    });
    print_debug('Chordophone.fingerboardCoordinatesToPositions'
        '($fingerboardCoordinatesNoteMap) => $positionGroups');
    return (positionGroups);
  }


  static bool? indexInRangeOfPositions(Map<int, int> positions,
      int positionIndex) {
    bool out = true;
    positions.forEach((_, pos) {
      if (pos - positionIndex.abs() < DEFAULT_POSITION_RANGE) {
        //New positionIndex is out of Range of other positions
        out = false;
      }
    });
    print_debug('Chordophone'
        '.indexInRangeOfPositions($positions, $positionIndex) => $out');
    return (out);
  }


  static Map<int, int> positionsToChord(List<Map<int, int>> positionGroups) {
    Map<int, int> chordophoneChord = {};
    positionGroups.forEach((map) {
      if (map.length > chordophoneChord.length) {
        chordophoneChord = map;
      }
    });
    print_debug('Note'
        '.positionToChord($positionGroups) => $chordophoneChord');
    return (chordophoneChord);
  }


  static List<ChordophoneString> chordophoneStrings(
      List chordophoneStringTuning) {
    List<ChordophoneString> chordophoneStrings = [];
    if (chordophoneStringTuning is List<ChordophoneString>) {
      chordophoneStrings = chordophoneStringTuning;
    } else if ((chordophoneStringTuning is List<Note>)
        || (chordophoneStringTuning is List<String>)) {
      List<Note> _chordophoneStringTuning = Note
          .toNotes(chordophoneStringTuning);
      for (int i = 0; (i < _chordophoneStringTuning.length); i++) {
        chordophoneStrings
            .add(ChordophoneString
            .fromDefaultFingerboardLength(_chordophoneStringTuning[i]));
      }
    }
    print_debug('Chordophone'
        '.chordophoneStrings($chordophoneStringTuning) => $chordophoneStrings');
    return (chordophoneStrings);
  }

  List? chordophoneStringTuning = [];
  
  Chordophone({this.chordophoneStringTuning});

  Chordophone.fromDefaultChordophoneTuning() {
    this.setChordophoneStringTuning = (DEFAULT_CHORDOPHONE_TUNING);
    print_debug('Chordophone.fromDefaultChordophoneTuning() => $this');
  }

  Chordophone.fromStandardTenStringGuitarTuning() {
    this.setChordophoneStringTuning = (STANDARD_TEN_STRING_GUITAR_TUNING);
    print_debug('Chordophone.fromStandardTenStringGuitarTuning() => $this');
  }

  Chordophone.fromStandardSevenStringGuitarTuning() {
    this.setChordophoneStringTuning = (STANDARD_SEVEN_STRING_GUITAR_TUNING);
    print_debug('Chordophone.fromStandardSevenStringGuitarTuning() => $this');
  }

  Chordophone.fromStandardGuitarTuning() {
    this.setChordophoneStringTuning = (STANDARD_GUITAR_TUNING);
    print_debug('Chordophone.fromStandardGuitarTuning() => $this');
  }

  Chordophone.fromStandardUkuleleTuning() {
    this.setChordophoneStringTuning = (STANDARD_UKULELE_TUNING);
    print_debug('Chordophone.fromStandardUkuleleTuning() => $this');
  }

  Chordophone.fromStandardViolinTuning() {
    this.setChordophoneStringTuning = (STANDARD_VIOLIN_TUNING);
    print_debug('Chordophone.fromStandardViolinTuning() => $this');
  }


  Chordophone.fromStandardViolaTuning() {
    this.setChordophoneStringTuning = (STANDARD_VIOLA_TUNING);
    print_debug('Chordophone.fromStandardViolaTuning() => $this');
  }


  Chordophone.fromStandardCelloTuning() {
    this.setChordophoneStringTuning = (STANDARD_CELLO_TUNING);
    print_debug('Chordophone.fromStandardCelloTuning() => $this');
  }


  Chordophone.fromStandardSixStringBassTuning() {
    this.setChordophoneStringTuning = (STANDARD_SIX_STRING_BASS_TUNING);
    print_debug('Chordophone.fromStandardSixStringBassTuning() => $this');
  }


  Chordophone.fromStandardFiveStringBassTuning() {
    this.setChordophoneStringTuning = (STANDARD_FIVE_STRING_BASS_TUNING);
    print_debug('Chordophone.fromStandardFiveStringBassTuning() => $this');
  }


  Chordophone.fromStandardBassTuning() {
    this.setChordophoneStringTuning = (STANDARD_BASS_TUNING);
    print_debug('Chordophone.fromStandardBassTuning() => $this');
  }


  Chordophone.fromStringTuning(String chordophoneStringTuning) {
    setChordophoneStringTuning = chordophoneTuningFromString(
        chordophoneStringTuning);
  }


  @override
  String toString() =>
      ('Chordophone'
          '(' + this.chordophoneStringTuning.toString() + ')');


  int get getChordophoneStringCount {
    int out = (chordophoneStringTuning!.length);
    print_debug('$this.getChordophoneStringCount => $out');
    return (out);
  }


  List<Note> get getChordophoneStringTuning {
    List<Note> out = (Note.toNotes(chordophoneStringTuning!));
    print_debug('$this.getChordophoneStringTuning => $out');
    return (out);
  }


  List<ChordophoneString> get getChordophoneStrings {
    List<ChordophoneString> out =
    (chordophoneStrings(getChordophoneStringTuning));
    print_debug('$this.getChordophoneStrings => $out');
    return (out);
  }


  set setChordophoneStringTuning(chordophoneStringTuning) {
    String out;
    out = ('$this.setChordophoneStringTuning = $chordophoneStringTuning');
    if (chordophoneStringTuning is List<String>) {
      this.chordophoneStringTuning = chordophoneStringTuning;
    } else if (chordophoneStringTuning is String) {
      setChordophoneStringTuning = chordophoneTuningFromString(
          chordophoneStringTuning);
    }
    out += (' => $this');
    print_debug(out);
  }


}
