FROM fedora:38

RUN dnf -y install nodejs && \
    npm install --global yarn

WORKDIR /opt/build

COPY . .

RUN chown -R 1000 /opt/build && \
    yarn install

USER 1000

ENTRYPOINT ["yarn", "start"]