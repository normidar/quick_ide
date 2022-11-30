import 'dart:convert';

import 'package:github/github.dart';

class GithubUtil {
  static RepositoriesService getGithubByToken(String token) {
    final github = GitHub(auth: Authentication.withToken(token));
    return RepositoriesService(github);
  }

  static addNewFile({
    required RepositoriesService repoService,
    required String owner,
    required String repoName,
    required String filePath,
    required String fileContent,
  }) async {
    final commitUser = CommitUser('normidar', 'normidar7@gmail.com');
    CreateFile createFile = CreateFile(
      path: "abcd.dart",
      content: base64.encode(utf8.encode("my new file contents")),
      message: 'file test',
      committer: commitUser,
    );
    final res = await repoService.createFile(RepositorySlug(owner, repoName), createFile);
    print('success ${res.toJson()}');
  }
}
