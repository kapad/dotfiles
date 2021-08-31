# helper functions and aliases

export DEFAULT_KN_NAMESPACE="default"

alias k="kubectl"

function kn() {
  local NAMESPACE=${1:-${DEFAULT_KN_NAMESPACE}}
  kubectl config set-context --current --namespace="${NAMESPACE}"
}

function kc() {
  local CLUSTER=${1:-""}
  local ret
  local old_kubeconfig=${KUBECONFIG}

  __kc_temp ${CLUSTER}
  ret=$?
  if [[ $ret -eq 0 ]]; then 
    return
  fi

  export KUBECONFIG=${HOME_KUBECONFIG}
  __kc_temp ${CLUSTER}
  ret=$?
  if [[ $ret -ne 0 ]]; then 
    export KUBECONFIG=${old_kubeconfig}
    return $ret
  fi
}

function __kc_temp() {
  local CLUSTER=${1:-""}
  local ret
  
  if [[ -z ${CLUSTER} ]]; then
    CLUSTER=$(kubectl config current-context)
    ret=$?
    if [[ $ret -ne 0 ]]; then 
      return $ret
    fi
  fi

  local NEW_KUBECONFIG=$(mktemp)
  kubectl config view --minify --flatten --context=${CLUSTER} > ${NEW_KUBECONFIG} 2>/dev/null
  ret=$?
  if [[ $ret -ne 0 ]]; then
    return $ret
  fi
  chmod 600 ${NEW_KUBECONFIG}
  export KUBECONFIG=${NEW_KUBECONFIG}
}
