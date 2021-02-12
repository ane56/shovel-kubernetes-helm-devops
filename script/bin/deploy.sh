#!/bin/sh -e

WORKSPACE=${WORKSPACE:-"/opt/shovel-kh"}

# java options
JAVA_XMX=${JAVA_XMX:-"1g"}
JAVA_XMS=${JAVA_XMS:-"1g"}

start() {
    java \
        -Xmx"${JAVA_XMX}"  \
        -Xms"${JAVA_XMS}"  \
        -Dfile.encoding=UTF-8  \
        -jar "${WORKSPACE}"/shovel-kubernetes-helm-1.0.0.jar &

JAVA_PID="$!"
}

SCRIPT_ARG=$1

if [[ "${SCRIPT_ARG}" = "start" ]]; then
    start
else
    echo "unknown command"
    exit 1
fi

_kill() {
  kill $JAVA_PID
  wait $JAVA_PID
  exit 143
}

trap _kill SIGTERM
wait
