source ci_scripts/variables.sh

export DOCKER_CLI_EXPERIMENTAL=enabled
ROOTDIR=`pwd`

for IMAGE_NAME in ${IMAGE_NAMES[@]}; do
    cd $ROOTDIR/docker/$IMAGE_NAME
    IMAGE_TAG=`python $ROOTDIR/ci_scripts/get_tag.py`
    docker manifest create --amend cachengo/$IMAGE_NAME:$IMAGE_TAG cachengo/$IMAGE_NAME-x86_64:$IMAGE_TAG cachengo/$IMAGE_NAME-aarch64:$IMAGE_TAG
    docker manifest push --purge cachengo/$IMAGE_NAME:$IMAGE_TAG
done


