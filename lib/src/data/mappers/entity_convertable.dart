/// A mixin that provides methods to convert between entity and model objects.
///
/// The `EntityConvertible` mixin requires implementing two methods:
/// - `toEntity()` which converts the model object to an entity object.
/// - `fromEntity(O model)` which converts the entity object to a model object.
///
/// Example usage:
/// ```
/// class UserEntity {
///   final String id;
///   final String name;
///
///   UserEntity({required this.id, required this.name});
/// }
///
/// class UserModel {
///   final String id;
///   final String name;
///
///   UserModel({required this.id, required this.name});
/// }
///
/// class UserMapper with EntityConvertible<UserModel, UserEntity> {
///   @override
///   UserEntity toEntity() {
///     return UserEntity(id: id, name: name);
///   }
///
///   @override
///   UserModel fromEntity(UserEntity entity) {
///     return UserModel(id: entity.id, name: entity.name);
///   }
/// }
/// ```
mixin EntityConvertible<I, O> {
  O toEntity();
  I fromEntity(O model) => throw UnimplementedError();
}

//* can change