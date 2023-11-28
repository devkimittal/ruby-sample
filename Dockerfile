# Use the official Ruby image as the base image
FROM ruby:2.6

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the local files into the container
COPY . .

# Run the Ruby script when the container starts
CMD ["ruby", "arrays.rb"]
