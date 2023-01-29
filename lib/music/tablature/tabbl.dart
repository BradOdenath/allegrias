/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Guitar.dart';
import '../note/Note.dart';

class Tabbl {

  List<String> notez = [];
  List<List<String>> tabz = [];
  String output = '';

  String get getNotezToString => notez.toString();

  static int get getGuitarStringCount => Guitar.GUITAR_STRING_TUNING.length; //GUITAR_NECK.length;

  String addNote(String note) {
    if (notez.length >= getGuitarStringCount || shouldReplain(note)) {
      compileNotez();
      clearNotez();
    } else {
      notez.add(note);
      compileNotez();
    }
    //print(output);
    return output;
  }

  String tabzToTabStrings() {
    int count = 16;
    if (tabz.length <= count || tabz == null) {
      count = tabz.length;
    }
    List<String> outGTRSTR = List(tabz[0].length);
    String outString = '';
    for (int j = 0; j < getGuitarStringCount; j++) {
      outGTRSTR[j] = '';
      for (int i = tabz.length-count; i < tabz.length; i++) {
        outGTRSTR[j] += tabz[i][j].toString();
      }
    }
    outString += GUITAR_STRINGS_TO_STRING(outGTRSTR);
    return outString;
  }

  bool shouldReplain(String note) {
    if (notez.length >= 2) {

      for (int i = 0; i < getGuitarStringCount; i++) {
        print('i$i');
        for (int j = 0; j < GUITAR_NECK[i].length; j++) {
          print('j$j');
          var noteMap = NOTE_TO_GUITAR_STRING_FRET_DATAMAP(note);
          for (int k = 0; k < notez.length; k++) {
            print('k$k');
            var noatMap = NOTE_TO_GUITAR_STRING_FRET_DATAMAP(notez[k]);
            print(noatMap.toString()+'\n'+noteMap.toString());
            for (var noteKey in noteMap.keys) {
              for (var noatKey in noatMap.keys) {
                print('do you even fuck bro?');
                if (noteKey.hashCode == noatKey.hashCode) {
                  print('two notes on the same string');
                  return true;
                }
              }
            }
            if (k < notez.length-1) {
              if (notez[k].hashCode == notez[k+1].hashCode) {
                print('duplicate notes');
                return true;
              }
            }
          }
        }
      }
    } else {
      print('Notez:$notez');
    }
    print('Note:\t$note\nNotez:\t$notez');
    return false;
  }

  String compileNotez() {
    var tab = NOTES_TO_TABULATURE_STRINGS(notez);
    tabz.add(tab);
    output = tabzToTabStrings();
    if (output == null) {
      output = GUITAR_STRINGS_TO_STRING(tab);
    }
    return output;
  }

  void clearNotez() {
    notez = [];
  }

  Tabbl();

  static Map<int,int> NOTE_TO_GUITAR_STRING_FRET_DATAMAP(String note) {
    Map<int,int> outMap = NOTE_TO_STRING_FRET_DATA_MAP(note);

    /*
    for (int i = 0; i < getGuitarStringCount; i++) {
      for (int j = 0; j < GUITAR_NECK[i].length; j++) {
        if (GUITAR_NECK[i][j] == note) {
          outMap.addAll({i:j});
        }
      }
    }*/

    return outMap;
  }

  static List<String> NOTES_TO_TABULATURE_STRINGS(List<String> notes) {
    List<String> outabulature = [];
    List<String> noteData = Note.SORT_NOTES(notes);
    print('NoteData: $noteData');
    if (noteData != null) {
      for (int i = 0; i < getGuitarStringCount; i++) {
        bool keya = false;
        for (int j = 0; j < noteData.length; j++) {
          var data = NOTE_TO_GUITAR_STRING_FRET_DATAMAP(noteData[j]);
          for (var key in data.keys) {
            keya = false;
            if (i == key) {
              String tabFret = data[key].toString();
              print('TF: $tabFret');
              if (tabFret.length == 2) {
                outabulature.add(''+tabFret+'-');
              } else {
                outabulature.add(''+tabFret+'--');
              }
              noteData.removeAt(j);
              keya = true;
            }
          }
        }
        if (keya == false) {
          outabulature.add('---');
          keya = true;
        }
      }
    }
    print(outabulature);
    return outabulature;
  }

