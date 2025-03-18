# action-pyflakes

<!-- TODO: replace reviewdog/action-pyflakes with your repo name -->
[![Test](https://github.com/reviewdog/action-pyflakes/workflows/Test/badge.svg)](https://github.com/reviewdog/action-pyflakes/actions?query=workflow%3ATest)
[![reviewdog](https://github.com/reviewdog/action-pyflakes/workflows/reviewdog/badge.svg)](https://github.com/reviewdog/action-pyflakes/actions?query=workflow%3Areviewdog)
[![depup](https://github.com/reviewdog/action-pyflakes/workflows/depup/badge.svg)](https://github.com/reviewdog/action-pyflakes/actions?query=workflow%3Adepup)
[![release](https://github.com/reviewdog/action-pyflakes/workflows/release/badge.svg)](https://github.com/reviewdog/action-pyflakes/actions?query=workflow%3Arelease)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/reviewdog/action-pyflakes?logo=github&sort=semver)](https://github.com/reviewdog/action-pyflakes/releases)
[![action-bumpr supported](https://img.shields.io/badge/bumpr-supported-ff69b4?logo=github&link=https://github.com/haya14busa/action-bumpr)](https://github.com/haya14busa/action-bumpr)

![github-pr-review demo](https://github.com/reviewdog/action-pyflakes/blob/master/screenshot/pr-review.png)
![github-pr-check demo](https://github.com/reviewdog/action-pyflakes/blob/master/screenshot/pr-check.png)


This action lints Python codes. action-pyflakes is based on [reviewdog/action-vint](https://github.com/reviewdog/action-vint).

This action runs [pyflakes](https://github.com/PyCQA/pyflakes) with reviewdog on pull requests to improve code review experience.

## Input

```yaml
inputs:
  github_token:
    description: 'GITHUB_TOKEN.'
    required: true
  level:
    description: 'Report level for reviewdog [info,warning,error]'
    default: 'error'
  reporter:
    description: |
      Reporter of reviewdog command [github-pr-check,github-pr-review].
      Default is github-pr-check.
      github-pr-review can use Markdown and add a link to rule page in reviewdog reports.
    default: 'github-pr-check'
```

## Usage

```yaml
name: reviewdog
on: [pull_request]
jobs:
  pyflakes:
    name: runner / pyflakes
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@11bd71901bbe5b1630ceea73d27597364c9af683 # v4.2.2
      - name: pyflakes
        uses: reviewdog/action-pyflakes@master
        with:
          github_token: ${{ secrets.github_token }}
          reporter: github-pr-check # Change reporter.
```

## Development

### Release

#### [haya14busa/action-bumpr](https://github.com/haya14busa/action-bumpr)
You can bump version on merging Pull Requests with specific labels (bump:major,bump:minor,bump:patch).
Pushing tag manually by yourself also work.

#### [haya14busa/action-update-semver](https://github.com/haya14busa/action-update-semver)

This action updates major/minor release tags on a tag push. e.g. Update v1 and v1.2 tag when released v1.2.3.
ref: https://help.github.com/en/articles/about-actions#versioning-your-action

### Lint - reviewdog integration

This reviewdog action template itself is integrated with reviewdog to run lints
which is useful for Docker container based actions.

![reviewdog integration](https://user-images.githubusercontent.com/3797062/72735107-7fbb9600-3bde-11ea-8087-12af76e7ee6f.png)

Supported linters:

- [reviewdog/action-shellcheck](https://github.com/reviewdog/action-shellcheck)
- [reviewdog/action-hadolint](https://github.com/reviewdog/action-hadolint)
- [reviewdog/action-misspell](https://github.com/reviewdog/action-misspell)

### Dependencies Update Automation
This repository uses [haya14busa/action-depup](https://github.com/haya14busa/action-depup) to update
reviewdog version.


[![reviewdog depup demo](https://user-images.githubusercontent.com/3797062/73154254-170e7500-411a-11ea-8211-912e9de7c936.png)](https://github.com/reviewdog/action-template/pull/6)
