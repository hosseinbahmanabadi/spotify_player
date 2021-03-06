import 'package:bugloos_player/bloc/counter_bloc.dart' as bloc;
import 'package:bugloos_player/config/constants.dart';
import 'package:bugloos_player/screens/tarck_display/current_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrentTrack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: kBgLightColor,width: 0.5)),
        color: kBottomBar,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 0,
            child: Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                height: 1,
                child:SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Colors.transparent,
                    activeTickMarkColor: Colors.white,
                    thumbColor: Colors.white,
                    trackHeight: 1,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 1,
                    ),
                  ),
                  child: Slider(
                    value: context.watch<bloc.ManagePageState>().position.inSeconds.toDouble() !=
                        context.watch<bloc.ManagePageState>().duration.inSeconds.toDouble()
                        ? context.watch<bloc.ManagePageState>().position.inSeconds.toDouble()
                        : context.watch<bloc.ManagePageState>().setToChangeDouble,
                    min: 0,
                    max: context.watch<bloc.ManagePageState>().duration.inSeconds.toDouble(),
                    onChanged: (double value) {
                      context.read<bloc.ManagePageState>().seekToSecond(value.toInt());
                      value = value;
                    },
                  ),
                ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: _TrackInfo(),
            ),
          ),
        ],
      ),
    );
  }
}

class _TrackInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<bloc.ManagePageState>().selected;
    if (selected == null) return const SizedBox.shrink();
    return InkWell(
      onTap: (){
        Navigator.of(context).push(_createRouteToCurrentTrack());
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Expanded(
            flex: 1,
            child: IconButton(
              icon: context.watch<bloc.ManagePageState>().trackIdFavoriteList.contains(selected.id)?
              const Icon(Icons.favorite, color: kGreenColor,):const Icon(Icons.favorite_border_outlined, color: kGrayColor,),
              onPressed: () {
                context.read<bloc.ManagePageState>().favoriteTrack(selected.id);
              },
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  selected.title,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.grey[300], fontSize: 12.0, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(Icons.circle, color: Colors.grey[300], size: 5,),
                ),
                Text(
                  selected.artist,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.grey[300], fontSize: 12.0),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              padding: const EdgeInsets.only(),
              icon: context.watch<bloc.ManagePageState>().isPlayPressed == true?
              const Icon(Icons.pause, color: kBgLightColor,):const Icon(Icons.play_arrow, color: kBgLightColor,),
              iconSize: 34.0,
              onPressed: () {
                context.read<bloc.ManagePageState>().changeAudioPlayPause(selected.audioURL);
              },
              ),
          )
        ],
      ),
    );
  }
}

Route _createRouteToCurrentTrack() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>  CurrentTrackDisplay(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}


