FROM --platform=${TARGETPLATFORM:-linux/amd64} ghcr.io/openfaas/classic-watchdog:0.3.3 as watchdog

# Latest version supported by gTTS: https://pypi.org/project/gTTS
FROM --platform=${TARGETPLATFORM:-linux/amd64} python:3.12-alpine

COPY --from=watchdog /fwatchdog /usr/bin/fwatchdog
RUN chmod +x /usr/bin/fwatchdog

RUN pip install gTTS

# Add non root user.
RUN mkdir -p /home/app
RUN addgroup -S app && adduser app -S -G app
RUN chown app /home/app

WORKDIR /home/app

USER app

COPY script.sh .
ENV cgi_headers true
ENV fprocess="/bin/sh ./script.sh"

EXPOSE 8080

CMD ["fwatchdog"]
