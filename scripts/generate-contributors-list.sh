#!/usr/bin/env bash
set -euo pipefail

here="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
contributors=$( cd "$here"/.. && git shortlog -es | cut -f2 | sed 's/^/- /' )

cat > "$here/../CONTRIBUTORS.txt" <<- EOF
	### Contributors

	$contributors

	**Updating this list**

	Please do not edit this file manually. It is generated using \`bash ./scripts/generate-contributors-list.sh\`. 
	If a name is misspelled or appearing multiple times: add an entry in \`./.mailmap\`.
EOF
