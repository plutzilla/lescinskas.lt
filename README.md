# Synopsis

This repository is a content for my personal weblog: [lescinskas.lt](https://lescinskas.lt)

The site is generated using [Jekyll](http://jekyllrb.com).

You can use all the content of this weblog, as long as it meets [Creative Commons Attribution](https://creativecommons.org/licenses/by/4.0/) license.

## Build

### Docker build

Docker container can be used both to build the site and serve the content while composing blogposts.

Building the static site:

```bash
docker run -v $(pwd):/srv/jekyll -e JEKYLL_ENV=production jekyll/minimal:4 jekyll build -s src -d _site
```

Starting the local server to watch changes while editing the content (including drafts):

```bash
docker-compose up
```

The container listens to 4000 port which is forwarded to `localhost:8080`

### Deployment

The site is deployed using GH actions. See `.github/workflows` for more info.

Please share your feedback via email: paulius.lescinskas@gmail.com
