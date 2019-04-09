FROM ubuntu:18.04

# Install main packages
RUN apt-get update \
  && apt-get install -y curl

# Install sysrepo + dependencies
RUN curl -OL https://github.com/muscariello/build-scripts/raw/master/deb/libyang_0.16-r2_amd64.deb \
  && curl -OL https://github.com/muscariello/build-scripts/raw/master/deb/sysrepo_0.7.7_amd64.deb \
  && curl -OL https://github.com/muscariello/build-scripts/raw/master/deb/libnetconf2_0.12-r1_amd64.deb \
  && curl -OL https://github.com/muscariello/build-scripts/raw/master/deb/netopeer2_0.7-r1_amd64.deb \
  && curl -OL https://jenkins.fd.io/job/hicn-sysrepo-plugin-verify-master/lastSuccessfulBuild/artifact/scripts/build/hicn_sysrepo_plugin-19.01-176-release-Linux.deb
RUN apt-get install -y ./libyang_0.16-r2_amd64.deb ./sysrepo_0.7.7_amd64.deb \
  ./libnetconf2_0.12-r1_amd64.deb ./netopeer2_0.7-r1_amd64.deb

# Install sysrepo
RUN apt-get install -y ./hicn_sysrepo_plugin-19.01-176-release-Linux.deb --no-install-recommends
