FROM ubuntu:16.04
MAINTAINER "Chris Patterson <pattersonc@ainfosec.com>"

ENV DEBIAN_FRONTEND noninteractive

# defaults for debify
ENV APTLY_DISTRIBUTION unstable
ENV APTLY_REPO_NAME debify
ENV APTLY_COMPONENT main
ENV KEYSERVER keyserver.ubuntu.com
ENV GNUPGHOME /.gnupg

# install aptly
RUN apt-get update && \
    apt-get install -y aptly && \
    apt-get clean

ADD debify.sh /debify.sh
ENTRYPOINT ["/debify.sh"]
