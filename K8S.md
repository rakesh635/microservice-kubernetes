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

Once the app has been deployed successfully, you should be able to headover to the Kubernetes dashboard to see the resources. To access the dashboard, in the Jenkins instance, run

    kubectl config view

In the output you will see a username and password. Head over to the `api.<your_cluster_name>/ui` url. It will redirect you to a page where you are prompted for login credentials. Enter the `username` as admin(it's always admin) and the password from the config output. On the next page, select `Token` and enter the same password. You will then be logged into your clusters dashboard

![screen shot 2018-08-25 at 19 13 39](https://user-images.githubusercontent.com/5388763/44630290-9ca95680-a963-11e8-904c-c99875e69eb1.png)

From the dashboard under services you should be able to see to external dns loadbalancer URLs.
If you click on them, you should be able to see the applications pages.

Home page
<img width="888" alt="screen shot 2018-08-25 at 19 19 34" src="https://user-images.githubusercontent.com/5388763/44629378-1e46b780-a957-11e8-9605-e8cff8650093.png">)

Customer page
<img width="1680" alt="screen shot 2018-08-25 at 19 21 38" src="https://user-images.githubusercontent.com/5388763/44630190-56072c80-a962-11e8-9239-3a5afd9b7484.png">

Add customer
<img width="1668" alt="screen shot 2018-08-25 at 19 21 56" src="https://user-images.githubusercontent.com/5388763/44630205-9666aa80-a962-11e8-891e-e1320d96fc8c.png">

Items
<img width="1680" alt="screen shot 2018-08-25 at 19 19 52" src="https://user-images.githubusercontent.com/5388763/44630215-ad0d0180-a962-11e8-88da-c05621545405.png">

Find an Item
<img width="948" alt="screen shot 2018-08-25 at 19 18 51" src="https://user-images.githubusercontent.com/5388763/44630222-ca41d000-a962-11e8-9dba-fabfd3966434.png">
