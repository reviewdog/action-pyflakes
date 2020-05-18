#!/bin/sh
set -e

if [ -n "${GITHUB_WORKSPACE}" ] ; then
  cd "${GITHUB_WORKSPACE}/${INPUT_WORKDIR}" || exit
fi

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

pyflakes . \
  | reviewdog -efm="%f:%l:%c %m" \
      -name="pyflakes" \
      -reporter="${INPUT_REPORTER:-github-pr-check}" \
      -level="${INPUT_LEVEL}" \
