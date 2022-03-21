FROM debian:stable
ARG token
RUN apt-get update && apt-get install sqlite3
RUN curl -fsSL https://deb.nodesource.com/setup_current.x | bash -
RUN apt-get install -y nodejs
RUN npm install discord.js
RUN git clone https://github.com/ComradeYellowCitrusFruit/Discord-Warsim.git

