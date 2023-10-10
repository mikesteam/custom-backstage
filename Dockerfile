FROM fedora:38

RUN dnf -y install nodejs make python3 && \
    npm install --global yarn && \
    yarn config set python /usr/bin/python3

WORKDIR /opt/build

COPY . .

RUN chown -R 1000 /opt/build && \
    yarn install && \
    yarn tsc && \
    yarn build:backend

USER 1000

ENTRYPOINT ["yarn", "start"]