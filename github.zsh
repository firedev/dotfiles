#compdef _gh gh


function _gh {
  local -a commands

  _arguments -C \
    '--help[Show help for command]' \
    '(-R --repo)'{-R,--repo}'[Select another repository using the `OWNER/REPO` format]:' \
    '--version[Show gh version]' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "completion:Generate shell completion scripts"
      "config:Set and get gh settings"
      "help:Help about any command"
      "issue:Create and view issues"
      "pr:Create, view, and checkout pull requests"
      "repo:Create, clone, fork, and view repositories"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  completion)
    _gh_completion
    ;;
  config)
    _gh_config
    ;;
  help)
    _gh_help
    ;;
  issue)
    _gh_issue
    ;;
  pr)
    _gh_pr
    ;;
  repo)
    _gh_repo
    ;;
  esac
}

function _gh_completion {
  _arguments \
    '(-s --shell)'{-s,--shell}'[Shell type: {bash|zsh|fish|powershell}]:' \
    '--help[Show help for command]' \
    '(-R --repo)'{-R,--repo}'[Select another repository using the `OWNER/REPO` format]:'
}


function _gh_config {
  local -a commands

  _arguments -C \
    '--help[Show help for command]' \
    '(-R --repo)'{-R,--repo}'[Select another repository using the `OWNER/REPO` format]:' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "get:Prints the value of a given configuration key."
      "set:Updates configuration with the value of a given key."
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  get)
    _gh_config_get
    ;;
  set)
    _gh_config_set
    ;;
  esac
}

function _gh_config_get {
  _arguments \
    '--help[Show help for command]' \
    '(-R --repo)'{-R,--repo}'[Select another repository using the `OWNER/REPO` format]:'
}

function _gh_config_set {
  _arguments \
    '--help[Show help for command]' \
    '(-R --repo)'{-R,--repo}'[Select another repository using the `OWNER/REPO` format]:'
}

function _gh_help {
  _arguments \
    '--help[Show help for command]' \
    '(-R --repo)'{-R,--repo}'[Select another repository using the `OWNER/REPO` format]:'
}


function _gh_issue {
  local -a commands

  _arguments -C \
    '--help[Show help for command]' \
    '(-R --repo)'{-R,--repo}'[Select another repository using the `OWNER/REPO` format]:' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "create:Create a new issue"
      "list:List and filter issues in this repository"
      "status:Show status of relevant issues"
      "view:View an issue"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  create)
    _gh_issue_create
    ;;
  list)
    _gh_issue_list
    ;;
  status)
    _gh_issue_status
    ;;
  view)
    _gh_issue_view
    ;;
  esac
}

function _gh_issue_create {
  _arguments \
    '(-b --body)'{-b,--body}'[Supply a body. Will prompt for one otherwise.]:' \
    '(-t --title)'{-t,--title}'[Supply a title. Will prompt for one otherwise.]:' \
    '(-w --web)'{-w,--web}'[Open the browser to create an issue]' \
    '--help[Show help for command]' \
    '(-R --repo)'{-R,--repo}'[Select another repository using the `OWNER/REPO` format]:'
}

function _gh_issue_list {
  _arguments \
    '(-a --assignee)'{-a,--assignee}'[Filter by assignee]:' \
    '(-A --author)'{-A,--author}'[Filter by author]:' \
    '(*-l *--label)'{\*-l,\*--label}'[Filter by label]:' \
    '(-L --limit)'{-L,--limit}'[Maximum number of issues to fetch]:' \
    '(-s --state)'{-s,--state}'[Filter by state: {open|closed|all}]:' \
    '--help[Show help for command]' \
    '(-R --repo)'{-R,--repo}'[Select another repository using the `OWNER/REPO` format]:'
}

function _gh_issue_status {
  _arguments \
    '--help[Show help for command]' \
    '(-R --repo)'{-R,--repo}'[Select another repository using the `OWNER/REPO` format]:'
}

function _gh_issue_view {
  _arguments \
    '(-w --web)'{-w,--web}'[Open an issue in the browser]' \
    '--help[Show help for command]' \
    '(-R --repo)'{-R,--repo}'[Select another repository using the `OWNER/REPO` format]:'
}


