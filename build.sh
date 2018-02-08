!#/bin/bash

set -xe

ARTIFACTS_DIR=${ARTIFACTS_DIR:-~/workspace/puppet_artifacts}

puppet=`which puppet`
dirs=`ls modules`

cd modules
for dir in $dirs; do
    cd ${dir}
    ${puppet} module build
    mv -v pkg/*.tar.gz ${ARTIFACTS_DIR}
    cd ..
done
