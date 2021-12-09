# syntax=docker/dockerfile:1
FROM ruby:3.0.2
ENV BUNDLER_VERSION=2.2.2
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client shared-mime-info ffmpeg ffmpegthumbnailer imagemagick
COPY . /caspar_rails_backend
WORKDIR /caspar_rails_backend
RUN bundle install
RUN rm -rf /caspar_rails_backend/public/uploads
RUN rails db:drop
RUN rails db:migrate
RUN rails db:seed

# Add a script to be executed every time the container starts.
COPY execute.sh /usr/bin/
RUN chmod +x /usr/bin/execute.sh
ENTRYPOINT ["execute.sh"]
EXPOSE 3001

# Configure the main process to run when running the image
CMD ["rails", "server","-p","3001", "-b", "0.0.0.0"]