/// The 'Mapper' class provides a generic mapping mechanism between model and entity instances.
class Mapper<T, E> {
  /// Function: Converts a model instance of type 'T' to an entity instance of type 'E'.
  final E Function(T) toEntityFunction;

  /// Function: Converts an entity instance of type 'E' to a JSON-like map.
  final Map<String, dynamic> Function(E) toDataFunction;

  /// Constructor: Initializes the 'toEntityFunction' and 'toDataFunction' functions.
  Mapper(this.toEntityFunction, this.toDataFunction);

  /// Method: Converts a model instance to an entity instance using 'toEntityFunction'.
  E toEntity(T model) {
    return toEntityFunction(model);
  }

  /// Method: Converts an entity instance to a JSON-like map using 'toDataFunction'.
  Map<String, dynamic> toData(E entity) {
    return toDataFunction(entity);
  }
}
