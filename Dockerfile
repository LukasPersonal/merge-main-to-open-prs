##############################################
##############################################
## Dockerfile to run Merge Main to Open Prs ##
##############################################
##############################################

##################
# Get base image #
##################
FROM python:3.9-alpine

####################
# Run APK installs #
####################
RUN apk add --no-cache \
    bash \
    curl \
    git \
    git-lfs \
    jq \
    openssl-dev

###########################
# Get the build arguments #
###########################
ARG BUILD_DATE
ARG BUILD_REVISION
ARG BUILD_VERSION

#################################################
# Set ENV values used for debugging the version #
#################################################
ENV BUILD_DATE=$BUILD_DATE
ENV BUILD_REVISION=$BUILD_REVISION
ENV BUILD_VERSION=$BUILD_VERSION

#########################################
# Label the instance and set maintainer #
#########################################
LABEL com.github.actions.name="GitHub Merge into Prs" \
  com.github.actions.description="Merge main into open PR branches" \
  com.github.actions.icon="code" \
  com.github.actions.color="blue" \
  maintainer="GitHub DevOps <github_devops@github.com>" \
  org.opencontainers.image.created=$BUILD_DATE \
  org.opencontainers.image.revision=$BUILD_REVISION \
  org.opencontainers.image.version=$BUILD_VERSION \
  org.opencontainers.image.authors="GitHub DevOps <github_devops@github.com>" \
  org.opencontainers.image.url="https://github.com/LukasPersonal/merge-main-to-open-prs" \
  org.opencontainers.image.source="https://github.com/LukasPersonal/merge-main-to-open-prs" \
  org.opencontainers.image.documentation="https://github.com/LukasPersonal/merge-main-to-open-prs" \
  org.opencontainers.image.vendor="GitHub" \
  org.opencontainers.image.description="Merge main into open PR branches"

#############################
# Copy scripts to container #
#############################
COPY lib /action/lib


######################
# Set the entrypoint #
######################
ENTRYPOINT ["/action/lib/merge.sh"]
