abstract class AbstractDataSource<T> {
  const AbstractDataSource();

  Future<T> read(String id);

  Future<bool> delete(String id);

  Future<bool> add(T result);
  // Future<bool> loadFromExcel()
}



abstract class SelectStageDataSource<T> {
  const SelectStageDataSource();

  Future<T> read(String id);

  Future<bool> delete(String id);

  Future<bool> create(String id, T result);
  // Future<bool> loadFromExcel()
}
