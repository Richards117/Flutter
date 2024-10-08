import 'package:flutter/material.dart';

class ClassesCard extends StatelessWidget {
  final String groupName;
  final String backgroundImageUrl;
  final String className;
  final String? classNumber;
  final String? examDuration;
  final int? questionCount;
  final bool? isPendingReview;
  final bool showExamInfo;
  final VoidCallback? onPlayPressed;
  final IconData icon;

  const ClassesCard({
    super.key,
    required this.groupName,
    required this.backgroundImageUrl,
    required this.className,
    this.classNumber,
    this.examDuration,
    this.questionCount,
    this.isPendingReview,
    this.showExamInfo = false,
    this.onPlayPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          margin: const EdgeInsets.only(top: 30, bottom: 30),
          width: double.infinity,
          height: 410,
          decoration: _cardBorders(),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              if (showExamInfo)
                ExamInfo(
                  examDuration: examDuration!,
                  questionCount: questionCount!,
                  isPendingReview: isPendingReview!,
                )
              else
                BackgroundImage(imageUrl: backgroundImageUrl),
              ClassDetailsButton(
                className: className,
                classNumber: classNumber,
                onPlayPressed: onPlayPressed,
                icon: icon,
              ),
              Positioned(
                bottom: 304,
                left: 0,
                right: 0,
                child: TopTitleClass(texts: groupName),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
        color: const Color.fromRGBO(95, 170, 176, 1),
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(95, 170, 176, 1),
            blurRadius: 10,
          )
        ],
        border: Border.all(color: Colors.black, width: 3),
      );
}

class ExamInfo extends StatelessWidget {
  final String examDuration;
  final int questionCount;
  final bool isPendingReview;

  const ExamInfo({
    super.key,
    required this.examDuration,
    required this.questionCount,
    required this.isPendingReview,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 250, // Ajusta la altura según sea necesario
        color: const Color.fromRGBO(95, 170, 176, 1),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Duración del examen: $examDuration',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 10),
              Text(
                'Número de preguntas: $questionCount',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 10),
              Text(
                'Pendiente: ${isPendingReview ? "Sí" : "No"}',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  final String imageUrl;

  const BackgroundImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 310,
        child: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class TopTitleClass extends StatelessWidget {
  final String texts;

  const TopTitleClass({super.key, required this.texts});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(95, 170, 176, 1),
          border: Border(
            bottom: BorderSide(color: Colors.black, width: 3),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            texts,
            style: const TextStyle(
              fontSize: 33,
              color: Colors.white,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}

class ClassDetailsButton extends StatelessWidget {
  final String className;
  final String? classNumber;
  final VoidCallback? onPlayPressed;
  final IconData icon;

  const ClassDetailsButton({
    super.key,
    required this.className,
    required this.icon,
    this.classNumber,
    this.onPlayPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        height: 80,
        decoration: _buildBoxDecoration(),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    className,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
                  if (classNumber != null)
                    Text(
                      classNumber!,
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                    ),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
              style: ButtonStyle(
                overlayColor: WidgetStateProperty.all(Colors.yellow),
              ),
              onPressed: onPlayPressed,
              icon: Icon(
                icon,
                size: 55,
                color: Colors.white,
                shadows: const [BoxShadow(color: Colors.black, blurRadius: 20)],
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
        color: Color.fromRGBO(95, 170, 176, 1),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        border: Border(
          right: BorderSide(color: Colors.black, width: 3),
          top: BorderSide(color: Colors.black, width: 3),
        ),
      );
}
