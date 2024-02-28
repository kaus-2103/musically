import 'package:flutter/material.dart';
import 'package:musically/components/neu_box.dart';
import 'package:musically/models/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(builder: 
    (context,value,child)
    {
      ///
      
      final playlist = value.playlist;

      final currentSong = playlist[value.currentSongIndex ?? 0];
      


      ///
      ///
      
      return Scaffold(
    backgroundColor: Theme.of(context).colorScheme.background,  
    appBar: 
    AppBar(
      title: 
      Text("Song Page")
      ,),
      body: SafeArea(
        child:   Padding(
          padding: const  EdgeInsets.only(left: 25, right: 25, bottom: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children: [
                  IconButton(onPressed: () =>Navigator.pop(context), 
                  icon:const Icon(Icons.arrow_back))
                  
                  ,Text("P L A Y L I S T")
          
                  ,IconButton(onPressed: () {}, 
                  icon:const Icon(Icons.menu)),
          
          
                ],
              ),
              const SizedBox(height: 25,),

              NeuBox(child: 
              Column(
                children: [
                  ClipRRect(
                  borderRadius: BorderRadius.circular(8),  
                  child: Image.asset(currentSong.albumArtPath)
                  ),
                  Padding(
                    padding: const  EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(currentSong.songName,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                                Text(currentSong.artistName)
                              ],
                            )
                            ,const Icon(Icons.favorite,
                            color: Colors.red,)
                          ],
                          
                        ),
                      ],
                    ),
                  )
                ],
              ),
                
              )
            ,
            const SizedBox(height: 25),
              Column(
                children: [
                  const Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text("0.00"),
                    
                      Icon(Icons.shuffle),
                    
                      Icon(Icons.repeat),
                    
                      Text("0.00")
                    ],
                    ),
                  ),
              
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: 
                      const RoundSliderThumbShape(enabledThumbRadius: 4),
                    ),
                    child: Slider(
                      min: 0,
                      max: 100,
                      value:50,
                      activeColor: Colors.green
                      , onChanged:(value){
                                  
                      }),
                  )
                ],
              ),

              const SizedBox(height: 25,),

              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      child: NeuBox(child: 
                      Icon(Icons.skip_previous)),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      child: NeuBox(child: 
                      Icon(Icons.play_arrow)),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: NeuBox(child: 
                      Icon(Icons.skip_next)),
                    ),
                  )
                ],
              )

            ],

            ),
        ),
      )
      
      );
    }
      );
  }
}