  //    stringIndex, fret(Index)
  static MapEntry < int        , int > NOTE_TO_GUITAR_STRING_FRET_MAP(note) {
    MapEntry<int,int> guitarStringFretMapEntry;
    Note focusNote;
    if (note is String) {
      focusNote = Note.TO_NOTE(note);
    } else {
      focusNote = note;
    }

    for (int i = 0; i < Guitar.GUITAR_STRING_COUNT; i++) {
      if (focusNote.getNoteValue >= Guitar
          .GUITAR_STRING_TUNING_NOTES[i].getNoteValue) {
        List<Note> guitarString = Guitar
            .GUITAR_STRING(Guitar.GUITAR_STRING_TUNING_NOTES[i]);
        for (int j = 0; j < Guitar.FRETBOARD_LENGTH; j++) {
          if (guitarString[j].hashCode == focusNote.hashCode) {
            guitarStringFretMapEntry = MapEntry(i,j);
            print(guitarStringFretMapEntry.toString());
          }
        }
      }
    }
    return guitarStringFretMapEntry;
  }


  static IS_SCALE(List<Map<int,int>> data, bool returnMap) {
    Map<int,int> dataMap = Map();
    for (var fretboardCoordinates in data) {
      if (!dataMap.containsKey(fretboardCoordinates.keys.first)) {
        return false;
      } else {
        dataMap.addAll(fretboardCoordinates);
      }
    }
    return returnMap == true ? dataMap : true;
  }


  //A guitar should
  static Map<int,int> CONCAT_GUITAR_STRING_FRET_Map(List<Map<int,int>> data) {
    Map<int,int> outputMap;// = Map();

    if (data == null || data.isEmpty) {
      print('data: $data');
    } else if (Tabulature.IS_SCALE(data, true)) {
      for (var fretboardCoordinates in data) {
        outputMap.addAll(fretboardCoordinates);
      }
    } else {
      /*
      List<int> fretBoardRange = [];

      Map<int,int> most = {};
      var fbk;

      int q1, q3;


      for (Map<int,int> fretboardCoordinates in data) {
        fretBoardRange.addAll(fretboardCoordinates.values);
      }
      fretBoardRange.sort((a,b) => a.compareTo(b));
      q1 = fretBoardRange[(fretBoardRange.length*0.25)
          .round().toInt()*(fretBoardRange.length-1)];
      q3 = fretBoardRange[(fretBoardRange.length*0.75)
          .round().toInt()*(fretBoardRange.length-1)];


      for (int i = 0; i < fretBoardRange.length; i++) {
        if (fretBoardRange[i] <= q1 || fretBoardRange[i] >= q3) {
          bool isRangable = false;
          for (int j = 0; j < fretBoardRange.length; j++) {
            if ((fretBoardRange[i] - fretBoardRange[j]).abs() <= getFingerSpread) {
              isRangable = true;
              break;
            }
          }
          if (isRangable == false) {
            fretBoardRange.removeAt(i);
          }
        }
      }

      for (int i = 0; i < fretBoardRange.length; i++) {
        if (most.containsKey(fretBoardRange[i])) {
          most[fretBoardRange[i]]+=1;
        } else {
          Map<int,int> other = {i:0};
          most.addAll(other);
        }
      }

      fbk = most.keys.first;

      for (var fretboardKey in most.keys) {

      }
      */
    }
    print(outputMap.toString());
    return outputMap;
  }


  static Map<int,int> NOTES_TO_GUITAR_STRING_FRET_MAP(List<Note> notes) {
    Map<int, //stringData
        int> //fretData
    data;
    for (Note note in notes) {
      data.addEntries([NOTE_TO_GUITAR_STRING_FRET_MAP(note)]);
      print(data.toString());
    }
    return data;
  }


  static String GUITAR_STRINGS_TO_STRING(List<String> guitarStrings) {
    String outString = '';
    if (guitarStrings != null) {
      for (int i = 0; i < getGuitarStringCount; i++) {
        outString += '|-'+GUITAR_NECK[i][0]+'-|-'+guitarStrings[i]+'\n';
      }
    }
    return outString;
  }

  static String GUITAR_TABS_TO_STRING(List<List<String>> guitarTabs) {
    return 'TODO';
  }
  
