# docker-compose-laravel

A pretty simplified Docker Compose workflow that sets up network of containers for local Laravel development. You can view the full article that inspired this repo [here](https://dev.to/aschmelyun/the-beauty-of-docker-for-local-laravel-development-13c0).

A repository of the same [here](https://github.com/aschmelyun/docker-compose-laravel)

## Difference

This is implementation leans more towards use of Alpine Linux due to its lightweight nature.
It also includes a few more items, some of which include:

- Supervisor
- Meilisearch
- phpmyadmin
- node
- certbot-nginx -- help for installation of ssl cert during production
- mysql volume -- persisting data during container restarts/shutdowns/recreation

## Usage

To get started, make sure you have [Docker installed](https://docs.docker.com/docker-for-mac/install/) on your system, and then clone this repository.

Next, navigate in your terminal to the directory you cloned this, and spin up the containers for the web server by running `docker-compose up -d --build site`.

After that completes, follow the steps from the [src/README.md](src/README.md) file to get your Laravel project added in (or create a new blank one).

Bringing up the Docker Compose network with `site` instead of just using `up`, ensures that only our site's containers are brought up at the start, instead of all of the command containers as well. The following are built for our web server, with their exposed ports detailed:

- **nginx** - `:80`
- **mysql** - `:3306`
- **php** - `:9000`
- **redis** - `:6379`
- **Meilisearch** - `:7700`
- **phpmyadmin** - `:8080`

Three additional containers are included that handle Composer, NPM, and Artisan commands _without_ having to have these platforms installed on your local computer. Use the following command examples from your project root, modifying them to fit your particular use case.

- `docker-compose run --rm composer update`
- `docker-compose run --rm npm run dev`
- `docker-compose run --rm artisan migrate`

## Permissions Issues

If you encounter any issues with filesystem permissions while visiting your application or running a container command, try checking out the read me [here](https://github.com/aschmelyun/docker-compose-laravel) for more tips.
