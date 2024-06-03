class HomeModel
{
  String? id,category;

  HomeModel({this.id, this.category});

  factory HomeModel.mapToModel(Map m1)
  {
    return HomeModel(id: m1['id'],category: m1['category']);
  }
}