function _gh_pr {
  local -a commands

  _arguments -C \
    '--help[Show help for command]' \
    '(-R --repo)'{-R,--repo}'[Select another repository using the `OWNER/REPO` format]:' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "checkout:Check out a pull request in Git"
      "create:Create a pull request"
      "list:List and filter pull requests in this repository"
      "status:Show status of relevant pull requests"
      "view:View a pull request"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  checkout)
    _gh_pr_checkout
    ;;
  create)
    _gh_pr_create
    ;;
  list)
    _gh_pr_list
    ;;
  status)
    _gh_pr_status
    ;;
  view)
    _gh_pr_view
    ;;
  esac
}

function _gh_pr_checkout {
  _arguments \
    '--help[Show help for command]' \
    '(-R --repo)'{-R,--repo}'[Select another repository using the `OWNER/REPO` format]:'
}

function _gh_pr_create {
  _arguments \
    '(-B --base)'{-B,--base}'[The branch into which you want your code merged]:' \
    '(-b --body)'{-b,--body}'[Supply a body. Will prompt for one otherwise.]:' \
    '(-d --draft)'{-d,--draft}'[Mark pull request as a draft]' \
    '(-f --fill)'{-f,--fill}'[Do not prompt for title/body and just use commit info]' \
    '(-t --title)'{-t,--title}'[Supply a title. Will prompt for one otherwise.]:' \
    '(-w --web)'{-w,--web}'[Open the web browser to create a pull request]' \
    '--help[Show help for command]' \
    '(-R --repo)'{-R,--repo}'[Select another repository using the `OWNER/REPO` format]:'
}

function _gh_pr_list {
  _arguments \
    '(-a --assignee)'{-a,--assignee}'[Filter by assignee]:' \
    '(-B --base)'{-B,--base}'[Filter by base branch]:' \
    '(*-l *--label)'{\*-l,\*--label}'[Filter by label]:' \
    '(-L --limit)'{-L,--limit}'[Maximum number of items to fetch]:' \
    '(-s --state)'{-s,--state}'[Filter by state: {open|closed|merged|all}]:' \
    '--help[Show help for command]' \
    '(-R --repo)'{-R,--repo}'[Select another repository using the `OWNER/REPO` format]:'
}

function _gh_pr_status {
  _arguments \
    '--help[Show help for command]' \
    '(-R --repo)'{-R,--repo}'[Select another repository using the `OWNER/REPO` format]:'
}

function _gh_pr_view {
  _arguments \
    '(-w --web)'{-w,--web}'[Open a pull request in the browser]' \
    '--help[Show help for command]' \
    '(-R --repo)'{-R,--repo}'[Select another repository using the `OWNER/REPO` format]:'
}


function _gh_repo {
  local -a commands

  _arguments -C \
    '--help[Show help for command]' \
    '(-R --repo)'{-R,--repo}'[Select another repository using the `OWNER/REPO` format]:' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "clone:Clone a repository locally"
      "create:Create a new repository"
      "fork:Create a fork of a repository"
      "view:View a repository"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  clone)
    _gh_repo_clone
    ;;
  create)
    _gh_repo_create
    ;;
  fork)
    _gh_repo_fork
    ;;
  view)
    _gh_repo_view
    ;;
  esac
}

function _gh_repo_clone {
  _arguments \
    '--help[Show help for command]' \
    '(-R --repo)'{-R,--repo}'[Select another repository using the `OWNER/REPO` format]:'
}

function _gh_repo_create {
  _arguments \
    '(-d --description)'{-d,--description}'[Description of repository]:' \
    '--enable-issues[Enable issues in the new repository]' \
    '--enable-wiki[Enable wiki in the new repository]' \
    '(-h --homepage)'{-h,--homepage}'[Repository home page URL]:' \
    '--public[Make the new repository public]' \
    '(-t --team)'{-t,--team}'[The name of the organization team to be granted access]:' \
    '--help[Show help for command]' \
    '(-R --repo)'{-R,--repo}'[Select another repository using the `OWNER/REPO` format]:'
}

function _gh_repo_fork {
  _arguments \
    '--clone[Clone fork: {true|false|prompt}]' \
    '--remote[Add remote for fork: {true|false|prompt}]' \
    '--help[Show help for command]' \
    '(-R --repo)'{-R,--repo}'[Select another repository using the `OWNER/REPO` format]:'
}

function _gh_repo_view {
  _arguments \
    '(-w --web)'{-w,--web}'[Open a repository in the browser]' \
    '--help[Show help for command]' \
    '(-R --repo)'{-R,--repo}'[Select another repository using the `OWNER/REPO` format]:'
}

