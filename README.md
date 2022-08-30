# Docker-env

## Usage

### General

This Docker container is provided to students for use in developing their CIS 553 projects (NS-3 simulations).  It contains the necessary environment and applications required to compile and run the code. 

### Preparations

1. Install Docker Desktop (version 3.0+). For Windows, we recommend setting up WSL2.
1. Download the files from this repository
1. Copy `Dockerfile` and `docker-compose.yml` to your course projects folder.

### First-time Setup

1. Run `docker-compose build cis553` to compile the docker image locally. This will take a few minutes.
2. Run `docker-compose run --rm cis553` to launch a Docker Container. 
  - `--rm` will clean up the container when it is finished.
  - The home directory `/home/cis553`, also known as `~`, is synchronized with the folder, where you put the `docker-compose.yml`, in your Host System.

You should now be inside your docker image, with current folder at `/home/cis553`. You can use `pwd` to check.

You will log into the container as user `cis553` with password `mcit`. The password is used just in case you occationally need sudo previlege.

Files in your project directory will be accessible from both your host OS and from within the Docker container.  This will allow you to edit the files using an IDE (such as VS Code) on your host OS and run / compile your project from within the Docker container. 

#### Note to M1 Mac users

In some cases, the `docker-compose build cis553` command will throw an error.  This can be fixed by either:
1. running `docker compose build cis553` (no '-' between docker and compose) or
2. In the Docker Desktop General Preferences, select `Use Docker Compose V2`

More information can be found at: https://docs.docker.com/desktop/mac/apple-silicon/

### All Future Log-ins

Just open your course projects folder, and run `docker-compose run --rm cis553`.

### Multiple Sessions

To establish multiple sesssion to the same
 container, call `docker exec -it [container_id] bash` after booting the first window with `docker-compose run cis553`. You can get the `container_id` by running `docker ps` in the new terminal window. Note that if you exit the container in the original terminal, all other sessions will be terminated.  

### About `docker-compose`

The following is the offical definition of docker-compose:

> Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application’s services. Then, with a single command, you create and start all the services from your configuration.

In CIS 553, we only use `docker-compose` to start one service which is your virtual machine. But `docker-compose` make the command consice and convient because we can predefine the configuration in `docker-compose.yml`.

## Resources

- [Docker Tutorial for Beginners - A Full DevOps Course on How to Run Applications in Containers](https://www.youtube.com/watch?v=fqMOX6JJhGo)
- [Docker Workshop](https://ipfs.io/ipfs/bafykbzacedzdnp34xeneqcaxcot7gvxpw55l5qrvgic6ma7tsoshfvpxvwev6?filename=Vincent%20Sesto%20et%20al.%20-%20The%20Docker%20Workshop_%20Learn%20how%20to%20use%20Docker%20containers%20effectively%20to%20speed%20up%20the%20development%20process-Packt%20Publishing%20%282020%29.pdf)
- https://forums.docker.com/t/can-containers-be-run-with-it-in-compose/20090/2
