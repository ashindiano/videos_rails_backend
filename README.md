Setup:
======

Run the following command to install the system dependencies 

    brew install shared-mime-info

    brew install ffmpeg

    brew install ffmpegthumbnailer

    brew install imagemagick


Run the following command to install the rails gem dependencies

    bundle install


Run the following commands to create DB table and seed the Initial Data (Categories)

    rails db:migrate

    rails db:seed


Server:
=======

To the run the server runt the following command. It is Strongly recommended to run on Port 3001 since the UI is dependant on it

    rails server -p 3001


DOCKER COMPOSE:
===============

To create a docker image and run a container please run the following command

    docker-compose run --service-ports --no-deps web



Note:  This might update the Gemfile.lock based on the os and the docker container it runs,
 Please make sure to run the following command if you want the rails server again
    git checkout Gemfile.lock



Major Api Endpoints - Usually we create a Swagger.yml for API contracts
====================

        GET    /api/v1/videos  - Get all Videos based on basic pagination 

               This endpoint response has VIDEOS details included with CATEGORIES

        POST   /api/v1/videos  - Create New Video entry
        GET    /api/v1/categories - Get all categories list


Things implemented
===================
    1. associations between categories and videos (has_many and belongs_to)
    2. basic Model level validations
    3. Default scopes for active records
    4. Routes as resources
    5. Docker Containerization
    6. Video upload process to capture Thumbnail in 3 different sizes
    7. Carrierware Uploader


Things that would be handled on actual environment
====================================================
    1. cors implementation
    2. Authentication and authorization ( SSO or Stand Alone )
    3. inmemory or redis caching to optimize record fetch based on ENV
    4. concerns if complex business logic involved
    5. rspec unit testcases on models and requests
    6. branch based deployment Pipelines
    7. Videos or assets uploaded to S3 storage or similar storage