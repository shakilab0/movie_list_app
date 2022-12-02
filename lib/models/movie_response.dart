class MovieResponse {
  MovieResponse({
      this.status, 
      this.statusMessage, 
      this.data, 
     });

  MovieResponse.fromJson(dynamic json) {
    status = json['status'];
    statusMessage = json['status_message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  String? statusMessage;
  Data? data;

MovieResponse copyWith({  String? status,
  String? statusMessage,
  Data? data,

}) => MovieResponse(  status: status ?? this.status,
  statusMessage: statusMessage ?? this.statusMessage,
  data: data ?? this.data,

);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['status_message'] = statusMessage;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    
    return map;
  }

}

class Data {
  Data({
      this.movieCount, 
      this.limit, 
      this.pageNumber, 
      this.movies,});

  Data.fromJson(dynamic json) {
    movieCount = json['movie_count'];
    limit = json['limit'];
    pageNumber = json['page_number'];
    if (json['movies'] != null) {
      movies = [];
      json['movies'].forEach((v) {
        movies?.add(Movies.fromJson(v));
      });
    }
  }
  num? movieCount;
  num? limit;
  num? pageNumber;
  List<Movies>? movies;
Data copyWith({  num? movieCount,
  num? limit,
  num? pageNumber,
  List<Movies>? movies,
}) => Data(  movieCount: movieCount ?? this.movieCount,
  limit: limit ?? this.limit,
  pageNumber: pageNumber ?? this.pageNumber,
  movies: movies ?? this.movies,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['movie_count'] = movieCount;
    map['limit'] = limit;
    map['page_number'] = pageNumber;
    if (movies != null) {
      map['movies'] = movies?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Movies {
  Movies({
      this.id, 
      this.url, 
      this.imdbCode, 
      this.title, 
      this.titleEnglish, 
      this.titleLong, 
      this.slug, 
      this.year, 
      this.rating, 
      this.runtime, 
      this.genres, 
      this.summary, 
      this.descriptionFull, 
      this.synopsis, 
      this.ytTrailerCode, 
      this.language, 
      this.mpaRating, 
      this.backgroundImage, 
      this.backgroundImageOriginal, 
      this.smallCoverImage, 
      this.mediumCoverImage, 
      this.largeCoverImage, 
      this.state, 
      this.torrents, 
      this.dateUploaded, 
      this.dateUploadedUnix,});

  Movies.fromJson(dynamic json) {
    id = json['id'];
    url = json['url'];
    imdbCode = json['imdb_code'];
    title = json['title'];
    titleEnglish = json['title_english'];
    titleLong = json['title_long'];
    slug = json['slug'];
    year = json['year'];
    rating = json['rating'];
    runtime = json['runtime'];
    genres = json['genres'] != null ? json['genres'].cast<String>() : [];
    summary = json['summary'];
    descriptionFull = json['description_full'];
    synopsis = json['synopsis'];
    ytTrailerCode = json['yt_trailer_code'];
    language = json['language'];
    mpaRating = json['mpa_rating'];
    backgroundImage = json['background_image'];
    backgroundImageOriginal = json['background_image_original'];
    smallCoverImage = json['small_cover_image'];
    mediumCoverImage = json['medium_cover_image'];
    largeCoverImage = json['large_cover_image'];
    state = json['state'];
    if (json['torrents'] != null) {
      torrents = [];
      json['torrents'].forEach((v) {
        torrents?.add(Torrents.fromJson(v));
      });
    }
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'];
  }
  num? id;
  String? url;
  String? imdbCode;
  String? title;
  String? titleEnglish;
  String? titleLong;
  String? slug;
  num? year;
  num? rating;
  num? runtime;
  List<String>? genres;
  String? summary;
  String? descriptionFull;
  String? synopsis;
  String? ytTrailerCode;
  String? language;
  String? mpaRating;
  String? backgroundImage;
  String? backgroundImageOriginal;
  String? smallCoverImage;
  String? mediumCoverImage;
  String? largeCoverImage;
  String? state;
  List<Torrents>? torrents;
  String? dateUploaded;
  num? dateUploadedUnix;
Movies copyWith({  num? id,
  String? url,
  String? imdbCode,
  String? title,
  String? titleEnglish,
  String? titleLong,
  String? slug,
  num? year,
  num? rating,
  num? runtime,
  List<String>? genres,
  String? summary,
  String? descriptionFull,
  String? synopsis,
  String? ytTrailerCode,
  String? language,
  String? mpaRating,
  String? backgroundImage,
  String? backgroundImageOriginal,
  String? smallCoverImage,
  String? mediumCoverImage,
  String? largeCoverImage,
  String? state,
  List<Torrents>? torrents,
  String? dateUploaded,
  num? dateUploadedUnix,
}) => Movies(  id: id ?? this.id,
  url: url ?? this.url,
  imdbCode: imdbCode ?? this.imdbCode,
  title: title ?? this.title,
  titleEnglish: titleEnglish ?? this.titleEnglish,
  titleLong: titleLong ?? this.titleLong,
  slug: slug ?? this.slug,
  year: year ?? this.year,
  rating: rating ?? this.rating,
  runtime: runtime ?? this.runtime,
  genres: genres ?? this.genres,
  summary: summary ?? this.summary,
  descriptionFull: descriptionFull ?? this.descriptionFull,
  synopsis: synopsis ?? this.synopsis,
  ytTrailerCode: ytTrailerCode ?? this.ytTrailerCode,
  language: language ?? this.language,
  mpaRating: mpaRating ?? this.mpaRating,
  backgroundImage: backgroundImage ?? this.backgroundImage,
  backgroundImageOriginal: backgroundImageOriginal ?? this.backgroundImageOriginal,
  smallCoverImage: smallCoverImage ?? this.smallCoverImage,
  mediumCoverImage: mediumCoverImage ?? this.mediumCoverImage,
  largeCoverImage: largeCoverImage ?? this.largeCoverImage,
  state: state ?? this.state,
  torrents: torrents ?? this.torrents,
  dateUploaded: dateUploaded ?? this.dateUploaded,
  dateUploadedUnix: dateUploadedUnix ?? this.dateUploadedUnix,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['url'] = url;
    map['imdb_code'] = imdbCode;
    map['title'] = title;
    map['title_english'] = titleEnglish;
    map['title_long'] = titleLong;
    map['slug'] = slug;
    map['year'] = year;
    map['rating'] = rating;
    map['runtime'] = runtime;
    map['genres'] = genres;
    map['summary'] = summary;
    map['description_full'] = descriptionFull;
    map['synopsis'] = synopsis;
    map['yt_trailer_code'] = ytTrailerCode;
    map['language'] = language;
    map['mpa_rating'] = mpaRating;
    map['background_image'] = backgroundImage;
    map['background_image_original'] = backgroundImageOriginal;
    map['small_cover_image'] = smallCoverImage;
    map['medium_cover_image'] = mediumCoverImage;
    map['large_cover_image'] = largeCoverImage;
    map['state'] = state;
    if (torrents != null) {
      map['torrents'] = torrents?.map((v) => v.toJson()).toList();
    }
    map['date_uploaded'] = dateUploaded;
    map['date_uploaded_unix'] = dateUploadedUnix;
    return map;
  }

}

class Torrents {
  Torrents({
      this.url, 
      this.hash, 
      this.quality, 
      this.type, 
      this.seeds, 
      this.peers, 
      this.size, 
      this.sizeBytes, 
      this.dateUploaded, 
      this.dateUploadedUnix,});

  Torrents.fromJson(dynamic json) {
    url = json['url'];
    hash = json['hash'];
    quality = json['quality'];
    type = json['type'];
    seeds = json['seeds'];
    peers = json['peers'];
    size = json['size'];
    sizeBytes = json['size_bytes'];
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'];
  }
  String? url;
  String? hash;
  String? quality;
  String? type;
  num? seeds;
  num? peers;
  String? size;
  num? sizeBytes;
  String? dateUploaded;
  num? dateUploadedUnix;
Torrents copyWith({  String? url,
  String? hash,
  String? quality,
  String? type,
  num? seeds,
  num? peers,
  String? size,
  num? sizeBytes,
  String? dateUploaded,
  num? dateUploadedUnix,
}) => Torrents(  url: url ?? this.url,
  hash: hash ?? this.hash,
  quality: quality ?? this.quality,
  type: type ?? this.type,
  seeds: seeds ?? this.seeds,
  peers: peers ?? this.peers,
  size: size ?? this.size,
  sizeBytes: sizeBytes ?? this.sizeBytes,
  dateUploaded: dateUploaded ?? this.dateUploaded,
  dateUploadedUnix: dateUploadedUnix ?? this.dateUploadedUnix,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['hash'] = hash;
    map['quality'] = quality;
    map['type'] = type;
    map['seeds'] = seeds;
    map['peers'] = peers;
    map['size'] = size;
    map['size_bytes'] = sizeBytes;
    map['date_uploaded'] = dateUploaded;
    map['date_uploaded_unix'] = dateUploadedUnix;
    return map;
  }

}