# android-ci
Build android native project in gitlab-ci

## steps:
* build `Dockerfile` with this:
```code
docker build -t <IMAGE_NAME>:<TAG_SLUG> .
```
e.g.
```code
docker build -t android-builder:latest .
```

* copy `.gitlab-ci.yml` to your root of android project path (‍`Dockerfile` is not required!)
* change `.gitlab-ci.yml`'s base image with `android-builder:latest` or your image name
* Add these variables in the gitlab's CI/CD variables:
  * ANDROID_KEYSTORE_FILE: Encrypted of your sign-key file with base64 algorithm
  * ANDROID_KEYSTORE_ALIAS: Sign-key's alias
  * ANDROID_KEYSTORE_PASSWORD: Sign-key's password
  * DISCORD_URL: Your discord's full url with token (`https://discord.com/api/webhooks/<CHANNEL_ID>/<TOKEN>`)
* Push code to `Gitlab` repository
* Done

## TO-DO
- [ ] Clean `.gitlab-ci.yml`
