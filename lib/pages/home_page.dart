import 'package:flutter/material.dart';
import 'package:musically/components/my_drawer.dart';
import 'package:musically/models/playlist_provider.dart';
import 'package:musically/models/song.dart';
import 'package:musically/pages/song_page.dart';
import 'package:provider/provider.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final dynamic playlistProvider;

  @override
  void initState(){
    super.initState();

    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  void goToSong(int songIndex){
    playlistProvider.currentSong = songIndex;

    Navigator.push(context, 
    MaterialPageRoute(builder: (context) => const SongPage(),));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(title: const Text("M U S I C"),
      ),
      drawer: const Mydrawer(),
      body: Consumer<PlaylistProvider>(builder: (context,value,chlid){
        final List<Song> playlist = value.playlist;

        return ListView.builder(itemCount: playlist.length,
        itemBuilder: (context,index){
          final Song song = playlist[index];

          return ListTile(
            title: Text(song.songName),
            subtitle: Text(song.artistName),
            leading: Image.asset(song.albumArtPath),
            onTap: () => goToSong(index) ,
          );


        },);
      },),
    );
  }
}