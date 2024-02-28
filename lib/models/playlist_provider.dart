import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:musically/models/song.dart';

class PlaylistProvider extends ChangeNotifier{

  final List<Song> _playList = [
      Song(songName: "Low Melody 1", 
      artistName: "lil Sample", 
      albumArtPath: "assets/image/Default_Lofi_music_album_cover_0.jpg", 
      audioPath: "assets/audio/mixkit-hazy-after-hours-132.mp3"),

      Song(songName: "Low Melody 2", 
      artistName: "lil Sample", 
      albumArtPath: "assets/image/Default_Lofi_music_album_cover_1.jpg", 
      audioPath: "assets/audio/mixkit-ive-been-careful-560.mp3"),

      Song(songName: "Low Melody 3", 
      artistName: "lil Sample", 
      albumArtPath: "assets/image/Default_Lofi_music_album_cover_3.jpg", 
      audioPath: "assets/audio/mixkit-sleepy-cat-135.mp3"),

  ];
  int? _currentSongIndex;


  // Getter 
  List<Song> get playlist => _playList;
  int? get currentSongIndex => _currentSongIndex;


  // final AudioPlayer _audioPlayer = AudioPlayer();


  // Duration _currentDuration= Duration.zero;
  // Duration _totalDuration= Duration.zero;
  

  // Setter

  set currentSongIndex(int? newIndex){

    _currentSongIndex = newIndex;

    notifyListeners();
  }


}