FROM hexpm/elixir:1.12.3-erlang-24.1.7-alpine-3.14.2

RUN apk update && apk add openssh git bash && rm -rf /var/cache/apk
# in case of weird ssh issues - re-enable for verbose git/ssh logging.
# RUN git config  --global core.sshCommand "ssh -vvv"

WORKDIR /opt/app

COPY mix.lock . 
COPY mix.exs . 

RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts

RUN --mount=type=ssh mix do deps.get, deps.compile 

COPY lib lib

RUN mix compile 

COPY test test 

RUN MIX_ENV=test mix do deps.get, test

COPY rel rel 

RUN MIX_ENV=prod mix release 

ENTRYPOINT ["/opt/app/_build/prod/rel/rancher_parent/bin/rancher_parent"]

CMD ["start_iex"]

