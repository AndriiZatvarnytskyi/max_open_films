// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FilmEntityAdapter extends TypeAdapter<FilmEntity> {
  @override
  final int typeId = 0;

  @override
  FilmEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FilmEntity(
      id: fields[0] as String,
      title: fields[1] as String,
      overview: fields[2] as String,
      voteAverage: fields[3] as String,
      posterUrl: fields[4] as String,
      backdropUrl: fields[5] as String,
      genres: (fields[6] as List).cast<String>(),
      isSaved: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, FilmEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.overview)
      ..writeByte(3)
      ..write(obj.voteAverage)
      ..writeByte(4)
      ..write(obj.posterUrl)
      ..writeByte(5)
      ..write(obj.backdropUrl)
      ..writeByte(6)
      ..write(obj.genres)
      ..writeByte(7)
      ..write(obj.isSaved);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilmEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
