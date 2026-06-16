#!/bin/bash
MACHINE=~/Desktop/machine
OUT=$MACHINE/out/coverage
mkdir -p $OUT
sudo find $MACHINE -name "coverage.json" -exec chmod 666 {} \; 2>/dev/null

for repo in omnibioai-tes omnibioai-lims omnibioai_sdk omnibioai-rag \
            omnibioai-toolserver omnibioai-model-registry omnibioai-tool-runtime \
            omnibioai-control-center omnibioai-dev-hub omnibioai-iam-client \
            omnibioai-security-sdk omnibioai-policy-engine omnibioai-security-audit \
            omnibioai-hpc-policy-engine omnibioai-workflow-bundles omnibioai-videos \
            omnibioai-auth omnibioai; do
  path=$MACHINE/$repo
  [ ! -d "$path" ] && continue
  echo "Running $repo..."
  cd $path
  python3 -m pytest --cov=. --cov-report=json --tb=no -q 2>/dev/null
  [ -f coverage.json ] && cp coverage.json $OUT/$repo.json && echo "✅ $repo"
done
echo "All done!"
