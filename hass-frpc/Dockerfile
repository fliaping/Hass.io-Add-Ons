ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_ARCH

ARG FRP_VERSION="0.21.0"

LABEL io.hass.version="VERSION" io.hass.type="addon" io.hass.arch="armhf|aarch64|amd64|i386"
ENV LANG C.UTF-8


COPY run.sh /
RUN chmod a+x /run.sh


RUN apk add --no-cache wget jq && \
    if [ $BUILD_ARCH = "aarch64" ] ; then ARCH="arm64"; \
    elif [ $BUILD_ARCH = "armhf" ] ; then ARCH="arm"; \
    elif [ $BUILD_ARCH = "i386" ] ; then ARCH="386"; \
    elif [ $BUILD_ARCH = "amd64" ] ; then ARCH="amd64"; \
    else echo "unsuport arch:"$BUILD_ARCH; fi; \
    echo "arch:"$ARCH && FILE_NAME="frp_"$FRP_VERSION"_linux_"$ARCH && echo $FILE_NAME && \
    cd && wget --no-check-certificate "https://github.com/fatedier/frp/releases/download/v$FRP_VERSION/"$FILE_NAME".tar.gz" && \
    tar zxvf $FILE_NAME".tar.gz" && \
    mv $FILE_NAME /frp

VOLUME [ "/config" ]

CMD [ "/run.sh" ]