FROM fedora:38

RUN dnf install -y gcc-c++ make && \
    dnf -y install nodejs && \
    npm install --global yarn && \
    yarn config set python /usr/bin/python3

WORKDIR /opt/build

COPY . .

RUN chown -R 1000 /opt/build && \
    ls -lat /opt/build && \
    pwd && \
    yarn install && \
    yarn tsc && \
    yarn build:backend

USER 1000

ENTRYPOINT ["yarn", "start"]
