// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FilmAdapter extends TypeAdapter<Film> {
  @override
  final int typeId = 1;

  @override
  Film read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Film(
      title: fields[0] as String,
      year: fields[1] as int,
      rank: fields[2] as int,
      actors: fields[3] as String,
      aka: fields[4] as String,
      imgPoster: fields[5] as String,
      photoWidth: fields[6] as int,
      photoHeight: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Film obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.year)
      ..writeByte(2)
      ..write(obj.rank)
      ..writeByte(3)
      ..write(obj.actors)
      ..writeByte(4)
      ..write(obj.aka)
      ..writeByte(5)
      ..write(obj.imgPoster)
      ..writeByte(6)
      ..write(obj.photoWidth)
      ..writeByte(7)
      ..write(obj.photoHeight);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilmAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
