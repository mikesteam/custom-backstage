FROM fedora:38

ENV NODE_VERSION=18.0
ENV NVM_DIR=/root/.nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
RUN . "$NVM_DIR/nvm.sh" \
    && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" \
    && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" \
    && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"

RUN npm install -g yarn

WORKDIR /opt/build

COPY . .

RUN chown -R 1000 /opt/build && \
    yarn install

USER 1000

ENTRYPOINT ["yarn", "start"]
