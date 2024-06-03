class QuizModel {
  String? question, a, b, c, d, id, category;

  QuizModel(
      {this.id, this.question, this.a, this.b, this.c, this.d, this.category});

  factory QuizModel.mapToModel(Map m1) {
    return QuizModel(
      question: m1['question'],
      id: m1['id'],
      category: m1['category'],
      a: m1['a'],
      b: m1['b'],
      c: m1['c'],
      d: m1['d'],
    );
  }
}

class RandomModel {
  String? question, correct_answer;
  List? option;

  RandomModel({this.question, this.correct_answer, this.option});
}
