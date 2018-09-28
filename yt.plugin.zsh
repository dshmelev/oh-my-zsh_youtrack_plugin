# CLI support for YouTrack interaction
#
# See README.md for details

function yt() {
  emulate -L zsh
  local action youtrack_url
  if [[ -n "$1" ]]; then
    action=$1
  elif [[ -f .youtrack-default-action ]]; then
    action=$(cat .youtrack-default-action)
  elif [[ -f ~/.youtrack-default-action ]]; then
    action=$(cat ~/.youtrack-default-action)
  elif [[ -n "${YOUTRACK_DEFAULT_ACTION}" ]]; then
    action=${YOUTRACK_DEFAULT_ACTION}
  else
    action="new"
  fi

  if [[ -f .youtrack-url ]]; then
    youtrack_url=$(cat .youtrack-url)
  elif [[ -f ~/.youtrack-url ]]; then
    youtrack_url=$(cat ~/.youtrack-url)
  elif [[ -n "${YOUTRACK_URL}" ]]; then
    youtrack_url=${YOUTRACK_URL}
  else
    _youtrack_url_help
    return 1
  fi

  if [[ $action == "new" ]]; then
    echo "Opening new issue"
    open_command "${youtrack_url}/newIssue"
  elif [[ "$action" == "assigned" ]]; then
    echo "Opening issues"
    youtrack_name=${2:=me}
    open_command "${youtrack_url}/issues?q=for:%20${youtrack_name}%20%23Unresolved%20"
  else
    # Anything that doesn't match a special action is considered an issue name
    local issue=$action
    echo "Opening issue #$issue"
    open_command "${youtrack_url}/issue/${issue}"
  fi
}

function _youtrack_url_help() {
  cat << EOF
error: YouTrack URL is not specified anywhere.

Valid options, in order of precedence:
  .youtrack-url file
  \$HOME/.youtrack-url file
  \$YOUTRACK_URL environment variable
EOF
}
