LABEL maintainer "Jeremy Seago <seagoj@gmail.com>"

RUN apt-get update && apt-get install -y \
	build-essential \
	ca-certificates \
	git \
	qmlscene \
	qt5-qmake \
	qt5-default \
	qtdeclarative5-dev \
	qml-module-qtquick-controls \
	qml-module-qtgraphicaleffects \
	qml-module-qtquick-dialogs \
	qml-module-qtquick-localstorage \
	qml-module-qtquick-window2 \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 --recursive https://github.com/thestinger/termite.git /src
WORKDIR /src
RUN make

ENTRYPOINT [ "/src/termite" ]