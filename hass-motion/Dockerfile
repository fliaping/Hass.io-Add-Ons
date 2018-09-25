ARG BUILD_FROM
FROM $BUILD_FROM

ARG TIMEZONE

LABEL io.hass.version="VERSION" io.hass.type="addon" io.hass.arch="armhf|aarch64|amd64"

ENV LANG C.UTF-8

COPY run.sh /
RUN chmod a+x /run.sh && date && export TZ=":/usr/share/zoneinfo/"$TIMEZONE && date

CMD [ "/run.sh" ]


# FROM library/debian:latest

# RUN apt update && apt install motion ffmpeg v4l-utils fswebcam python-pip python-dev \
#     python-setuptools curl libssl-dev libcurl4-openssl-dev libjpeg-dev libz-dev --yes && \
#     pip install motioneye && \
#     mkdir -p /etc/motioneye && \
#     cp /usr/local/share/motioneye/extra/motioneye.conf.sample /etc/motioneye/motioneye.conf && \
#     mkdir -p /var/lib/motioneye && \
#     cp /usr/local/share/motioneye/extra/motioneye.systemd-unit-local /etc/systemd/system/motioneye.service && \
#     systemctl daemon-reload && \
#     systemctl enable motioneye && \
#     systemctl start motioneye