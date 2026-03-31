class ColonTypeImageDTO {
  String pathToAssetImage;
  String colonType;

  ColonTypeImageDTO({
    this.colonType = '',
    this.pathToAssetImage = '',
  });

  @override
  String toString() {
    return 'ColonTypeImageDTO{pathToAssetImage: $pathToAssetImage, colonType: $colonType}';
  }
}
