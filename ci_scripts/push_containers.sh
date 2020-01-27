# !/bin/bash

source ci_scripts/variables.sh
ROOTDIR=`pwd`

for IMAGE_NAME in ${IMAGE_NAMES[@]}; do
    cd $ROOTDIR/docker/$IMAGE_NAME
    IMAGE_TAG=`python $ROOTDIR/ci_scripts/get_tag.py`
    docker build -t cachengo/$IMAGE_NAME-$AARCH:$IMAGE_TAG .
    #docker tag cachengo/$IMAGE_NAME:latest cachengo/$IMAGE_NAME-$AARCH:$IMAGE_TAG
    docker push cachengo/$IMAGE_NAME-$AARCH:$IMAGE_TAG
done
