# OpenFaaS Text-to-Speech

[![OpenFaaS](https://img.shields.io/badge/openfaas-serverless-blue.svg)](https://www.openfaas.com)

## Deploying the function

Be sure to follow the instructions on the [FaaS repo](https://github.com/openfaas/faas) to deploy the Faas stack.

**Get the CLI**

You can install the [faas-cli](https://github.com/openfaas/faas-cli/) via `brew install faas-cli` or `curl -sSL https://get.openfaas.com | sudo sh`.

**Build and deploy**

Build and deploy your stack using the following commands:

```
$ faas-cli build -f text-to-speech.yml
$ faas-cli deploy -f text-to-speech.yml
```

You can build the container image manually and then deploy it to OpenFaaS
separately: first build the function image and push it to a container registry,
then deploy it by referencing the image directly:

```
faas-cli deploy --image=YOUR_REGISTRY/text-to-speech:TAG
```

Replace `YOUR_REGISTRY/text-to-speech:TAG` with the full image name you pushed
(for example: `ghcr.io/yourname/text-to-speech:latest`).

> [!IMPORTANT]
> Note: OpenFaaS Community Edition (CE) requires images to be available in a
> public container registry.

**Test**

Using `curl`, you can send a string to the function to generate an MP3 of speech:

```
$ curl http://localhost:8080/function/text-to-speech \
-d 'This is a test of OpenFaaS text to speech!' > output.mp3
```

The default language is `en`, but you can optionally provide an `X-Language`
header for a different language:

```
$ curl http://localhost:8080/function/text-to-speech \
-H 'X-Language: en-uk' \
-d 'This is a test of OpenFaaS text to speech!' > output.mp3
```

A partial list of supported language is
[here](https://gtts.readthedocs.io/en/latest/module.html#localized-accents)
