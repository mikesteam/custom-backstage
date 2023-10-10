FROM registry.access.redhat.com/ubi9/ubi:9.2

RUN dnf install nodejs \
    npm install --global yarn \

USER yarn

WORKDIR /opt/build

COPY . .

RUN chown -R yarn /opt/build \
    yarn install

ENTRYPOINT ["yarn", "start"]