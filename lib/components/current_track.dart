import 'package:bugloos_player/bloc/counter_bloc.dart' as bloc;
import 'package:bugloos_player/config/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrentTrack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      width: double.infinity,
      color: kBottomBar,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _TrackInfo(),
      ),
    );
  }
}

class _TrackInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<bloc.ManagePageState>().selected;
    if (selected == null) return const SizedBox.shrink();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        IconButton(
          icon: context.watch<bloc.ManagePageState>().trackIdFavoriteList.contains(selected.id)?
          const Icon(Icons.favorite, color: kGreenColor,):const Icon(Icons.favorite_border_outlined, color: kGrayColor,),
          onPressed: () {
            context.read<bloc.ManagePageState>().favoriteTrack(selected.id);
          },
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
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
        IconButton(
          padding: const EdgeInsets.only(),
          icon: const Icon(Icons.play_arrow, color: kBgLightColor,),
          iconSize: 34.0,
          onPressed: () {},
          )
      ],
    );
  }
}