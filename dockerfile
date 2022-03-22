FROM debian:stable

# You are gonna have to enter the token buddy.
ENV token=""
# Secret repo currently used for the final product
ARG link=https://github.com/ComradeYellowCitrusFruit/Discord-Warsim.git
ARG name path=/Warsim

# Installs SQLite3
RUN apt-get update && apt-get install sqlite3

# Installs Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_current.x | bash -
RUN apt-get install -y nodejs

# Installs dependancies of Discord Warsim
RUN npm install discord.js -g
RUN npm install pm2 -g

# Downloads and updates perms for Discord Warsim
RUN git clone ${link} ${path}
COPY warsim.sh ${path}/bootstrap.sh
RUN chmod +x `ls ${path}/*.*`

WORKDIR ${path}
ENTRYPOINT [ "/bin/sh", "warsim.sh" ]