  // THIS ONE
  static String NOTES_TO_STRING(List<String> notes) {
    return GUITAR_STRINGS_TO_STRING(NOTES_TO_TABULATURE_STRINGS(notes));
  }

  static final List<List<String>> GUITAR_NECK = [
    ['D#4','E4','F4','F#4','G4','G#4','A4','A#4','B4','C4','C#5','D5','D#5',
      'E5','F5','F#5','G5','G#5','A5','A#5','B5','C5','C#6','D6','D#6',
        'E6','F6','F#6','G6','G#6','A6','A#6','B6','C6','C#7','D7','D#7',
          'E7','F7','F#7','G7','G#7','A7','A#7','B7','C7','C#8','D8','D#8'],
    ['A#3','B3','C3','C#4','D4','D#4','E4','F4','F#4','G4','G#4','A4','A#4',
      'B4','C4','C#5','D5','D#5','E5','F5','F#5','G5','G#5','G5','A#5'],
    ['F#3','G3','G#3','A3','A#3','B3','C3','C#4','D4','D#4','E4','F4','F#4',
      'G4','G#4','A4','A#4','B4','C4','C#5','D5','D#5','E5','F5','F#5'],
    ['C#3','D3','D#3','E3','F3','F#3','G3','G#3','A3','A#3','B3','C3','C#4',
      'D4','D#4','E4','F4','F#4','G4','G#4','A4','A#4','B4','C4','C#5'],
    ['G#2','A2','A#2','B2','C2','C#3','D3','D#3','E3','F3','F#3','G3','G#3',
      'A3','A#3','B3','C3','C#4','D4','D#4','E4','F4','F#4','G4','G#4'],
    ['D#2','E2','F2','F#2','G2','G#2','A2','A#2','B2','C2','C#3','D3','D#3',
      'E3','F3','F#3','G3','G#3','A3','A#3','B3','C3','C#4','D4','D#4'],
    ['A#1','B1','C1','C#2','D2','D#2','E2','F2','F#2','G2','G#2','A2','A#2',
      'B2','C2','C#3','D3','D#3','E3','F3','F#3','G3','G#3','G3','A#3'],
    ['F#1','G1','G#1','A1','A#1','B1','C1','C#1','D1','D#1','E1','F1','F#1',
      'G1','G#1','A1','A#1','B1','C1','C#2','D2','D#2','E2','F2','F#2'],
    ['C#1','D1','D#1','E1','F1','F#1','G1','G#1','A1','A#1','B1','C1','C#2'
      'D4','D#4','E4','F4','F#4','G4','G#4','A4','A#4','B4','C4','C#5'],
    ['G#0','A0','A#0','B0','C0','C#1','D1','D#1','E1','F1','F#1','G1','G#1',
      'A1','A#1','B1','C1','C#2','D2','D#2','E2','F2','F#2','G2','G#2'],

  ];

  static String NOTE_AT_GUITAR_STRING_FRET(int guitarString, int fret) {
    String outNote = Guitar.GUITAR_STRING_TUNING[guitarString-1];
    for (int i = 0; (fret >= 12) && i < fret/12; i++) {
      outNote = Note.INCREMENT_NOTE_OCTAVE(outNote).toString();
      fret -= 12;
    }
    for (int i = 0; (fret >= 1) && (i < fret); i++) {
      outNote = Note.NEXT_NOTE(outNote);
    }
    return outNote;
  }

  static Map<int,int> NOTE_TO_STRING_FRET_DATA_MAP(String note) {
    Map<int, //stringData
        int> //fretData
    data;
    String tempNote;
    int tempFret;
    for (int i = 0; i < getGuitarStringCount; i++) {
      tempNote = Guitar.GUITAR_STRING_TUNING[i];
      if (Note.NOTE_TO_OCTAVE(note) >= Note.NOTE_TO_OCTAVE(tempNote)) {
          tempFret = 0;
        if (tempNote == note) {
          print('ay');
        } else {
          while (tempNote != note) {
            tempNote = Note.NEXT_NOTE(tempNote);
            tempFret += 1;
          }
        }
        data.addAll({i:tempFret});
        print('o');
      }
    }

    return data;
  }



  static MAP_TO_NOTE(Map<int,int> map) {
    return NOTE_AT_GUITAR_STRING_FRET(map.keys.first, map.values.first);
  }

}
*/