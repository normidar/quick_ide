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

  static Future<List<String>> listRepo({
    required RepositoriesService repoService,
    required String user,
  }) async {
    List<String> rt = [];
    final repos = repoService.listUserRepositories(
      user,
      sort: 'pushed',
    );
    await for (final repo in repos) {
      rt.add(repo.name);
    }
    return rt.reversed.toList();
  }
}
