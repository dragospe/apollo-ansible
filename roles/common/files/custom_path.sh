dir="/usr/local/bin"
[[ ":$PATH:" != *":${dir}:"* ]] && export PATH="${dir}:${PATH}"
