void printFullText(String text)
{
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) =>print(match.group(0)));
}
String token = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0ZDkxYTEzZWRkM2E1OTQwNDg2YmY2MCIsImlhdCI6MTY5MTk0OTYyMiwiZXhwIjoxNjkyNTU0NDIyfQ.T9AyIMbX98XZ-Em7KNiywwvl2ODdMwYstOzyHnVZbik';