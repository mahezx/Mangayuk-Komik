import 'package:flutter/material.dart';

class CardItem {
  final String imageCard;
  final String title;
  final String chapter;
  final String sinopsis;
  final String author;
  final String score;
  final String genre;

  const CardItem({
    required this.imageCard,
    required this.title,
    required this.chapter,
    required this.sinopsis,
    required this.author,
    required this.score,
    required this.genre,
  });
}

Color kPrimaryColor = Color(0xFFEC3133);
Color kStarsColor = Color(0xFFFA6400);

List<CardItem> cardItems = [
  CardItem(
    imageCard: '/img/mythicitem.jpeg',
    title: 'I Obtained a Mythic Item',
    chapter: 'Chapter 63',
    sinopsis: 'Dalam dunia di mana teknologi dan sihir hampir tidak dapat dibedakan satu sama lain, monster dan makhluk legenda menimbulkan teror bagi umat manusia. Di saat-saat paling gelap umat manusia, individu-individu dengan kekuatan istimewa seperti dewa muncul untuk menyelamatkan hari. Mereka disebut "Awakened" (yang Terbangun). Temui Jaehyeon, seorang Awakened manusia yang lemah, yang berjuang untuk mencukupi kebutuhannya sampai suatu hari serangkaian peristiwa membingungkan memungkinkannya untuk memiliki sebuah benda kuat yang akan mengubah jalannya sejarah selamanya...',
    author: 'Jung SeonYul , Hess',
    score: '4.9',
    genre: 'Action, Adventure, Fantasy',
  ),
  CardItem(
    imageCard: '/img/aw.jpg',
    title: 'The Novel Extra',
    chapter: 'Chapter 66',
    sinopsis: 'Ketika bangun, Kim Hajin tersadar dirinya ada di dunia yang dia kenal tetapi tubuh yang tidak dikenal. Dunia yang dia ciptakan sendiri dan kisah yang ia tulis, namun tidak pernah selesai. Dia telah menjadi pemain figuran dalam novelnya, karakter pengisi dengan tidak penting untuk cerita. Satu-satunya petunjuk untuk melarikan diri adalah tetap dekat dengan jalan cerita utama. Namun, ia segera mengetahui bahwa dunia ini tidak persis identik dengan ciptaannya',
    author: 'Jee Gab Song',
    score: '4.9',
    genre: 'Action, Adventure, Fantasy, School Life, Shounen',
  ),
  CardItem(
    imageCard: '/img/sung.jpg',
    title: 'Solo Max Level Newbie',
    chapter: 'Chapter 109',
    sinopsis: 'Jinhyuk, seorang Nutuber game, adalah satu-satunya orang yang melihat akhir dari game [Tower of Trials]. Namun, ketika popularitas game tersebut menurun, menjadi sulit baginya untuk terus mencari nafkah sebagai Nutuber game. Karena dia sudah melihat akhir permainan, dia akan berhenti bermain. Tapi hari itu, [Tower of Trials] menjadi kenyataan, dan Jinhyuk, yang tahu tentang setiap hal dalam game, mengambil alih segalanya lebih cepat daripada yang bisa dilakukan siapa pun! “Saya akan menunjukkan kepada Anda seperti apa profesional sejati itu.”',
    author: 'WAN.Z & Swing Bat',
    score: '4.9',
    genre: 'Action, Adventure, Fantasy',
  ),
  CardItem(
    imageCard: '/img/rokhan.jpg',
    title: 'Return of the SSS-Class Ranker',
    chapter: 'Chapter 67',
    sinopsis: 'Rokan Sang ‘King of Violence’ Orang yang terkuat di game virtual reality, ‘The Lord’. Sayangnya, perintah pembunuhan yang dikeluarkan oleh guild musuh menyebabkan dia kehilangan segalanya. Yang mengejutkannya, pada saat dia bangun, dia telah kembali ke tiga tahun yang lalu!“Bajingan sialan, tunggu saja. Aku akan membantai kalian semua!”Sebuah cerita baru dimulai ketika Rokan, yang melakukan perjalanan kembali ke masa lalu, mendaki kembali ke puncak',
    author: 'Hojun, Gald',
    score: '4.9',
    genre: 'Action, Adventure, Fantasy, Drama, Shounen, Game',
  ),
  CardItem(
    imageCard: '/img/broken-ring.jpg',
    title: 'The Broken Ring',
    chapter: 'Chapter 42',
    sinopsis: 'Ketika Inés yang berusia enam tahun melihat pewaris tampan House Escalante, dia segera menjadikan bocah itu tunangannya. Karena pria bangsawan semuanya sama, dia pikir dia mungkin juga memilih yang cantik. Tetapi Lord Cárcel belum siap untuk komitmen semacam ini, dan dia menghabiskan satu setengah dekade berikutnya untuk menghindari pernikahan dengan cara apa pun! Untungnya, itu tidak menjadi masalah bagi Inés, karena kegagalan pernikahan ini adalah apa yang dia inginkan. Faktanya, dia mendapat restunya untuk menabur gandum liar selama dia tidak ikut campur dalam bisnisnya. Sayangnya, menjadi playboy tidak semenyenangkan ketika tunangan Anda memberi Anda izin. Dan bukankah ini berarti dia juga selingkuh? Sekarang, Cárcel bertekad untuk mengubah pikiran Inés tentang dia dan membuktikan bahwa dia bisa menjadi suami yang selalu diinginkannya.',
    author: 'Hirohiko Araki',
    score: '4.9',
    genre: 'Romance, Historical, Fantasy, Mature'
  ),
  CardItem(
    imageCard: '/img/marriage-bisnis.jpg',
    title: 'Marriage of Convenience',
    chapter: 'Chapter 91',
    sinopsis: 'Bercerita tentang Bianca de Blanchefort. Istri Zachary de Arno, diusir dari keluarga Arno setelah kematiannya karena perilakunya yang memanjakan diri, sembrono, dan tidak bermoral. Dia tidak punya tempat untuk pergi, keluarga Blanchefort telah hancur, dan kurang lebih ditendang ke sebuah biara di perbatasan. Seorang wanita yang akhirnya menemui ajalnya di lantai batu yang dingin. Seorang penjahat tanpa kehormatan: itulah kehidupan Bianca sebelum dia kembali ke masa lalu. “Apakah ini benar-benar kenyataan? Apakah saya benar-benar melakukan perjalanan kembali ke masa lalu? Ini bukan mimpi atau halusinasi.',
    author: 'Hirohiko Araki',
    score: '4.9',
    genre: 'Romance, Historical, Fantasy, Mature'
  ),
];
