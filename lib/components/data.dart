const yourLibrary = [
  'Made For You',
  'Recently Played',
  'Liked Songs',
  'Albums',
  'Artists',
  'Podcasts',
];

const playlists = [
  'Jahan Bedoone To',
  'Ghalb Ghaap',
  'Lalehzar',
  'Koocheye Nastaran',
];

class Song {
  final String id;
  final String title;
  final String artist;
  final String album;
  final String imageURL;
  final String audioURL;

  const Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.imageURL,
    required this.audioURL
  });
}

const _ebiLalehzarMusic = [
  Song(
    id: '0',
    title: 'Jahan Bedoone To',
    artist: 'Ebi',
    album: 'Lalehzar',
    imageURL: 'https://webcare.ir/hossein/bugloos/lalehzar.jpg',
    audioURL: 'https://webcare.ir/hossein/bugloos/jahaan_bedoone_to.mp3'
  ),
  Song(
    id: '1',
    title: 'Ghalb Ghaap',
    artist: 'Ebi',
    album: 'Lalehzar',
    imageURL: 'https://webcare.ir/hossein/bugloos/lalehzar.jpg',
    audioURL: 'https://webcare.ir/hossein/bugloos/Ghalb_Ghaap.mp3'


  ),
  Song(
    id: '2',
    title: 'Lalehzar',
    artist: 'Ebi',
    album: 'Lalehzar',
    imageURL: 'https://webcare.ir/hossein/bugloos/lalehzar.jpg',
    audioURL: 'https://webcare.ir/hossein/bugloos/Lalehzaar.mp3'
  ),
  Song(
    id: '3',
    title: 'Koocheye Nastaran',
    artist: 'Ebi',
    album: 'Lalehzar',
    imageURL: 'https://webcare.ir/hossein/bugloos/lalehzar.jpg',
    audioURL: 'https://webcare.ir/hossein/bugloos/Koocheye_Nastaran.mp3'
  ),
];

class Playlist {
  final String id;
  final String name;
  final String imageURL;
  final String creator;
  final String description;
  final List<Song> songs;

  const Playlist({
    required this.id,
    required this.name,
    required this.imageURL,
    required this.creator,
    required this.description,
    required this.songs,
  });
}

const ebiLalehzarPlaylist = Playlist(
  id: 'Lalehzar - Play List',
  name: 'Ebi - Lalehzar',
  imageURL: 'https://webcare.ir/hossein/bugloos/lalehzar.jpg',
  creator: 'Ebi',
  description: 'MADE FOR HOSSEIN',
  songs: _ebiLalehzarMusic,
);
