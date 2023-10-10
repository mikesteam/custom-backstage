FROM fedora:38

RUN dnf install -y gcc-c++ make && \
    dnf -y install nodejs && \
    npm install --global yarn && \
    yarn -v

WORKDIR /opt/build

COPY . .

RUN chown -R 1000 /opt/build && \
    yarn install

USER 1000

ENTRYPOINT ["yarn", "start"]
