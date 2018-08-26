# Setup Kubernetes and docker-compose

In the Kubernetes folder we have 5 folders, of the 5 folders, 3 hold the deployment and service yaml files for the microservices while the other 2 have the yaml files for apache and the hysterix dashboard respectively.

Each deployment file will look something like this

    apiVersion: extensions/v1beta1
    kind: Deployment
    metadata:
    name: <Name of deployment>
    spec:
    replicas: 1
    template:
        metadata:
        labels:
            app: <deployment label>
        spec:
        containers:
            - name: <give container a name>
            image: <dockerhub username>/<image name>
            ports:
                - containerPort: <Port exposed on image>

Each service file will look something like this

    apiVersion: v1
    kind: Service
    metadata:
    name: <Name of deployment>
    spec:
    type: LoadBalancer
    ports:
        - port: 80
    selector:
        app: <deployment label>

We also have a docker compose which is used to build, start, pull or push all the docker images at the the same time to avoid repeating the same commands several times.

If you would like to build your own images, in the docker compose file, assuming you have a docker hub account, edit the image names replacing anywhere you see `thegaijin` with your dockerhub username.

After that, run

    docker-compose build

You can also push these images to your dockerhub account by running

    docker-compose push

if you are not signed in to your dockerhub account, run

    docker login -u <dockerhub username>

You will be prompted for a password, enter your docker password. After that you should be able tp push and pull images from your dockerhub account

## After successful deployment

Once the app has been deployed successfully, you should be able to see these pages.
